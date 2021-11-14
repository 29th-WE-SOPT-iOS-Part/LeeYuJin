//
//  UserSignService.swift
//  Youtube-Clone
//
//  Created by 이유진 on 2021/11/14.
//

import Foundation
import Alamofire

struct UserSignService{
    static let shared = UserSignService()
    
    func login(email: String,
               password: String,
               completion: @escaping (NetworkResult<Any>) -> (Void)){
        
        
        let url = APIConstants.loginURL
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let body: Parameters = [
            "email": email,
            "password": password
        ]
        
        let dataRequest = AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
        case .success:
            guard let statusCode = dataResponse.response?.statusCode else {return}
            guard let value  = dataResponse.value else {return}
            let networkResult = self.judgeLoginStatus(by: statusCode, value)
            completion(networkResult)
        case .failure(let err):
            print(err)
            completion(.networkFail)
        }
            
    }
        
    }
    
    
    func readUserDataUsingQuery(email: String,
                      completion: @escaping (NetworkResult<Any>) -> (Void)){
        
        let url = APIConstants.readUserURL
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let query: Parameters = ["email" : email]
        
        let dataRequest = AF.request(url,
                                     method: .get,
                                     parameters: query,
                                     encoding: URLEncoding.queryString,
                                     headers: header)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value  = dataResponse.value else {return}
                let networkResult = self.judgeLoginStatus(by: statusCode, value)
                completion(networkResult)
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
            
            
        }
        
    }
    
    
    
    private func judgeLoginStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        
        switch statusCode{
        case 200: return isValidLoginData(data: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    func readUserData(userId: Int,
                      completion: @escaping (NetworkResult<Any>) -> (Void)){
        
        let url = APIConstants.readUserURL + "\(userId)"
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let dataRequest = AF.request(url,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value  = dataResponse.value else {return}
                let networkResult = self.judgeLoginStatus(by: statusCode, value)
                completion(networkResult)
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
            
            
        }
        
    }
    
 private func isValidLoginData(data: Data) -> NetworkResult<Any>{
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(LoginResponseData.self, from: data)
        else {return .pathErr}
        return .success(decodedData)
    }
}


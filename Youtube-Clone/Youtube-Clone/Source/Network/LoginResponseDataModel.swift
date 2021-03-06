//
//  LoginResponseDataModel.swift
//  Youtube-Clone
//
//  Created by 이유진 on 2021/11/14.
//

import Foundation

struct LoginResponseData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: LoginResultData?
}



struct LoginResultData: Codable {
    let id: Int
    let email: String
}

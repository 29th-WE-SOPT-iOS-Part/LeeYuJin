//
//  APIConstants.swift
//  Youtube-Clone
//
//  Created by 이유진 on 2021/11/14.
//

import Foundation

struct APIConstants {
    
    static let baseURL = "https://asia-northeast3-we-sopt-29.cloudfunctions.net/api"
    
    
    static let loginURL = baseURL + "/user/login"
    static let readUserURL = baseURL + "/user/"
    static let joinURL = baseURL + "/user/signup"
}

//
//  JoinResponseDataModel.swift
//  Youtube-Clone
//
//  Created by 이유진 on 2021/11/14.
//

import Foundation

struct JoinResponseData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: JoinResultData?
}



struct JoinResultData: Codable {
    let id: Int
    let name, email: String
}

//
//  Model.swift
//  iosCodeCheckSwiftUI
//
//  Created by 鎌田歩夢 on 2022/03/13.
//


import SwiftUI
import Alamofire
import Combine
import Kingfisher


struct Response: Codable {
    let items: [Items]
}
struct Items: Codable {
    let fullName: String
    let owner : Owner
}


struct Owner: Codable {
    let avatarURL: String
}




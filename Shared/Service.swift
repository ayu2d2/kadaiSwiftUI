//
//  Service.swift
//  iosCodeCheckSwiftUI
//
//  Created by 鎌田歩夢 on 2022/03/13.
//

import SwiftUI
import Alamofire
import Combine
import Kingfisher
final class GithubService {
    private let decoder : JSONDecoder
    private let username : String
    private let password : String
    
    init() {
        let decoder = JSONDecoder.init()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        self.decoder = decoder
        let filePath = Bundle.main.path(forResource: "Config", ofType: "plist")
        let plist = NSDictionary(contentsOfFile: filePath!)
        username = plist?.object(forKey: "ghUserName") as! String
        password = plist?.object(forKey: "ghPassword") as! String
        
    }
    func search(matching query: String)->
    AnyPublisher<Response, AFError> {
        let parameters = ["q": query]
        return
        AF.request("https://api.github.com/search/repositories", method: .get, parameters: parameters)
            .authenticate(username: username, password: password)
            .publishDecodable(type: Response.self, decoder: decoder)
            .value()
    }
        
    
}

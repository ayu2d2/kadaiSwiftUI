//
//  ViewModel.swift
//  iosCodeCheckSwiftUI
//
//  Created by 鎌田歩夢 on 2022/03/13.
//

import SwiftUI
import Combine
import Alamofire
final class ViewModel :
    ObservableObject {
    @Published var query : String = ""
    @Published private(set) var response: Response = Response(items: [])
    var tokens = [AnyCancellable]()
    private let service = GithubService()
    
    init() {
        $query
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .flatMap { query in
                self.service.search(matching: query)
                    .replaceError(with: Response(items: []))
            }
            .receive(on: RunLoop.main)
            .assign(to: &$response)
    }
}

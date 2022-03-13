//
//  Home.swift
//  iosCodeCheckSwiftUI
//
//  Created by 鎌田歩夢 on 2022/03/13.
//

import SwiftUI
import Alamofire
import Combine
import Kingfisher

struct Home: View {
    @StateObject var model = ViewModel()
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("GitHubのリポジトリーを検索できるよー", text: $model.query)
                    
                    Button(action: {
                        model.query = ""
                    }, label: {
                        Text("cancel")
                    })
                }
                List {
                    ForEach(model.response.items, id:\.fullName) {
                        repository in
                        HStack {
                            KFImage(URL(string: repository.owner.avatarURL))
                                .resizable()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                            Text(repository.fullName)
                        }
                    }
                }
            }
            .navigationTitle("Root  View Controller")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


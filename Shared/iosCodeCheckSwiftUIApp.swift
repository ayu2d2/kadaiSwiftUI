//
//  iosCodeCheckSwiftUIApp.swift
//  Shared
//
//  Created by 鎌田歩夢 on 2022/03/13.
//

import SwiftUI

@main
struct iosCodeCheckSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

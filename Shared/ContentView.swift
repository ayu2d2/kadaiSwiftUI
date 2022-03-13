//
//  ContentView.swift
//  Shared
//
//  Created by 鎌田歩夢 on 2022/03/13.
//
import SwiftUI
struct ContentView: View {
    // Do actions when animation has been finished....
    @State var endAnimation: Bool = false
    @State var animateHome: Bool = false
    
    var body: some View {

        ZStack{
            Home()
                .offset(y: endAnimation ? 0 : getRect().height)
            
            SplashScreen(endAnimation: $endAnimation)
        }
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

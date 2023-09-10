//
//  M_Proven_PortfolioApp.swift
//  M-Proven-Portfolio
//
//  Created by Mike-Proven on 9/4/23.
//

import SwiftUI

 @main
struct M_Proven_PortfolioApp: App {
    // showPageView is a state I use in a switch to change page views
    @State var showPageView = "disc_page"
    
    var body: some Scene {
        WindowGroup {
            switch showPageView{
            case "con_page":
                ContentView(showPageView: $showPageView)
                    .transition(.move(edge: .bottom))
            default:            // add below args
                DiscView(showPageView: $showPageView)
                    .transition(.move(edge: .bottom))
            }
        }
    }
}

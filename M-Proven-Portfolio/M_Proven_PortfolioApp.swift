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
    
    // functions in a ViewModel object
    @StateObject var taskViewModel: TaskViewModel = TaskViewModel()
    
    var body: some Scene {
        WindowGroup {
            switch showPageView{
            case "task_page":
                TaskView(showPageView: $showPageView)
                    .environmentObject(taskViewModel)
            case "con_page":
                ContentView(showPageView: $showPageView)
            default:            // add below args
                DiscView(showPageView: $showPageView)
            }
        }
    }
}

//
//  ContentView.swift
//  M-Proven-Portfolio
//
//  Created by Mike-Proven on 9/4/23.
//

///  Content is a combination of Features I can do and how much it might cost
///        Try to give a menu of example apps and features as a sample

import SwiftUI

struct ContentView: View {
    // for the switch to change views
    @Binding var showPageView: String
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                NavigationLink("To Do App", destination: ToDoView()
                    .navigationTitle("Tasks")
                    .navigationBarItems(trailing: EditButton())
                )
            }
            .navigationTitle(Text("Services"))
            .toolbarBackground(Color.cyan, for: .automatic)
            .navigationBarTitleDisplayMode(.automatic)
        }
        
    } // end body
} // end view



//--------------------PREVIEW
//   add @State declaration then add view you are on with params
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        @State var showPageView = ""
        ContentView(showPageView: $showPageView)
    }
}

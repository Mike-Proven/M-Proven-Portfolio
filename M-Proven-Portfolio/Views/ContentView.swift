//
//  ContentView.swift
//  M-Proven-Portfolio
//
//  Created by user01 on 9/4/23.
//

///  Content is a combination of Features I can do and how much it might cost
///        Try to give a menu of example apps and features as a sample

import SwiftUI

struct ContentView: View {
    // for the switch to change views
    @Binding var showPageView: String    
    var body: some View {
        ZStack {
            Button {showPageView = "disc_page"}
                label: { Text("Some text")}
            
        } // end z
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

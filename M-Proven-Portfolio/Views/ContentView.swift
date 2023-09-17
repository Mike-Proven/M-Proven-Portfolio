//
//  ContentView.swift
//  M-Proven-Portfolio
//
//  Created by Mike-Proven on 9/4/23.
//


import SwiftUI

struct ContentView: View {
    // for the switch to change views
    @Binding var showPageView: String
    
    var body: some View {
        ZStack (alignment: .leading) { // zstack 1
            Color(hue: 0.60, saturation: 0.16, brightness: 0.97).ignoresSafeArea() // bottom of z stack
            //--- THE LAYER ABOVE Background
            
            ScrollView {
                Button {
                    showPageView = "task_page"
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: 400)
                            .foregroundColor(Color.blue)
                            .shadow(radius: 6)
                        Text("To Do List")
                            .font(.largeTitle)
                            .fontWeight(.light)
                            .foregroundColor(.white)
                    } // end button bar
                    .frame(height: 50)
                } // end lbl
                // Button 2
                Button {
                    showPageView = "disc_page"
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: 400)
                            .foregroundColor(Color.blue)
                            .shadow(radius: 6)
                        Text("App Description")
                            .font(.largeTitle)
                            .fontWeight(.light)
                            .foregroundColor(.white)
                    } // end button bar
                    .frame(height: 50)
                } // end lbl
            } // end scroll
            .padding()
            
           
        } // zstack 1
    } // end body
} // end view struct


//--------------------PREVIEW
//   add @State declaration then add view you are on with params
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        @State var showPageView = ""
        ContentView(showPageView: $showPageView)
    }
}

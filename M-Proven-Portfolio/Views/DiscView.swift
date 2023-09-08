//
//  DiscView.swift
//  M-Proven-Portfolio
//
//  Created by user01 on 9/4/23.
//

///  DiscView is a combination of Disclaimer (not everything might be working right now)
///  and About me as a developer

import SwiftUI

struct DiscView: View {
    // for the switch to change views
    @Binding var showPageView: String
    var body: some View {
        ZStack (alignment: .topLeading) {
            Color.black.ignoresSafeArea() // bottom of z stack
            //--- THE LAYER ABOVE THE FULL BLACK
            VStack {  // blue grad
                Rectangle()
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                
            } // end V1
            VStack {  // text and pics
                Text("version 0.0.1 beta")
                    .foregroundColor(Color.cyan)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(10)
                    .multilineTextAlignment(.leading)
                
                    Text("Disclaimer: \nNot everything in this app might be working. \n\nIt is still in development. \n\nThis app is intended to be a portfolio to show the services I can provide.")
                        .foregroundColor(Color.cyan)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(10)
                        .multilineTextAlignment(.leading)
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        showPageView = "con_page"
                    } label: {
                        VStack {
                            Text("click me")
                            
                            Image("profile")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150, alignment: .center)
                                .clipShape(Circle())
                                .shadow(color: Color.cyan, radius: 20)
                        }
                    }
                } // end H
            } //end V2
            .padding()
        } // end Z
    } // end body
} //end struct



//--------------------PREVIEW
//   add @State declaration then add view you are on with params
struct DiscView_Previews: PreviewProvider {
    static var previews: some View {
        @State var showPageView = ""
        DiscView(showPageView: $showPageView)

    }
}

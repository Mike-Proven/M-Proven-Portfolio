//
//  NoTasks.swift
//  M-Proven-Portfolio
//
//  Created by Mike-Proven on 9/15/23.
//

import SwiftUI

struct NoTasks: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView {
            Text("No tasks! \n\nAdd more to do?")
                .font(.title)
                .fontWeight(.semibold)
                .padding(40)
            NavigationLink(destination: AddTaskView(), label: {
                Text("Add something?! 👀")
                    .foregroundColor(.white)
                    .font(.title3)
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(animate ? Color.blue : Color.red)
                    .cornerRadius(30)
            })
            .padding(.horizontal, animate ? 40 : 50)
            .shadow(
                color: animate ? Color.red.opacity(0.7) : Color.blue.opacity(0.7),
                radius: animate ? 20 : 30,
                x: 0.0,
                y: animate ? 50 : 30
            )
            .scaleEffect(animate ? 1.1 : 1.0)
            .offset(y: animate ? -8 : 0)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .onAppear(perform: addAnimation)
    } // end body
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoTasks_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoTasks()
        }
        .navigationTitle("title")
    }
}

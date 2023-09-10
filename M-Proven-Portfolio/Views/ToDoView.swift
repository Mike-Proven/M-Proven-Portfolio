//
//  ToDoView.swift
//  M-Proven-Portfolio
//
//  Created by user01 on 9/10/23.
//

import SwiftUI

struct ToDoView: View {
    // ... I'm thinking I might rather do nav manually for more control
    // @Environment(\.presentationMode) var presMode used to make back buttons, etc
    @State var tasks: [String] = [
        "update README.md", "update documentation and comments", "add style selector buttons to sample Services and the menu", "add new styles as functions in swift files", "...so much to learn"
    ]
    
    var body: some View {
        List {
            Section(header: Text("Do these tasks.")) {
                ForEach(tasks, id: \.self) {
                    task in Text(task)
                }
                .onDelete(perform: {indexSet in
                    delete(indexSet: indexSet)
                })
                .onMove(perform: {indices, newOffset in move(indices: indices, newOffset: newOffset)
                })
            }
        }
    }
    
    
    func delete(indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
    }
    
    
    func move(indices: IndexSet, newOffset: Int) {
        tasks.move(fromOffsets: indices, toOffset: newOffset)
    }
    
}

struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView()
    }
}

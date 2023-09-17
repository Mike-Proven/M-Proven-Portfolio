//
//  AddTaskView.swift
//  M-Proven-Portfolio
//
//  Created by Mike-Proven on 9/15/23.
//

import SwiftUI

struct AddTaskView: View {
    @State private var textAddString: String = ""
    // ViewModel connection
    @EnvironmentObject var taskViewModel: TaskViewModel
    // dismiss the add task view
    @Environment(\.presentationMode) var presentationMode
    // alert for failed text
    @State var alertText: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
            VStack {
                TextField("Enter your text here", text: $textAddString)
                    .textFieldStyle(.roundedBorder)
                Text("")
                    .alert(isPresented: $showAlert, content: getAlert)
                Spacer()
                Button(action: addButtonPressed, label: {
                    Text("Add Task!")
                        .foregroundColor(.white)
                        .font(.title3)
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(30)
                    
                }) // end button
            } // end vstack
        
        .padding()
        .navigationTitle("Create a new task?")
    } // end body
    
    func addButtonPressed() {
        if textIsValid() {
            taskViewModel.addTask(textAddString: textAddString)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    
    func textIsValid() -> Bool {
        if textAddString.count > 30 || textAddString.count < 3 {
            alertText = "Your task needs to be 3 to 30 characters long."
            showAlert.toggle()
            return false
        }
        return true
    }
    
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertText))
    }
    
} // end struct view

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView().environmentObject(TaskViewModel())
    }
}

//
//  DetailView.swift
//  First iOS app
//
//  Created by Kaur, Gurinder on 31/01/22.
//

import SwiftUI

struct DetailView: View {
    @Binding var task: Task
    var body: some View {
        VStack{
            Text(task.name)
            Text("Placeoholder for task discription")
            if(task.isComplete){
                Button("Reset"){
                    task.isComplete = false
                }
            }
            else{
                Button("Mark Complete"){
                    task.isComplete = true
                }
            }
            
        }
    }
}
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(task: Binding<Task>.constant(Task(name: "Test", isComplete: false, lastCompleted: nil)))
    }
}

//
//  ContentView.swift
//  First iOS app
//
//  Created by Kaur, Gurinder on 24/01/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var nightTasks : NightWatchTasks
    @State private var focusModeOn = false
    var body: some View {
        NavigationView {
            List{
                Section(header:TaskSectionHeader(headerSymbol: "sunset", headerText: "Daily Duty")){
                    let taskIndices = nightTasks.daily.indices
                    let tasks = nightTasks.daily
                    let taskIndexpair = Array(zip(tasks,taskIndices))
                    ForEach(taskIndexpair,id:\.0.id, content:{
                        task, index in
                        let nightTasksWrapper = $nightTasks
                        let taskBinding = nightTasksWrapper.daily
                        let theTaskBinding = taskBinding[index]
                        if focusModeOn == false || (focusModeOn && task.isComplete == false){
                            NavigationLink(
                                destination: DetailView(task: theTaskBinding),
                                label: {
                                    TaskRow(task: task)
                                })
                        }
                        
                    }).onDelete(perform: { indexSet in
                        nightTasks.daily.remove(atOffsets: indexSet)
                    })
                    .onMove(perform: { indices, newOffset in
                        nightTasks.daily.move(fromOffsets: indices, toOffset: newOffset)
                    })
                }
                Section(header:TaskSectionHeader(headerSymbol: "sunset", headerText: "Weekly Duty")){
                    let taskIndices = nightTasks.weekly.indices
                    let tasks = nightTasks.weekly
                    let taskIndexpair = Array(zip(tasks,taskIndices))
                    ForEach(taskIndexpair,id:\.0.id,content:{
                        task, index in
                        let nightTasksWrapper = $nightTasks
                        let taskBinding = nightTasksWrapper.weekly
                        let theTaskBinding = taskBinding[index]
                        if focusModeOn == false || (focusModeOn && task.isComplete == false) {
                            NavigationLink(
                                destination: DetailView(task: theTaskBinding),
                                label: {
                                    TaskRow(task: task)
                            })
                        }
                    }).onDelete(perform: { indexSet in
                        nightTasks.weekly.remove(atOffsets: indexSet)
                    })
                    .onMove(perform: { indices, newOffset in
                        nightTasks.weekly.move(fromOffsets: indices, toOffset: newOffset)
                    })
                }
                Section(header:TaskSectionHeader(headerSymbol: "sunset", headerText: "Monthly Duty")){
                    let taskIndices = nightTasks.monthly.indices
                    let tasks = nightTasks.monthly
                    let taskIndexpair = Array(zip(tasks,taskIndices))
                    ForEach(taskIndexpair,id:\.0.id,content:{
                        task, index in
                        let nightTasksWrapper = $nightTasks
                        let taskBinding = nightTasksWrapper.monthly
                        let theTaskBinding = taskBinding[index]
                        if focusModeOn == false || (focusModeOn && task.isComplete == false) {
                            NavigationLink(
                                destination: DetailView(task: theTaskBinding),
                                label: {
                                    TaskRow(task: task)
                            })
                        }
                    }).onDelete(perform: { indexSet in
                        nightTasks.monthly.remove(atOffsets: indexSet)
                    })
                    .onMove(perform: { indices, newOffset in
                        nightTasks.monthly.move(fromOffsets: indices, toOffset: newOffset)
                    })
                }
            }.listStyle(GroupedListStyle()).navigationTitle("My Duties")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing){
                    EditButton()
                }
                ToolbarItem(placement: .bottomBar) {
                    Toggle(isOn: $focusModeOn, label: {
                        /*@START_MENU_TOKEN@*/Text("Label")/*@END_MENU_TOKEN@*/
                    })
                }
            })
        }
    }
}



struct TaskSectionHeader: View {
    let headerSymbol: String
    let headerText: String
    var body: some View {
        HStack{
            Image(systemName: headerSymbol)
            Text(headerText)
        }.font(.title3)
    }
}

struct TaskRow: View {
    let task: Task
    var body: some View {
        VStack{
            if task.isComplete{
                HStack{
                    Image(systemName: "checkmark.square")
                    Text(task.name).foregroundColor(.gray).strikethrough()
                }
            }else{
                HStack{
                    Image(systemName: "square")
                    Text(task.name)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let nighttasks = NightWatchTasks()
        Group {
            ContentView(nightTasks: nighttasks)
            TaskRow(task: Task(name: "task", isComplete: true, lastCompleted: nil))
                .previewLayout(.fixed(width: 300, height: 70))
        }
    }
}

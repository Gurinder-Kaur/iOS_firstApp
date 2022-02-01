//
//  SwiftUIView.swift
//  First iOS app
//
//  Created by Kaur, Gurinder on 31/01/22.
//

import SwiftUI

struct DetailView: View {
    let task: Task
    var body: some View {
        VStack{
            Text(task.name)
            Text("Placeoholder for task discription")
            Text("Placeholder for mark complete button")
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView("")
    }
}

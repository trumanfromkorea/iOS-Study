//
//  ContentView.swift
//  ColorSlider
//
//  Created by 장재훈 on 2021/08/31.
//

import SwiftUI

struct ContentView: View {
    @State private var red: Double = 0
    @State private var green: Double = 0
    @State private var blue: Double = 0

    @State private var username: String = ""
    @State private var isEditing = false

    var body: some View {
        VStack {

            HStack {
                Text("RED : \(red)")
                Slider(value: $red, in: 0 ... 1, step: 0.01)
            }

            HStack {
                Text("GREEN : \(green)")
                Slider(value: $green, in: 0 ... 1, step: 0.01)
            }

            HStack {
                Text("BLUE : \(blue)")
                Slider(value: $blue, in: 0 ... 1, step: 0.01)
            }

            TextField(
                "User name (email address)",
                text: $username
            ) { isEditing in
                self.isEditing = isEditing
            } onCommit: {
                print("done")
            }
            .padding()
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .border(Color(UIColor.separator))
            Text(username)
                .foregroundColor(Color(red: red, green: green, blue: blue))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
    }
}

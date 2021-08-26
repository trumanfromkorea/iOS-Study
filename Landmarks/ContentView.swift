//
//  ContentView.swift
//  Landmarks
//
//  Created by trumanfromkorea on 2021/08/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
            }
            .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

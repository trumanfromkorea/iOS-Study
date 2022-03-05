//
//  ContentView.swift
//  WatchLandmarks Extension
//
//  Created by 장재훈 on 2021/09/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}

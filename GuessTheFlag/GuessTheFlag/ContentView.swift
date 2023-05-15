//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by csuftitan on 3/8/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color.red
                Color.blue
            }
            Color.pink
                .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
            Text("Some content")
                .foregroundColor(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

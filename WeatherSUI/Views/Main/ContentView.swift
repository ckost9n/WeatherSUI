//
//  ContentView.swift
//  WeatherSUI
//
//  Created by Konstantin on 28.09.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HomeView()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

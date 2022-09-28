//
//  HomeView.swift
//  WeatherSUI
//
//  Created by Konstantin on 28.09.2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            // MARK: - Background Color
            Color.background
                .ignoresSafeArea()
            
            // MARK: - Background Image
            Image("Background")
                .resizable()
                .ignoresSafeArea()
            
            // MARK: - House Image
            Image("House")
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.top, 257)
            
            VStack {
                Text("Montreal")
                    .font(.largeTitle)
                
                VStack {
                    Text("19°" + "\n" + "Mostly Clear")
                    
                    Text("H:24°   L:18°")
                        .font(.title3.weight(.semibold))
                }
                Spacer()
            }
            .padding(.top, 51)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}

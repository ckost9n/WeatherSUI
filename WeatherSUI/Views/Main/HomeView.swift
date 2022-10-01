//
//  HomeView.swift
//  WeatherSUI
//
//  Created by Konstantin on 28.09.2022.
//

import SwiftUI
import BottomSheet

enum BottomSheetPosition: CGFloat, CaseIterable {
    case top = 0.83 // 702/844
    case middle = 0.385 // 325/844
}

struct HomeView: View {
    @State var bottomSheetPosition: BottomSheetPosition = .middle
    
    var body: some View {
        NavigationView {
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
                
                VStack(spacing: -10) {
                    Text("Montreal")
                        .font(.largeTitle)
                    
                    VStack {
                        Text(attributedString)
                        
                        Text("H:24°   L:18°")
                            .font(.title3.weight(.semibold))
                        
                    }
                    Spacer()
                }
                .padding(.top, 51)
                
                // MARK: - Bottom Sheet
                BottomSheetView(position: $bottomSheetPosition) {
                    
                } content: {
                    ForecastView()
                }

                
                // MARK: - Tab Bar
                TabBar(action: {
                    bottomSheetPosition = .top
                })
            }
            .navigationBarHidden(true)
        }
    }
    
    private var attributedString: AttributedString {
        var string = AttributedString("19°" + "\n " + "Mostly Clear")
        
        guard let temp = string.range(of: "19°") else { return string }
        string[temp].font = .system(size: 96, weight: .thin)
        string[temp].foregroundColor = .primary
        
        guard let pipe = string.range(of: " | ") else { return string }
        string[pipe].font = .title3.weight(.semibold)
        string[pipe].foregroundColor = .secondary
        
        guard let weather = string.range(of: "Mostly Clear") else { return string }
        string[weather].font = .title3.weight(.semibold)
        string[weather].foregroundColor = .secondary
        
        return string
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}

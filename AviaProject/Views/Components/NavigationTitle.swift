//
//  NavigationTitle.swift
//  AviaProject
//
//  Created by Вероника Гера on 26.07.2023.
//

import SwiftUI

//Title for navigation bar
struct NavigationTitle: View {
    var body: some View {
        HStack(alignment: .center) {
            
            VStack(alignment: .center, spacing: getAdaptiveWidth(2)) {
                Text("Москва — Санкт-Петербург")
                    .font(.system(size: 15).weight(.semibold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.05, green: 0.07, blue: 0.11))
                
                Text("3 сентября, 1 чел")
                    .font(.system(size: 11))
                    .kerning(0.07)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.35, green: 0.39, blue: 0.45))
            }
            .padding(.horizontal, 0)
            .padding(.vertical, getAdaptiveWidth(5))
            .frame(height: getAdaptiveHeight(44), alignment: .center)
            
        }
        .padding(.leading, getAdaptiveWidth(82.5))
        .padding(.trailing, getAdaptiveWidth(82.5))
        .padding(.vertical, 0)
        .frame(width: getAdaptiveWidth(375), height: getAdaptiveHeight(44), alignment: .center)
        
    }
}

struct NavigationTitle_Preview: PreviewProvider {
    static var previews: some View {
        NavigationTitle()
    }
}

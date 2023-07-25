//
//  LowCost.swift
//  AviaProject
//
//  Created by Вероника Гера on 25.07.2023.
//

import SwiftUI

//Here I create a die for the cheapest ticket
struct LowCost: View {
    var body: some View {
        HStack(alignment: .center) {
            Text("Самый дешёвый")
                .font(.system(size: getAdaptiveWidth(13)).weight(.semibold))
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
        }
        .padding(.horizontal, getAdaptiveWidth(8))
        .padding(.vertical, 0)
        .frame(height: getAdaptiveHeight(20), alignment: .leading)
        .background(Color(red: 0.21, green: 0.78, blue: 0.41))
        .cornerRadius(100)
    }
}

struct LowCost_Preview: PreviewProvider {
    static var previews: some View {
        LowCost()
    }
}



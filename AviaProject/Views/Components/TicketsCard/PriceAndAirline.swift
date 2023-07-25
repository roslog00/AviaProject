//
//  PriceAndAirline.swift
//  AviaProject
//
//  Created by Вероника Гера on 26.07.2023.
//

import SwiftUI

extension TicketCard {
    @ViewBuilder
    func priceAndAirline() -> some View {
        
        //I made it so if there are less than 10 tickets, there will be a red inscription
        
        if availableTicketsCount < 10 {
            
            VStack(alignment: .leading, spacing: getAdaptiveWidth(2)) {
                HStack(alignment: .center, spacing: getAdaptiveWidth(12)) {
                    
                    //Price
                    Text("\(price) ₽")
                        .font(.system(size: getAdaptiveWidth(19)).weight(.semibold))
                      .foregroundColor(Color(red: 0.05, green: 0.45, blue: 1))
                      .frame(maxWidth: .infinity, alignment: .topLeading)
                    
                    //Logo airline company
                    Image(airlineLogo(airlineString: airlane))
                        .frame(width: getAdaptiveWidth(26), height: getAdaptiveHeight(26), alignment: .center)
                }
                .padding(0)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                //Text if there are less than 10 tickets left
                Text("Осталось \(availableTicketsCount) билетов по этой цене")
                .font(Font.custom("SF Pro Text", size: 13))
                .foregroundColor(Color(red: 0.87, green: 0.26, blue: 0.31))
                .frame(maxWidth: .infinity, alignment: .topLeading)
                
            }.padding(.horizontal, getAdaptiveWidth(16))
            .padding(.top, getAdaptiveWidth(16))
            .padding(.bottom, getAdaptiveHeight(12))
            .frame(maxWidth: .infinity, alignment: .topLeading)
            
        } else {
            //If there are more than 10 tickets
            VStack(alignment: .leading, spacing: getAdaptiveWidth(2)) {
                HStack(alignment: .center, spacing: getAdaptiveWidth(12)) {
                    //Price
                    Text("\(price)₽")
                    .font(.system(size: getAdaptiveWidth(19)).weight(.semibold))
                      .foregroundColor(Color(red: 0.05, green: 0.45, blue: 1))
                      .frame(maxWidth: .infinity, alignment: .topLeading)
                    
                    //Logo airline company
                    Image(airlineLogo(airlineString: airlane))
                        .frame(width: getAdaptiveWidth(26), height: getAdaptiveHeight(26), alignment: .center)
                }
                .padding(0)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, getAdaptiveWidth(16))
            .padding(.top, getAdaptiveWidth(16))
            .padding(.bottom, getAdaptiveHeight(12))
            .frame(maxWidth: .infinity, alignment: .topLeading)
            
        }
    }
}

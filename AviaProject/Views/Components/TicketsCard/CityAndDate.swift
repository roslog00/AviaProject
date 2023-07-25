//
//  CityAndDate.swift
//  AviaProject
//
//  Created by Вероника Гера on 26.07.2023.
//

import SwiftUI

extension TicketCard {
    @ViewBuilder
    func cityAndCardView() -> some View {
        //
        let formatter = Formatter()
        
        
        //Itinerary VStack, where can we see flight data
        ZStack{
            
            VStack(alignment: .leading, spacing: getAdaptiveWidth(12)) {
                
                //First HStack for info about departure
                HStack(alignment: .top, spacing: getAdaptiveWidth(12)) {
                    VStack(alignment: .leading, spacing: getAdaptiveWidth(2)) {
                        Text("\(fromCity)")
                            .font(.system(size: getAdaptiveWidth(15)).weight(.semibold))
                            .foregroundColor(Color(red: 0.05, green: 0.07, blue: 0.11))
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                        
                        Text("\(fromCityIATA)")
                            .font(.system(size: getAdaptiveWidth(13)))
                            .foregroundColor(Color(red: 0.35, green: 0.39, blue: 0.45))
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                    }
                    .padding(0)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    
                    VStack(alignment: .trailing, spacing: getAdaptiveWidth(2)) {
                        Text(formatter.getHourAndMinute(dateString: departureDateTime))
                            .font(.system(size: getAdaptiveWidth(15)).weight(.semibold))
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(red: 0.05, green: 0.07, blue: 0.11))
                            .frame(maxWidth: .infinity, alignment: .topTrailing)
                        
                        Text("\(formatter.getMonthAndDay(dateString: departureDateTime)), \(formatter.getWeekDay(dateString: departureDateTime))")
                            .font(.system(size: getAdaptiveWidth(13)))
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(red: 0.35, green: 0.39, blue: 0.45))
                    }
                    .padding(0)
                    
                }
                .padding(0)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                
                
                //Second HStack for info about arrival
                
                HStack(alignment: .top, spacing: getAdaptiveWidth(12)) {
                    VStack(alignment: .leading, spacing: getAdaptiveWidth(2)) {
                        Text("\(toCity)")
                            .font(.system(size: getAdaptiveWidth(15)).weight(.semibold))
                            .foregroundColor(Color(red: 0.05, green: 0.07, blue: 0.11))
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                        
                        Text("\(fromCityIATA)")
                            .font(.system(size: getAdaptiveWidth(13)))
                            .foregroundColor(Color(red: 0.35, green: 0.39, blue: 0.45))
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                    }
                    .padding(0)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    
                    VStack(alignment: .trailing, spacing: getAdaptiveWidth(2)) {
                        Text("\(formatter.getHourAndMinute(dateString: arrivalDateTime))")
                            .font(.system(size: getAdaptiveWidth(15)).weight(.semibold))
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(red: 0.05, green: 0.07, blue: 0.11))
                            .frame(maxWidth: .infinity, alignment: .topTrailing)
                        
                        Text("\(formatter.getMonthAndDay(dateString: arrivalDateTime)), \(formatter.getWeekDay(dateString: arrivalDateTime))")
                            .font(.system(size: getAdaptiveWidth(13)))
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(red: 0.35, green: 0.39, blue: 0.45))
                    }
                    .padding(0)
                }
                .padding(0)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                
                
            }
            .padding(.horizontal, getAdaptiveWidth(16))
            .padding(.vertical, 0)
            .frame(maxWidth: .infinity, alignment: .topLeading)
        }
        
    }
}

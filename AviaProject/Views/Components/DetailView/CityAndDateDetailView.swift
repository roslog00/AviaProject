//
//  CityAndDate.swift
//  AviaProject
//
//  Created by Вероника Гера on 28.07.2023.
//

import SwiftUI

extension BuyTicketView {
    @ViewBuilder
    func cityAndDateDetialView() -> some View {
        //
        let formatter = Formatter()
        
        //Itinerary VStack, where can we see flight data
        ZStack{
            
            VStack(alignment: .leading, spacing: getAdaptiveWidth(12)) {
                
                //First HStack for info about departure
                HStack(alignment: .top, spacing: getAdaptiveWidth(12)) {
                    VStack(alignment: .leading, spacing: getAdaptiveWidth(2)) {
                        Text("\(ticketsFromCity)")
                            .font(.system(size: getAdaptiveWidth(15)).weight(.semibold))
                            .foregroundColor(Color(red: 0.05, green: 0.07, blue: 0.11))
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                        
                        Text("\(ticketsFromCityIATA)")
                            .font(.system(size: getAdaptiveWidth(13)))
                            .foregroundColor(Color(red: 0.35, green: 0.39, blue: 0.45))
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                    }
                    .padding(0)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    
                    VStack(alignment: .trailing, spacing: getAdaptiveWidth(2)) {
                        Text(formatter.getHourAndMinute(dateString: ticketsDepartureDateTime))
                            .font(.system(size: getAdaptiveWidth(15)).weight(.semibold))
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(red: 0.05, green: 0.07, blue: 0.11))
                            .frame(maxWidth: .infinity, alignment: .topTrailing)
                        
                        Text("\(formatter.getMonthAndDay(dateString: ticketsDepartureDateTime)), \(formatter.getWeekDay(dateString: ticketsDepartureDateTime))")
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
                        Text("\(ticketsToCity)")
                            .font(.system(size: getAdaptiveWidth(15)).weight(.semibold))
                            .foregroundColor(Color(red: 0.05, green: 0.07, blue: 0.11))
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                        
                        Text("\(ticketsToCityIATA)")
                            .font(.system(size: getAdaptiveWidth(13)))
                            .foregroundColor(Color(red: 0.35, green: 0.39, blue: 0.45))
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                    }
                    .padding(0)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    
                    VStack(alignment: .trailing, spacing: getAdaptiveWidth(2)) {
                        Text(formatter.getHourAndMinute(dateString: ticketsArrivalDateTime))
                            .font(.system(size: getAdaptiveWidth(15)).weight(.semibold))
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(red: 0.05, green: 0.07, blue: 0.11))
                            .frame(maxWidth: .infinity, alignment: .topTrailing)
                        
                        Text("\(formatter.getMonthAndDay(dateString: ticketsArrivalDateTime)), \(formatter.getWeekDay(dateString: ticketsArrivalDateTime))")
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

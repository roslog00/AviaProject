//
//  TicketList.swift
//  AviaProject
//
//  Created by Вероника Гера on 25.07.2023.
//

import SwiftUI

struct TicketList: View {
    
    @State var detailViewToggle : Bool = false
    @State var result : [FlightTicket] = []
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .top) {
                Color(red: 0.94, green: 0.95, blue: 0.96).ignoresSafeArea(.all)
                
                VStack(spacing: getAdaptiveWidth(16)){
                    NavigationTitle()
                    
                    lowCostBuilder(tickets: result)
                }
            }.onAppear{
                Task{
                    result = try await APIServices().fetchData().results
                    result = sortTickets(flights: result)
                }
            }
            
        }
    }
}


struct TicketList_Preview: PreviewProvider {
    static var previews: some View {
        TicketList()
    }
}

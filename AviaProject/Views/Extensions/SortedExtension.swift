//
//  SortedExtension.swift
//  AviaProject
//
//  Created by Вероника Гера on 27.07.2023.
//

import Foundation
import SwiftUI

extension View {
    func sortTickets(flights: [FlightTicket]) -> [FlightTicket] {
        flights.sorted { $0.price.value < $1.price.value }
    }
}

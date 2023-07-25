//
//  SwitchLogo.swift
//  AviaProject
//
//  Created by Вероника Гера on 26.07.2023.
//

import SwiftUI

extension View {
    //Create func where name airline converting in string for picture logo
    func airlineLogo(airlineString: String) -> String {
        //Switching Airline for picture
        switch airlineString {
            case "Победа" : return "Carrier=DP Победа, On dark=False"
            case "Smartavia": return "Carrier=5N Смартавиа, On dark=False"
            case "S7" : return "Carrier=S7 S7, On dark=False"
            case "Аэрофлот" : return "Carrier=SU Аэрофлот, On dark=False"
            
        default: return "none"
        }
    }
}

//
//  DateFormater.swift
//  AviaProject
//
//  Created by Вероника Гера on 25.07.2023.
//

import Foundation

struct Formatter {
    
    //Convert date from string
    func convertDate(dateFromString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        guard let date = dateFormatter.date(from: dateFromString) else {
            return nil
        }
        
        return date
    }

    //Get month and date from string
    func getMonthAndDay(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        
        guard let date = convertDate(dateFromString: dateString) else {
            return ""
        }

        let monthAndDay = dateFormatter.string(from: date).dropLast(2)
        
        return String(monthAndDay)
    }

    //Get the day of the week from a string
    func getWeekDay(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "eee"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        
        guard let date = convertDate(dateFromString: dateString) else {
            return ""
        }
        
        let weekDay = dateFormatter.string(from: date).lowercased()
        
        return String(weekDay)
        
    }

    //Get the hour and minutes from a string
    func getHourAndMinute(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        
        guard let date = convertDate(dateFromString: dateString) else {
            return ""
        }
        
        let hourAndMinute = dateFormatter.string(from: date)
        
        return hourAndMinute
    }
    
}

//
//  ErrorEnumeration.swift
//  AviaProject
//
//  Created by Вероника Гера on 25.07.2023.
//

import Foundation

//Enumeration for networking errors
enum NetworkingErrors: Error {
    case badUrl, badRequest, badResponse, invalideData
}

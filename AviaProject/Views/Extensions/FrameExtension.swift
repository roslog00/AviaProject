//
//  FrameExtension.swift
//  AviaProject
//
//  Created by Вероника Гера on 26.07.2023.
//

import Foundation
import SwiftUI

//I have created a function that converts dimensions from Figma to adaptive size. Here i'm using the iphone 13 mini frame as the base values
extension View {
    //Func for width
    func getAdaptiveWidth(_ width: Double) -> CGFloat {
        UIScreen.main.bounds.width * (width / 375)
    }
    
    //Func for height
    func getAdaptiveHeight(_ height: Double) -> CGFloat {
        UIScreen.main.bounds.height * (height / 812)
    }
}

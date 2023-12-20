//
//  Colors.swift
//  iosApp
//
//  Created by Ehsan Taghavi on 20.12.2023.
//  Copyright © 2023 orgName. All rights reserved.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: Int64, alpha: Double = 1){
        self.init(
            .sRGB,
            red: Double((hex>>16) & 0xFF)/255,
            green: Double((hex>>08) & 0xFF)/255,
            blue: Double((hex>>08) & 0xFF)/255,
            opacity: alpha
        )
    }
}

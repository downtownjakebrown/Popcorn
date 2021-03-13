//
//  File.swift
//  
//
//  Created by jacob brown on 3/11/21.
//

import SwiftUI

extension CGFloat {
    
    func asymmetricallySlowed(slowedIncrease: Bool) -> CGFloat {
        var offset: CGFloat = 0.0
        if slowedIncrease {
            if self <= 0 {
                offset = self
            } else {
                offset = atan(0.01*self) * 35
            }
        } else {
            if self >= 0 {
                offset = self
            } else {
                offset = atan(0.01*self) * 35
            }
        }
        return offset
    }
    
}

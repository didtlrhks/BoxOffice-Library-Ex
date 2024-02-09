//
//  File.swift
//  
//
//  Created by 양시관 on 2/9/24.
//

import Foundation

extension Date{
    var yesterday : Date? {
        Calendar.current.date(byAdding: .day,value: -1,to: self)
    }
}

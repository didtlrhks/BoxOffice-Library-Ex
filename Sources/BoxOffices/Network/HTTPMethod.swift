//
//  File.swift
//  
//
//  Created by 양시관 on 2/3/24.
//

import Foundation

enum HTTPMethod: String {
    case get // ,post,delete,put  나는 get만 사용해볼라거
    
    var capitalizedValue : String {
        self.rawValue.capitalized //.get -> GET
    }
}

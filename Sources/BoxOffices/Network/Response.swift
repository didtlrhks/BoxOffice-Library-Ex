//
//  Response.swift
//
//
//  Created by 양시관 on 2/9/24.
//

import Foundation

struct BoxOfficeResponse: Decodable {
    let boxOfficeResult : BoxOfficeResult
    
    struct BoxOfficeResult: Decodable {
        let dailyBoxOfficeList : [Movie]
     
    }
}

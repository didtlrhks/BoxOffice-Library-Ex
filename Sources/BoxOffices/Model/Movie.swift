//
//  Movie.swift
//
//
//  Created by 양시관 on 2/9/24.
//

import Foundation


struct Movie : Decodable {
    let rank : String
    let code : String
    let name: String // 응답필드랑 다르니까 codingKey를 사용해보자
    
    enum CodingKeys : String , CodingKey {
        // 오류 났는데 이유는 CodingKeys라고 해야되는데 Key라고 했음
        case rank
        case code = "movieCd"
        case name = "movieNm"
    }
    
}

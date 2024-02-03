//
//  File.swift
//  
//
//  Created by 양시관 on 2/3/24.
//

import Foundation


class APIClient {
    let baseURL = "https://www.kobis.or.kr/kobisopenapi/webservice/rest"
    //공통 api 부분을 상수화해놓고
    let key : String // 사용하는 사람들의 키를 사용해야함 \
    
    init(key: String) {
        self.key = key
    }
}

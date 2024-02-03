//
//  File.swift
//  
//
//  Created by 양시관 on 2/3/24.
//

import Foundation

extension URLRequest {
    init(
        urlString : String,
        httpMethod: HTTPMethod,// get, post,delete,put
        key: String,
        queryitems : [URLQueryItem]?
        
    ) throws{
        //urlComponents
        guard let components = URLComponents(string: urlString) else{
            throw// error 를 던질거임
        }
    }
}

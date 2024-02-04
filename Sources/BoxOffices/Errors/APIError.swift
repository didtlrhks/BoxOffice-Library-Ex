//
//  File.swift
//  
//
//  Created by 양시관 on 2/4/24.
//

import Foundation

enum APIError : Error {
    case urlIsInvalid
    case responseIsNotExpected
    case requestIsInvalid(_ statusCode: Int)
    case serverIsnotResponding(_ statusCode: Int)
    case responseIsUnsuccessful(_ statusCode: Int)
}

extension APIError {
    init?(httpResponse : HTTPURLResponse?) {
        
        guard let httpResponse else {
            self = APIError.responseIsNotExpected// error
            return
        }
        switch httpResponse.statusCode {
      
        case 200..<300:
         return nil
       // case 300..<400:
        case 400..<500:
            
            self = APIError.requestIsInvalid(httpResponse.statusCode)
        case 500..<600:
            self = APIError.serverIsnotResponding(httpResponse.statusCode)
        default:
            self = APIError.responseIsUnsuccessful(httpResponse.statusCode)
        }
      
    }
}

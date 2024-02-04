//
//  File.swift
//  
//
//  Created by 양시관 on 2/3/24.
//
//생성자 정의 하기
import Foundation

extension URLRequest {
    init(
        urlString : String,
        httpMethod: HTTPMethod,// get, post,delete,put
        key: String,
        queryitems : [URLQueryItem]?
        
    ) throws{
        //urlComponents
        guard var components = URLComponents(string: urlString) else{
            throw APIError.urlIsInvalid// error 를 던질거임
        }
        //쿼리 아이템
        components.queryItems = [URLQueryItem(name: "key", value: key)]
        if let queryitems {
            components.queryItems?.append(contentsOf: queryitems)
        }
        // 유일엘 요청
        guard let url = components.url else {
            throw APIError.urlIsInvalid
        }
        self.init(url:url)
        
        self.httpMethod = httpMethod.capitalizedValue
    }
}

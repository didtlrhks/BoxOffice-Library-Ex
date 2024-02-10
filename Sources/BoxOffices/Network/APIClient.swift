//
//  File.swift
//  
//
//  Created by 양시관 on 2/3/24.
//

import Foundation


class APIClient {
    private let baseURL = "https://www.kobis.or.kr/kobisopenapi/webservice/rest"
    //공통 api 부분을 상수화해놓고
    let key : String // 사용하는 사람들의 키를 사용해야함 \
    
    init(key: String) {
        self.key = key
    }
    
    func fetch<Response : Decodable>
    (
        path: String, // 요청 url 에서 base url 을 제외한 부분을 경로라고 생각 하면댐
        // searchDailyBoxOfficeList.json
        httpMethod: HTTPMethod,
        queryItems : [URLQueryItem]? = nil
    )async throws -> Response {
        // URL 요청 생성
        let urlRequest = try URLRequest(urlString: "\(baseURL)/\(path)", httpMethod: httpMethod, key: key, queryitems: queryItems)
  // try를 생성하는 이유는 URLRequest에서 내가 생성자를 만들때 try를 만들었기때문임
        
        let (data,URLResponse) = try await URLSession.shared.data(for: urlRequest)
        
        if let error = APIError(httpResponse: URLResponse as? HTTPURLResponse) {
            throw error
        }
        //제네릭으로 설정한 response로 data를 디코딩한다.
        let output = try JSONDecoder().decode(Response.self, from: data)
        return output
    }
}

//
//  APIClientTests.swift
//
//
//  Created by 양시관 on 2/9/24.
//
import XCTest
@testable import BoxOffices // 테스터블이라는 텍스쳐때문에 인터널 엑세스 관리자까지 사용할수있게 되는거임 그래서 지금 API에 접근할 수 있게 된거임

final class APIClientTests: XCTestCase {
    func test_fetch() async throws {
   // http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=20120101
        
        struct Response: Decodable {
            let boxOfficeResult: BoxOfficeResult
            
            struct BoxOfficeResult: Decodable{
                let dailyBoxOfficeList : [DailBoxOffice]
                
                struct DailBoxOffice: Decodable{
                    let movieCd: String
                }
            }
        }
        let apiClient = APIClient(key:"f5eef3421c602c6cb7ea224104795888")
        let response : Response = try await
        apiClient.fetch(path:"boxoffice/searchDailyBoxOfficeList.json",
                        httpMethod: .get,
                        queryItems:[URLQueryItem(name: "targetDt", value: "20120101")]
        )
        
        XCTAssertEqual(response.boxOfficeResult.dailyBoxOfficeList.count,10)
    }
}

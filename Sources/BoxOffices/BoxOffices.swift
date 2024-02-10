// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
//엑세스컨트롤하는건 5가지가있고
//open  오픈과 퍼블릭의 차이점으로는 오버라이드가 되냐안되냐임 둘다 모듈밖에서 접근이 가능하지만
//public 퍼블릭은 오버라이드가 안됨 
    //internal
//fileprivate
//private


public class BoxOffices {
   private let apiClient: APIClient
    
   public var apiKey: String {
        apiClient.key
    }
    
    public init(key : String) {
        self.apiClient = APIClient(key: key)
    }
    
   public func fetchDailyTop10() async -> Result<[Movie], Error> {
        //어제꺼를 가져와야함
        guard let yesterday = Date().yesterday else {
            return .failure(BoxOfficeError.recentDateIsInvalid)
            
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYYMMdd"
        let targetDate = dateFormatter.string(from: yesterday)//dateformatter 로 날짜형식으로 리턴하고 그값을 targetDate 에 넣어주겠다라는 소스코드임
        //API 요청 과 응답하기
        do {
            let response: BoxOfficeResponse = try await // 이런오류를 안생기게하려면 두캐치나 throw 해야하는데 지금 위에서는 에러를 뱉고있으니까 굳이 그럴 필요없음 그냥 do catch 사용
            apiClient.fetch(path: "boxoffice/searchDailyBoxOfficeList.json", httpMethod: .get,
                            queryItems: [URLQueryItem(name: "targetDt", value: targetDate)]
            )
            return .success(response.boxOfficeResult.dailyBoxOfficeList)
        }catch {
            return .failure(error)
        }
    }
}

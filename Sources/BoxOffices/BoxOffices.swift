// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

class BoxOffices {
    let apiClient: APIClient
    
    var apiKey: String {
        apiClient.key
    }
    
    init(key : String) {
        self.apiClient = APIClient(key: key)
    }
    
    func fetchDailyTop10() async -> Result<[Movie], Error> {
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

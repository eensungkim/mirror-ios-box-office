//
//  RequestDataTests.swift
//  BoxOfficeTests
//
//  Created by Kim EenSung on 2/15/24.
//

import XCTest
@testable import BoxOffice

final class RequestDataTests: XCTestCase {

    var sut: FakeBoxOfficeDTO?
    
    override func setUpWithError() throws {
         sut = FakeBoxOfficeDTO()
    }

    func test_일별박스오피스_API문서를_요청했을때_알맞은응답을수신하는가() {
        // given
        let input: String = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=20120101"
        let expectation = """
        {"boxOfficeResult":{"boxofficeType":"일별 박스오피스","showRange":"20220105~20220105","dailyBoxOfficeList":[{"rnum":"1","rank":"1","rankInten":"0","rankOldAndNew":"NEW","movieCd":"20199882","movieNm":"경관의 피","openDt":"2022-01-05","salesAmt":"584559330","salesShare":"34.2","salesInten":"584559330","salesChange":"100","salesAcc":"631402330","audiCnt":"64050","audiInten":"64050","audiChange":"100","audiAcc":"69228","scrnCnt":"1171","showCnt":"4416"}]}}
        """.data(using: .utf8)
        
        // when
        var result: Data? = nil
        do {
            result = try sut?.requestData(with: input)
        } catch {
            print(error.localizedDescription)
        }
        
        // then
        XCTAssertEqual(expectation, result, "true 를 반환해야 함")
    }
}
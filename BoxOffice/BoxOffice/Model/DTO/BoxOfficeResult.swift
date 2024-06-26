//
//  BoxOfficeStructure.swift
//  BoxOffice
//
//  Created by Kim EenSung on 2/13/24.
//

import Foundation

struct BoxOfficeResult: Decodable {
    let boxOfficeDetail: BoxOfficeDetail
    
    private enum CodingKeys: String, CodingKey {
        case boxOfficeDetail = "boxOfficeResult"
    }
}

struct BoxOfficeDetail: Decodable {
    let boxofficeType: String
    let showRange: String
    let dailyBoxOfficeList: [BoxOfficeMovie]
}

struct BoxOfficeMovie: Decodable {
    let index: String
    let rank: String
    let rankChangedAmount: String
    let rankStatus: String
    let movieCode: String
    let movieName: String
    let openDate: String
    let salesAmount: String
    let salesShare: String
    let salesChangedAmount: String
    let salesChangedPercentage: String
    let salesAccumulated: String
    let audienceCount: String
    let audienceChangedAmount: String
    let audienceChangedPercentage: String
    let audienceAccumulated: String
    let screenCount: String
    let showCount: String
    
    private enum CodingKeys: String, CodingKey {
        case index = "rnum"
        case rank
        case rankChangedAmount = "rankInten"
        case rankStatus = "rankOldAndNew"
        case movieCode = "movieCd"
        case movieName = "movieNm"
        case openDate = "openDt"
        case salesAmount = "salesAmt"
        case salesShare
        case salesChangedAmount = "salesInten"
        case salesChangedPercentage = "salesChange"
        case salesAccumulated = "salesAcc"
        case audienceCount = "audiCnt"
        case audienceChangedAmount = "audiInten"
        case audienceChangedPercentage = "audiChange"
        case audienceAccumulated = "audiAcc"
        case screenCount = "scrnCnt"
        case showCount = "showCnt"
    }
    
    func toMovie() -> BoxOfficeProvider.Movie {
        let index: Int = Int(index) ?? 0
        let rankChangedAmount: Int = Int(rankChangedAmount) ?? 0
        let rankStatus: BoxOfficeProvider.Movie.RankStatus = rankStatus == "NEW" ? .new : .old
        let audienceCount: Int = Int(audienceCount) ?? 0
        let audienceAccumulated: Int = Int(audienceAccumulated) ?? 0
        let movie = BoxOfficeProvider.Movie(
            movieCode: movieCode,
            index: index,
            rank: rank,
            rankChangedAmount: rankChangedAmount,
            rankStatus: rankStatus,
            movieName: movieName,
            audienceCount: audienceCount,
            audienceAccumulated: audienceAccumulated
        )
        return movie
    }
}

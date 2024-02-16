//
//  BoxOfficeDTO.swift
//  BoxOffice
//
//  Created by Kim EenSung on 2/14/24.
//

import Foundation

struct BoxOfficeDTO {
    static func requestData(with url: String) async throws -> Data? {
        guard let URL = URL(string: url) else {
            return nil
        }
        
        let data = try await URLSession.shared.data(from: URL)
        
        guard let httpResponse = data.1 as? HTTPURLResponse else {
            return nil
        }
        
        switch httpResponse.statusCode {
        case 200...299:
            return data.0
        case 300...399:
            throw HTTPStatusError.redirection
        case 400...499:
            throw HTTPStatusError.clientError
        case 500...599:
            throw HTTPStatusError.serverError
        default:
            return nil
        }
    }
    
    static func parseJSONData<T: Decodable>(_ data: Data) -> T? {
        do {
            let decoder = JSONDecoder()
            let data = try decoder.decode(T.self, from: data)
            return data
        } catch {
            print(error)
            return nil
        }
    }
}

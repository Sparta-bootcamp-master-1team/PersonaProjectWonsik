//
//  DateFormatter.swift
//  HarryPotterSeriesApp
//
//  Created by 양원식 on 3/28/25.
//

import Foundation

// DateFormatter 관련 유틸리티 클래스
class DateFormatterHelper {
    static func formatDateString(inputDate: String) -> String? {
        let dateFormatter = DateFormatter()
        
        // 입력되는 날짜 형식
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        // 날짜 문자열을 Date 객체로 변환
        if let date = dateFormatter.date(from: inputDate) {
            
            // 원하는 형식으로 날짜를 변환
            dateFormatter.dateFormat = "MMMM dd, yyyy"
            let formattedDate = dateFormatter.string(from: date)
            return formattedDate
        }
        
        return nil
    }
}

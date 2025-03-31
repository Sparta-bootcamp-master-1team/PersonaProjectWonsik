//
//  AlertHelper.swift
//  HarryPotterSeriesApp
//
//  Created by 양원식 on 3/28/25.
//

import UIKit

// Alert 관련 유틸리티 클래스
class AlertHelper {
    
    // 오류 메시지 알림을 표시하는 메서드
    static func showErrorAlert(from viewController: UIViewController, message: String) {
        let alertController = UIAlertController(title: "오류",
                                                message: message,
                                                preferredStyle: .alert)

        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alertController.addAction(okAction)
        
        // 뷰 컨트롤러에서 Alert를 표시
        viewController.present(alertController, animated: true, completion: nil)
    }
}

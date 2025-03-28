//
//  ViewController.swift
//  HarryPotterSeriesApp
//
//  Created by 양원식 on 3/28/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let dataService = DataService()
    lazy var homeView = HomeView()
    
    override func loadView() {
        self.view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadBooks()
    }
    
    func loadBooks() {
        dataService.loadBooks { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let books):
                // 임의로 첫번째 지정 [ 추후 수정 ]
                if let firstBook = books.first {
                    DispatchQueue.main.async {
                        self.homeView.configure(with: firstBook)
                    }
                }
                
            case .failure(let error):
                AlertHelper.showErrorAlert(from: self, message: "책을 불러오는데 실패했습니다 \n 오류: \(error.localizedDescription)")
            }
        }
    }
    
    
}


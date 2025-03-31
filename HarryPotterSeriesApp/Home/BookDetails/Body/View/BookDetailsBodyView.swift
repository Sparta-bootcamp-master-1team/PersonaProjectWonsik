//
//  MetaDataView.swift
//  HarryPotterSeriesApp
//
//  Created by 양원식 on 3/31/25.
//

import UIKit
import SnapKit

class BookDetailsBodyView: UIView {
    
    private let dedicationView = DedicationView()
    
    private let summaryView = SummaryView()
    
    private lazy var bookDetailsBodyStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [dedicationView, summaryView])
        view.axis = .vertical
        view.spacing = 24
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - UI 구성
    private func setUI() {
        
        addSubview(bookDetailsBodyStack)
        
        bookDetailsBodyStack.snp.makeConstraints {
            $0.edges.equalToSuperview()

        }
        
    }
    
    func configure(book: Book) {
        dedicationView.configure(book: book)
        summaryView.configure(book: book)
    }
    
}

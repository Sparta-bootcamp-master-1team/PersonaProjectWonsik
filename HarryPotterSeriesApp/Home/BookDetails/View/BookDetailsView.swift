//
//  BookDetailsView.swift
//  HarryPotterSeriesApp
//
//  Created by 양원식 on 3/28/25.
//

import UIKit
import SnapKit

class BookDetailsView: UIView {
    
    // MARK: - 뷰
    /// 책 이미지 뷰
    private let bookImageView = BookImageView()
    
    /// 책 정보 뷰
    private let bookInfoView = BookInfoView()
    
    private let dedicationView = DedicationView()
    
    private let summaryView = SummaryView()
    
    // MARK: - 스택
    
    private lazy var infoStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [bookImageView, bookInfoView])
        view.axis = .horizontal
        view.spacing = 10
        return view
    }()
    
    private lazy var metadataStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [dedicationView, summaryView])
        view.axis = .vertical
        view.spacing = 24
        return view
    }()
    
    
    // MARK: - 초기화
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI 구성
    private func setUI() {
        addSubview(infoStack)
        
        infoStack.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalTo(safeAreaLayoutGuide).offset(5)
            $0.trailing.equalTo(safeAreaLayoutGuide).inset(5)

        }
        
        addSubview(metadataStack)
        metadataStack.snp.makeConstraints {
            $0.top.equalTo(infoStack.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)

        }
        
    }
    
    func configure(book: Book) {
        bookImageView.configure(book: book)
        bookInfoView.configure(book: book)
        dedicationView.configure(book: book)
        summaryView.configure(book: book)
    }
}

//
//  BookInfoView.swift
//  HarryPotterSeriesApp
//
//  Created by 양원식 on 3/28/25.
//

import UIKit
import SnapKit

class BookInfoView: UIView {
    
    // MARK: - 스택
    private lazy var infoStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [titleLabel, authorStack, releasedStack, pagesStack])
        view.axis = .vertical
        view.alignment = .leading
        view.spacing = 8
        return view
    }()
    
    private lazy var authorStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [authorTitleLabel, authorLabel])
        view.axis = .horizontal
        view.spacing = 5
        return view
    }()
    
    private lazy var releasedStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [releasedTitleLabel, releasedLabel])
        view.axis = .horizontal
        view.spacing = 5
        return view
    }()
    
    private lazy var pagesStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [pagesTitleLabel, pagesLabel])
        view.axis = .horizontal
        view.spacing = 5
        return view
    }()
    
    // MARK: - UI 요소
    private let titleLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    
    private let authorTitleLabel: UILabel = {
        var label = UILabel()
        label.text = "Author"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let authorLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18)
        label.textColor = .darkGray
        return label
    }()
    
    private let releasedTitleLabel: UILabel = {
        var label = UILabel()
        label.text = "Released"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        
        return label
    }()
    
    private let releasedLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        
        return label
    }()
    
    private let pagesTitleLabel: UILabel = {
        var label = UILabel()
        label.text = "Pages"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        
        return label
    }()
    
    private let pagesLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        
        return label
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
            $0.edges.equalToSuperview()
        }
    }
    
    func configure(book: Book) {
        titleLabel.text = book.title
        authorLabel.text = book.author
        
        if let formattedDate = DateFormatterHelper.formatDateString(inputDate: book.releaseDate) {
            releasedLabel.text = formattedDate
        } else {
            releasedLabel.text = book.releaseDate
        }

        pagesLabel.text = "\(book.pages)"
    }
}

//
//  Chapters.swift
//  HarryPotterSeriesApp
//
//  Created by 양원식 on 3/31/25.
//

import UIKit
import SnapKit

class ChaptersView: UIView {
    
    private lazy var chaptersStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [title])
        view.axis = .vertical
        view.spacing = 8
        
        return view
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.text = "Chapters"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setUI() {
        addSubview(chaptersStack)
        chaptersStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        chaptersStack.addArrangedSubview(title)
    }
    
    func configure(book: Book) {
        // 챕터 수만큼 라벨 추가
        for chapter in book.chapters {
            let label = UILabel()
            label.text = chapter.title
            label.font = .systemFont(ofSize: 14)
            label.textColor = .darkGray
            chaptersStack.addArrangedSubview(label)
        }
        
    }
    
}

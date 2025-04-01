//
//  SummaryView.swift
//  HarryPotterSeriesApp
//
//  Created by 양원식 on 3/31/25.
//

import UIKit
import SnapKit

class SummaryView: UIView {
    
    private lazy var summaryStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [title, summary, expand])
        view.axis = .vertical
        view.spacing = 8
        return view
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.text = "Summary"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private let summary: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        return label
    }()
    
    private let expand: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("더 보기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.contentHorizontalAlignment = .right
        return button
    }()
    
    /// 더 보기 , 접기
    private var isExpanded: Bool = false
    
    private func saveState() {
        UserDefaults.standard.set(isExpanded, forKey: currentBookTitle)
    }
    
    private var currentBookTitle: String = ""

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setUI() {
        addSubview(summaryStack)
        summaryStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        expand.addTarget(self, action: #selector(toggleText), for: .touchUpInside) // 버튼을 터치했다가 손을 뗐을 때
        
    }
    
    func configure(book: Book) {
        currentBookTitle = book.title
        summary.text = book.summary

        let isLongText = book.summary.count > 450
        expand.isHidden = !isLongText

        isExpanded = UserDefaults.standard.bool(forKey: currentBookTitle)
        updateSummaryDisplay()
        
        expand.isHidden = !isLongText
    }

    
    // 더보기/접기 기능
    @objc private func toggleText() {
        isExpanded.toggle()
        saveState()
        updateSummaryDisplay()
    }

    private func updateSummaryDisplay() {
        summary.numberOfLines = isExpanded ? 0 : 7
        expand.setTitle(isExpanded ? "접기" : "더 보기", for: .normal)
    }

}

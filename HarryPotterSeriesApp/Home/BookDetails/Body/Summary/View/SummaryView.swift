//
//  SummaryView.swift
//  HarryPotterSeriesApp
//
//  Created by 양원식 on 3/31/25.
//

import UIKit
import SnapKit

class SummaryView: UIView {
    
    // MARK: - UI 구성 요소
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
        label.numberOfLines = 0 // 기본적으로 전체 표시
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
    
    // MARK: - 상태 저장 관련
    private var isExpanded: Bool = false
    private var currentBookTitle: String = ""

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Layout 변경 감지 (ex. 회전)
    override func layoutSubviews() {
        super.layoutSubviews()
        DispatchQueue.main.async {
            self.updateSummaryDisplay()
        }
    }

    // MARK: - UI 구성
    private func setUI() {
        addSubview(summaryStack)
        summaryStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        expand.addTarget(self, action: #selector(toggleText), for: .touchUpInside)
    }

    // MARK: - 책 정보 적용
    func configure(book: Book) {
        currentBookTitle = book.title
        summary.text = book.summary
        isExpanded = UserDefaults.standard.bool(forKey: currentBookTitle)
        updateSummaryDisplay()
    }

    // MARK: - 더보기/접기 전환
    @objc private func toggleText() {
        isExpanded.toggle()
        saveState()
        updateSummaryDisplay()
    }

    private func saveState() {
        UserDefaults.standard.set(isExpanded, forKey: currentBookTitle)
    }

    // MARK: - 요약 텍스트 표시 로직
    private func updateSummaryDisplay() {
        let charCount = summary.text?.count ?? 0
        let maxLines = 7
        let isLongText = charCount > 450
        let isActuallyTruncated = isTextTruncated(summary, maxLines: maxLines)

        if isLongText && isActuallyTruncated {
            summary.numberOfLines = isExpanded ? 0 : maxLines
            expand.setTitle(isExpanded ? "접기" : "더 보기", for: .normal)
            expand.isHidden = false
        } else {
            summary.numberOfLines = 0
            expand.setTitle("", for: .normal)
            expand.isHidden = true
        }
    }

    // MARK: - 실제 줄 수 계산
    private func isTextTruncated(_ label: UILabel, maxLines: Int) -> Bool {
        guard let text = label.text, let font = label.font else { return false }

        let maxSize = CGSize(width: label.bounds.width, height: .greatestFiniteMagnitude)
        let textHeight = text.boundingRect(
            with: maxSize,
            options: [.usesLineFragmentOrigin],
            attributes: [.font: font],
            context: nil
        ).height

        let lineHeight = font.lineHeight
        let numberOfLines = Int(ceil(textHeight / lineHeight))
        return numberOfLines > maxLines
    }
}

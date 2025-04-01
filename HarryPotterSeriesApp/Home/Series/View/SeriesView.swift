//
//  Series.swift
//  HarryPotterSeriesApp
//
//  Created by 양원식 on 3/28/25.
//

import UIKit
import SnapKit

protocol SeriesButtonViewDelegate: AnyObject {
    func seriesButtonView(_ view: SeriesButtonView, didSelectBook book: Book)
}

class SeriesButtonView: UIView {
    
    weak var delegate: SeriesButtonViewDelegate?
    private(set) var books: [Book] = []
    private let selectedIndexKey = "SelectedBookIndex"
    
    private var selectedIndex: Int = 0

    
    private let buttonStack: UIStackView = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.spacing = 8
            stack.alignment = .center
            stack.distribution = .fillEqually
            return stack
        }()
    
    // MARK: - 초기화
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI 구성
    private func setupUI() {
        
        addSubview(buttonStack)
        buttonStack.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview()
        }
    }
    
    
    func configure(books: [Book]) {
        self.books = books
        buttonStack.arrangedSubviews.forEach { $0.removeFromSuperview() }

        for (index, _) in books.enumerated() {
            let button = UIButton()
            button.setTitle("\(index + 1)", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 16)
            button.backgroundColor = .systemBlue
            button.layer.cornerRadius = 20
            button.clipsToBounds = true
            button.tag = index
            button.snp.makeConstraints { $0.width.height.equalTo(40) }

            button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
            buttonStack.addArrangedSubview(button)
        }

        let savedIndex = UserDefaults.standard.integer(forKey: selectedIndexKey)
        selectedIndex = savedIndex
        selectBook(at: savedIndex)

    }
    
    @objc private func didTapButton(_ sender: UIButton) {
        let index = sender.tag
        selectBook(at: index)
        UserDefaults.standard.set(index, forKey: selectedIndexKey)
    }

    private func selectBook(at index: Int) {
        guard index < books.count else { return }

        for (_, view) in buttonStack.arrangedSubviews.enumerated() {
            if let button = view as? UIButton {
                button.setTitleColor(.systemBlue, for: .normal)
                button.backgroundColor = .systemGray5
            }
        }

        if let selectedButton = buttonStack.arrangedSubviews[index] as? UIButton {
            selectedButton.setTitleColor(.white, for: .normal)
            selectedButton.backgroundColor = .systemBlue
        }

        selectedIndex = index
        let selectedBook = books[index]
        delegate?.seriesButtonView(self, didSelectBook: selectedBook)
    }

}

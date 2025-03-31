//
//  HomeView.swift
//  HarryPotterSeriesApp
//
//  Created by 양원식 on 3/28/25.
//
import UIKit
import SnapKit

class HomeView: UIView {
    
    // MARK: - 뷰
    private let titleView = TitleView()
    private let seriesView = SeriesButtonView()
    private let bookDetailsView = BookDetailsView()

    // MARK: - 스택
    private lazy var mainStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [titleView, seriesView, bookDetailsView])
        view.axis = .vertical
        return view
    }()
    
    // MARK: - 초기화
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    // MARK: - UI 구성
    private func setupUI() {
        addSubview(mainStackView)
        mainStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()

        }
    }
    
    func configure(book: Book) {
        titleView.configure(book: book)
        seriesView.configure(book: book) // [ 추후 변경 ]
        bookDetailsView.configure(book: book)
    }
}

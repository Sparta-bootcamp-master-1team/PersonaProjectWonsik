//
//  HomeView.swift
//  HarryPotterSeriesApp
//
//  Created by 양원식 on 3/28/25.
//
import UIKit
import SnapKit

class HomeView: UIView, SeriesButtonViewDelegate {
    
    func seriesButtonView(_ view: SeriesButtonView, didSelectBook book: Book) {
        guard let index = seriesView.books.firstIndex(where: { $0.title == book.title }) else { return }
        titleView.configure(book: book)
        bookDetailsView.configure(book: book, index: index)
    }


    
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
        seriesView.delegate = self
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
            $0.leading.equalTo(safeAreaLayoutGuide).offset(20)
            $0.trailing.equalTo(safeAreaLayoutGuide).offset(-20)
            $0.bottom.equalTo(safeAreaLayoutGuide)

        }
    }
    
    func configure(books: [Book]) {
        seriesView.configure(books: books)

        let savedIndex = UserDefaults.standard.integer(forKey: "SelectedBookIndex")
        let selectedBook = books[savedIndex]
        
        titleView.configure(book: selectedBook)
        bookDetailsView.configure(book: selectedBook, index: savedIndex)
        seriesView.delegate = self
    }
}

//
//  TabsView.swift
//  TabsCollectionView
//
//  Created by Евгений  on 01/09/2022.
//

import UIKit

final class TabsView: UIView {
    
    //MARK: - Properties
    private let dataSource: [String]
    private let cellIdentifier = String(describing: TabsCollectionViewCell.self)
    private let spacingValue: CGFloat = 20
    private let font: UIFont = .systemFont(ofSize: 17)
    private let paddingsValue: CGFloat = 20
    private let cellHeight: CGFloat = 50
    private let indicatorHeight: CGFloat = 5
    private var selectedTab: Int = .zero {
        didSet {
            tabsCollectionView.reloadData()
        }
    }
    private lazy var tabsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    private lazy var selectionIndicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    //MARK: - Life Cycle
    init(dataSource: [String]) {
        self.dataSource = dataSource
        super.init(frame: .zero)
        setupTabsCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateIndicatorPosition(index: .init(row: selectedTab, section: 0))
    }
    
    //MARK: - Private methods
    private func setupTabsCollectionView() {
        tabsCollectionView.register(TabsCollectionViewCell.self,
                                    forCellWithReuseIdentifier: cellIdentifier)
        tabsCollectionView.showsHorizontalScrollIndicator = false
        tabsCollectionView.delegate = self
        tabsCollectionView.dataSource = self
        tabsCollectionView.addSubview(selectionIndicatorView)
        addSubview(tabsCollectionView)
        setupTabsCollectionViewConstraints()
    }
    
    private func setupTabsCollectionViewConstraints() {
        tabsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tabsCollectionView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            tabsCollectionView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            tabsCollectionView.topAnchor.constraint(equalTo: self.topAnchor),
            tabsCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func updateIndicatorPosition(index: IndexPath) {
        guard let attributes = tabsCollectionView.layoutAttributesForItem(at: index) else { return }
        UIView.animate(withDuration: 0.3) {
            self.selectionIndicatorView.frame = CGRect(x: attributes.frame.origin.x,
                                                       y: self.tabsCollectionView.frame.size.height - self.indicatorHeight,
                                                       width: attributes.size.width,
                                                       height: self.indicatorHeight)
            self.selectionIndicatorView.makeRounded()
        }
    }
    
    private func calculateTabSize(with tabTitle: String) -> CGSize {
        var cellSize = CGSize()
        if dataSource.count <= 3 {
            tabsCollectionView.isScrollEnabled = false
            let widthToCalculate = self.frame.width - paddingsValue
            let spacingCount = dataSource.count - 1
            let totalSpacingValue = CGFloat(spacingCount) * spacingValue
            let cellWidth = (widthToCalculate - totalSpacingValue)/CGFloat(dataSource.count)
            cellSize = CGSize(width: cellWidth, height: cellHeight)
        } else {
            let cellWidth = tabTitle.textWidth(usingFont: font) + 10
            cellSize = CGSize(width: cellWidth, height: cellHeight)
        }
        return cellSize
    }
    
    private func selectTab(at indexPath: IndexPath) {
        selectedTab = indexPath.row
        updateIndicatorPosition(index: indexPath)
        tabsCollectionView.scrollToItem(at: indexPath,
                                        at: .centeredHorizontally,
                                        animated: true)
    }
}

//MARK: - UICollectionViewDataSource
extension TabsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier,
                                                      for: indexPath) as! TabsCollectionViewCell
        let tabTitle = dataSource[indexPath.row]
        cell.configure(with: tabTitle, isSelected: indexPath.row == selectedTab)
        return cell
    }
}

//MARK: - UICollectionViewDelegate
extension TabsView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectTab(at: indexPath)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension TabsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let tabTitle = dataSource[indexPath.row]
        return calculateTabSize(with: tabTitle)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacingValue
    }
}

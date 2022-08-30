//
//  ViewController.swift
//  TabsCollectionView
//
//  Created by Евгений  on 25/08/2022.
//

import UIKit

final class TabsCollectionViewController: UIViewController {
    //MARK: - Properties
    private var dataSource = ["Bimmer", "Benz", "Bentley", "Bimmer", "Benz", "Bentley", "Bimmer", "Benz", "Bentley" ]
    private var selectedTab: Int? {
        didSet {
            tabsCollectionView.reloadData()
        }
    }
    private let cellIdentifier = String(describing: TabCollectionViewCell.self)
    private let spacing: CGFloat = 20
    private let font: UIFont = .systemFont(ofSize: 17)
    private let safeAreaMargin: CGFloat = 20
    private lazy var tabsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollectionViewConstraints()
    }
    
    //MARK: - Private methods
    private func initialSetup() {
        tabsCollectionView.register(UINib(nibName: cellIdentifier, bundle: nil),
                                    forCellWithReuseIdentifier: cellIdentifier)
        tabsCollectionView.showsHorizontalScrollIndicator = false
        tabsCollectionView.delegate = self
        tabsCollectionView.dataSource = self
        view.addSubview(tabsCollectionView)
    }
    
    private func setupCollectionViewConstraints() {
        tabsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tabsCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            tabsCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            tabsCollectionView.topAnchor.constraint(equalTo: view.centerYAnchor),
            tabsCollectionView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func notScrollableTabSize() -> CGSize {
        let widthToCalculate = view.frame.width - safeAreaMargin
        let multiplier = dataSource.count - 1
        let totalspacing = CGFloat(multiplier) * spacing
        let height = tabsCollectionView.frame.height
        let width = (widthToCalculate - totalspacing)/CGFloat(dataSource.count)
        let cellSize = CGSize(width: width, height: height)
        return cellSize
    }
    
    private func scrollableTabSize(tabTitle: String) -> CGSize {
        let height = tabsCollectionView.frame.height
        let width = tabTitle.widthOfString(usingFont: font) + 10
        let cellSize = CGSize(width: width, height: height)
        return cellSize
    }
    
    private func calculatedTabSize(tabTitle: String) -> CGSize {
        var cellSize = CGSize()
        if dataSource.count <= 3 {
            tabsCollectionView.isScrollEnabled = false
            cellSize = notScrollableTabSize()
        } else {
            cellSize = scrollableTabSize(tabTitle: tabTitle)
        }
        return cellSize
    }
}

//MARK: - UICollectionViewDataSource
extension TabsCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabCollectionViewCell.identifier, for: indexPath) as! TabCollectionViewCell
        let model = dataSource[indexPath.row]
        cell.configure(name: model)
        if indexPath.row == selectedTab {
            cell.isSelected()
        } else {
            cell.isDeselected()
        }
        return cell
    }
}

//MARK: - UICollectionViewDelegate
extension TabsCollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedTab = indexPath.row
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension TabsCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return calculatedTabSize(tabTitle: dataSource[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
}



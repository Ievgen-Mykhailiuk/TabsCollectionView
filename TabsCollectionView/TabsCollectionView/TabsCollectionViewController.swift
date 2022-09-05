//
//  TabsCollectionViewController.swift
//  TabsCollectionView
//
//  Created by Евгений  on 25/08/2022.
//

import UIKit

final class TabsCollectionViewController: UIViewController {
    
    //MARK: - Properties
    private let dataSource = ["Bimmer", "Benz", "Bentley", "Bimmer", "Benz", "Bentley", "Bimmer", "Benz", "Bentley"]
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabsView()
    }
    
    //MARK: - Private method
    private func setupTabsView () {
        let tabsView = TabsView(dataSource: dataSource)
        view.addSubview(tabsView)
        tabsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tabsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabsView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tabsView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}


//
//  TabsCollectionViewController.swift
//  TabsCollectionView
//
//  Created by Евгений  on 25/08/2022.
//

import UIKit

final class TabsCollectionViewController: UIViewController {
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabsView()
    }
    
    //MARK: - Private method
    private func setupTabsView () {
        let tabsView = TabsView(dataSource: ["Bimmer", "Benz", "Bentley", "Bimmer", "Benz",
                                             "Bentley", "Bimmer", "Benz", "Bentley"],
                                selectedStateColor: .blue,
                                unselectedStateColor: .black)
        view.addSubview(tabsView)
        tabsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tabsView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tabsView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tabsView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tabsView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}


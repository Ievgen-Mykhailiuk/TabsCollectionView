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
        let frame = CGRect(x: .zero,
                           y: self.view.center.y,
                           width: self.view.frame.width,
                           height: 60)
        let tabsView = TabsView(dataSource: ["Bimmer", "Benz", "Bentley", "Bimmer", "Benz",
                                             "Bentley", "Bimmer", "Benz", "Bentley"],
                                with: frame,
                                selectedStateColor: .blue,
                                unselectedStateColor: .black)
        view.addSubview(tabsView)
    }
}


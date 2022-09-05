//
//  TabCollectionViewCell.swift
//  TabsCollectionView
//
//  Created by Евгений  on 25/08/2022.
//

import UIKit

final class TabsCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets
    @IBOutlet private weak var tabTitleLabel: UILabel!
    
    //MARK: - Lyfe Cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        setupTabConstraints()
    }
    
    //MARK: - Layout methods
    private func setupTabConstraints() {
        tabTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tabTitleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            tabTitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            tabTitleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ])
    }
    
    //MARK: - Private method
    private func setState(isSelected: Bool) {
        if isSelected {
            tabTitleLabel.textColor = .blue
        } else {
            tabTitleLabel.textColor = .black
        }
    }
    
    //MARK: - Configuration method
    func configure(with tabTitle: String, isSelected: Bool) {
        tabTitleLabel.text = tabTitle
        setState(isSelected: isSelected)
    }
}

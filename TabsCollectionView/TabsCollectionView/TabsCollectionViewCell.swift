//
//  TabCollectionViewCell.swift
//  TabsCollectionView
//
//  Created by Евгений  on 25/08/2022.
//

import UIKit

final class TabsCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets
    @IBOutlet private weak var selectionIndicatorView: UIView!
    @IBOutlet private weak var tabTitleLabel: UILabel!
    
    //MARK: - Lyfe Cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        setupTabConstraints()
        setupIndicatorConstraints()
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
    
    private func setupIndicatorConstraints() {
        selectionIndicatorView.makeRounded()
        selectionIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            selectionIndicatorView.widthAnchor.constraint(equalTo: tabTitleLabel.widthAnchor),
            selectionIndicatorView.heightAnchor.constraint(equalToConstant: 5),
            selectionIndicatorView.topAnchor.constraint(equalTo: tabTitleLabel.bottomAnchor, constant: 5),
            selectionIndicatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    //MARK: - Configuration methods
    func configure(with tabTitle: String) {
        selectionIndicatorView.isHidden = true
        tabTitleLabel.text = tabTitle
    }
    
    func isSelected() {
        selectionIndicatorView.isHidden = false
        tabTitleLabel.textColor = .blue
        selectionIndicatorView.backgroundColor = .blue
    }
    
    func isDeselected() {
        selectionIndicatorView.isHidden = true
        tabTitleLabel.textColor = .black
    }
}

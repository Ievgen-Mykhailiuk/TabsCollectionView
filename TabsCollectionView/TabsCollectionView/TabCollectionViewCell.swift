//
//  TabCollectionViewCell.swift
//  TabsCollectionView
//
//  Created by Евгений  on 25/08/2022.
//

import UIKit

class TabCollectionViewCell: UICollectionViewCell {
    static let identifier = "TabCollectionViewCell"
    
    //MARK: - Outlets
    @IBOutlet weak var selectionIndicatorView: UIView!
    @IBOutlet weak var tabTitleLabel: UILabel!
    
    //MARK: - Lyfe Cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        setupTabConstraints()
        setupIndicatorConstraints()
    }
    
    //MARK: - Private methods
    private func setupTabConstraints() {
        tabTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tabTitleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            tabTitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            tabTitleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ])
    }
    
    private func setupIndicatorConstraints() {
        selectionIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            selectionIndicatorView.widthAnchor.constraint(equalTo: tabTitleLabel.widthAnchor),
            selectionIndicatorView.heightAnchor.constraint(equalToConstant: 5),
            selectionIndicatorView.topAnchor.constraint(equalTo: tabTitleLabel.bottomAnchor, constant: 5),
            selectionIndicatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        selectionIndicatorView.makeRounded()
    }
    
    //MARK: - Methods
    func configure(name: String) {
        selectionIndicatorView.isHidden = true
        tabTitleLabel.text = name
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

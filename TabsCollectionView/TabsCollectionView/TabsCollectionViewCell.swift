//
//  TabCollectionViewCell.swift
//  TabsCollectionView
//
//  Created by Евгений  on 25/08/2022.
//

import UIKit

final class TabsCollectionViewCell:  BaseCollectionViewCell {
    
    //MARK: - Properties
    private lazy var tabTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    //MARK: - Lyfe Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTabTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private methods
    private func setupTabTitleLabel() {
        contentView.addSubview(tabTitleLabel)
        tabTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tabTitleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            tabTitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            tabTitleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ])
    }
    
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

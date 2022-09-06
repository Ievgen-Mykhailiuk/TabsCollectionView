//
//  CellIdentifying.swift
//  TabsCollectionView
//
//  Created by Евгений  on 06/09/2022.
//

import Foundation

protocol CellIdentifying {
    static var cellIdentifier: String { get }
}

extension CellIdentifying {
    static var cellIdentifier: String {
        return String(describing: Self.self)
    }
}

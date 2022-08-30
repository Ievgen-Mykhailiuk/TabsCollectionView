//
//  String+Extension.swift
//  TabsCollectionView
//
//  Created by Евгений  on 30/08/2022.
//

import UIKit

extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}

//
//  stretchyflowlayout.swift
//  strechyheader
//
//  Created by HigherVisibility on 11/01/2019.
//  Copyright © 2019 ahmedHigherVisibility. All rights reserved.
//

import UIKit

class stretchyflowlayout: UICollectionViewFlowLayout {
    //find the header in allthe layout attributes and change the height of frame using the offset
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        layoutAttributes?.forEach({ (attributes) in
            //finds the first header 
            if attributes.representedElementKind == UICollectionView.elementKindSectionHeader && attributes.indexPath.section == 0{
                guard let collectionview = collectionView else{
                    return
                }
                let contentOffsetY = collectionview.contentOffset.y
//                let contentOffsetX = collectionview.contentOffset.x
                print(contentOffsetY)
                //when dragged upwards return
                if contentOffsetY>0 {
                    return
                }
                //wehn dragged downwards the contentoffset is negative so it expands the height but the
                // contentoffset acts as counterfource and hence the status bar remains at its place
                let height = attributes.frame.height - contentOffsetY
               let width = collectionview.frame.width
                attributes.frame = CGRect(x: 0, y: contentOffsetY, width: width, height: height)
            }
        })
        return layoutAttributes
    }
    // recalculate collectionview layout when dragged
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}

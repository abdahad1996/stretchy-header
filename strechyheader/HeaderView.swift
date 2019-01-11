//
//  HeaderViewCollectionReusableView.swift
//  strechyheader
//
//  Created by HigherVisibility on 10/01/2019.
//  Copyright © 2019 ahmedHigherVisibility. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    let imageView : UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "stretchy_header"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    var propertyAnimator : UIViewPropertyAnimator?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        addSubview(imageView)
        imageView.fillSuperview()
        setUpBlur()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUpBlur(){
        propertyAnimator = UIViewPropertyAnimator(duration: 5, curve: .linear, animations: {
            [weak self] in
            let blur = UIBlurEffect(style: .regular)
            let visualEffect = UIVisualEffectView(effect: blur)
            
            self?.addSubview(visualEffect)
            visualEffect.fillSuperview()
            
        })
//        propertyAnimator?.startAnimation()
    }
}

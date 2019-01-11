//
//  StrechyHeaderControllerCollectionViewController.swift
//  strechyheader
//
//  Created by HigherVisibility on 10/01/2019.
//  Copyright © 2019 ahmedHigherVisibility. All rights reserved.
//

import UIKit



class StrechyHeaderController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    private let reuseIdentifier = "Cell"
    fileprivate let headerId = "headerId"
    fileprivate let padding :CGFloat = 16
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        setUpFlowLayout()
        
        setupCollectionView()
    }
    // registering cell and header
    fileprivate func setupCollectionView() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        //for making it move to status bar
        collectionView.contentInsetAdjustmentBehavior = .never
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    // setting padding
    fileprivate func setUpFlowLayout() {
        if let  layout = collectionViewLayout as? UICollectionViewFlowLayout{
            layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
        }
    }
    
    //calculating offset and get reference of header to calcualte the animator method in header class
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        print("view")
        print(contentOffsetY)
        if contentOffsetY > 0 {
            headerView?.propertyAnimator?.fractionComplete = 0
            return
        }
        headerView?.propertyAnimator?.fractionComplete = abs(contentOffsetY)/100
    }
    
    var headerView : HeaderView?
    // for header
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
         headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as? HeaderView
      
        return headerView!
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 340)
    }
    // for cell
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = .black
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width-2*padding, height: 50)
    }
    

}

//
//  UIKitViewController.swift
//  TheNewProject
//
//  Created by Admintrator Admin on 8/29/22.
//  Copyright © 2022 codetoanbug. All rights reserved.
//

import UIKit

final class UIKitViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = collectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        let size = floor(collectionView!.frame.width / 4)
        layout.itemSize = CGSize(width: size, height: size)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        self.collectionView.register(UINib(nibName: "UIKitCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "UIKitCollectionViewCell")
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 200
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UIKitCollectionViewCell", for: indexPath) as! UIKitCollectionViewCell
        cell.imageView.image = ImageDelayer().getDelayedImage()
        return cell
    }
}

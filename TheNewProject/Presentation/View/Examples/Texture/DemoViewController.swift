//
//  DemoViewController.swift
//  TheNewProject
//
//  Created by Admintrator Admin on 8/29/22.
//  Copyright © 2022 codetoanbug. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import AsyncDisplayKit

final class TextureViewController: ASDKViewController<ASDisplayNode>, ASCollectionDataSource, ASCollectionDelegate {
    
    let flowLayout: UICollectionViewFlowLayout
    let collectionNode: ASCollectionNode
    
    override init() {
        flowLayout = UICollectionViewFlowLayout()
        collectionNode = ASCollectionNode(collectionViewLayout: flowLayout)
        
        super.init(node: collectionNode)
        
        collectionNode.delegate = self
        collectionNode.dataSource = self
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let size = floor(collectionNode.frame.width / 4)
        flowLayout.itemSize = CGSize(width: size, height: size)
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
    }
    
    func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
        return 1
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return 200
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        return { () -> ASCellNode in
            let cellNode = TextureCollectionViewCell()
            cellNode.imageView.image = nil
            cellNode.imageView.image = ImageDelayer().getDelayedImage()
            return cellNode
        }
    }
}

final class TextureCollectionViewCell: ASCellNode {
    
    let imageView = ASImageNode()
    
    override init() {
        super.init()
        imageView.contentMode = .scaleAspectFill
        addSubnode(imageView)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASWrapperLayoutSpec(layoutElement: imageView)
    }
}


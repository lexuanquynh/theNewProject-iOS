//
//  LoginViewController.swift
//  TheNewProject
//
//  Created by Admintrator Admin on 8/24/22.
//

import UIKit
import RxSwift
import RxCocoa
import AsyncDisplayKit

class LoginViewController: BaseViewController {

    let logoNode: ASImageNode = {
        let node = ASImageNode()
        node.clipsToBounds = true
        node.placeholderFadeDuration = 0.15
        node.contentMode = .center
        node.image = UIImage(named: "auth")
        return node
    }()
    
    override func addSubviews() {
        view.addSubnode(logoNode)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let x = (10 as CGFloat).adaptiveWidth()
        let y = (view.frame.height/4 as CGFloat).adaptiveWidth()
        let height = (50 as CGFloat).adaptiveWidth()
        
        logoNode.frame = CGRect(x: x, y: y, width: height*3, height: height*3)
        logoNode.view.center.x = view.center.x
    }

}

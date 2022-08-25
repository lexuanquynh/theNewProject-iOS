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
    var authViewModel: AuthViewModel!
    weak var coordinator: AuthCoordinator?
    
    let logoNode: ASImageNode = {
        let node = ASImageNode()
        node.clipsToBounds = true
        node.placeholderFadeDuration = 0.15
        node.contentMode = .center
        node.image = UIImage(named: "auth")
        return node
    }()
    
    let emailNode: ASEditableTextNode = {
        let node = ASEditableTextNode()
        let attriuteCommon = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular)
        ] as [NSAttributedString.Key : Any]
        
        node.attributedText = NSAttributedString(string: "", attributes: attriuteCommon)
        node.backgroundColor = .yellow
        node.placeholderEnabled = true
        node.placeholderFadeDuration = 0.15
        node.attributedPlaceholderText = NSAttributedString(string: "Type something here...")

        node.textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
//        node.placeholderColor = UIColor(white: 0.777, alpha: 1.0)
        return node
    }()
    
    override func addSubviews() {
        view.addSubnode(logoNode)
        view.addSubnode(emailNode)
    }
    
    // MARK: Constructors
    init(viewModel: AuthViewModel) {
        super.init(viewModel: viewModel)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initView() {
        super.initView()
        //setup view
        view.backgroundColor = .white
        disableKeyboard(tappingView: view)
    }
    
    override func initNavigationBar() {
        super.initNavigationBar()
        
        self.navigationItem.title = "Login"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let x = (10 as CGFloat).adaptiveWidth()
        let y = (self.topBarHeight+10 as CGFloat).adaptiveWidth()
        let height = (50 as CGFloat).adaptiveWidth()
        
        let fieldDiff = (10 as CGFloat).adaptiveWidth()
        let textHeight = (45 as CGFloat).adaptiveHeight()
        
        logoNode.frame = CGRect(x: x, y: y, width: height * 2.5, height: height * 2.5)
        logoNode.view.center.x = view.center.x
        
        emailNode.frame = CGRect(x: x, y: logoNode.frame.maxY + fieldDiff, width: view.frame.width-(2*x), height: textHeight)
    }

}

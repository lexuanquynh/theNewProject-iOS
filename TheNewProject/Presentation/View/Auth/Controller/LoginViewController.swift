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
import ASTextFieldNode

class LoginViewController: BaseViewController, UITextFieldDelegate {
    var authViewModel: AuthViewModel!
    weak var coordinator: AuthCoordinator?
    
    lazy var logoNode: ASImageNode = {
        let node = ASImageNode()
        node.contentMode = .scaleAspectFill
        node.clipsToBounds = true
        node.placeholderFadeDuration = 0.15
        node.contentMode = .center
        node.image = UIImage(named: "auth")
        return node
    }()
    
    lazy var emailNode: ASTextFieldNode = {
        let node = ASTextFieldNode()
        node.keyboardType = .emailAddress
        node.textField.delegate = self
        node.textField.returnKeyType = .next
        node.textField.clearButtonMode = .whileEditing
        node.textField.attributedPlaceholder = NSAttributedString(string: "Enter your email...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16.0)])
        node.textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        node.backgroundColor = .groupTableViewBackground
        node.cornerRadius = 10
        node.clipsToBounds = true
        return node
    }()
    
    lazy var passwordNode: ASTextFieldNode = {
        let node = ASTextFieldNode()
        node.textField.isSecureTextEntry = true
        node.textField.delegate = self
        node.textField.returnKeyType = .done
        node.textField.clearButtonMode = .whileEditing
        node.textField.keyboardType = .asciiCapable
        node.textField.attributedPlaceholder = NSAttributedString(string: "Enter your password...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16.0)])
        node.textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        node.backgroundColor = .groupTableViewBackground
        node.cornerRadius = 10
        return node
    }()
    
    lazy var loginButton: ASButtonNode = {
        let node = ASButtonNode()
        node.setAttributedTitle(NSAttributedString(string: "LOGIN", attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .medium)
        ]
                                                  ), for: .normal)
        
        node.borderWidth = 1
        node.borderColor = UIColor.white.cgColor
        node.backgroundColor = .systemBlue
        node.cornerRadius = 10
        return node
    }()
    
    override func addSubviews() {
        view.addSubnode(logoNode)
        view.addSubnode(emailNode)
        view.addSubnode(passwordNode)
        view.addSubnode(loginButton)
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
    
    override func addActionsToSubviews() {
        // did tap submit button
        loginButton.rx.tap.bind { [weak self] in
            self?.authenticateUser()
        }.disposed(by: disposeBag)
        
       
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
        let textHeight = (35 as CGFloat).adaptiveHeight()
        
        logoNode.frame = CGRect(x: x, y: y, width: height * 2.5, height: height * 2.5)
        logoNode.view.center.x = view.center.x
//        logoNode.contentMode = .scaleAspectFill
        
        emailNode.frame = CGRect(x: x, y: logoNode.frame.maxY + fieldDiff, width: view.frame.width-(2*x), height: textHeight)
        passwordNode.frame = CGRect(x: x, y: emailNode.frame.maxY + fieldDiff, width: view.frame.width-(2*x), height: textHeight)
        loginButton.frame = CGRect(x: x, y: passwordNode.frame.maxY + fieldDiff, width: view.frame.width-(2*x), height: height)
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == emailNode.textField { // Switch focus to other text field
            passwordNode.textField.becomeFirstResponder()
        }
        return true
    }
    
    //MARK: Authentication Process
    func authenticateUser() {
        
    }
}


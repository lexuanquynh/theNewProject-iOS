//
//  HomeViewController.swift
//  TheNewProject
//
//  Created by Admintrator Admin on 8/26/22.
//  Copyright © 2022 codetoanbug. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import AsyncDisplayKit
import ASTextFieldNode

class HomeViewController: BaseViewController {
    var homeViewModel: HomeViewModel!
    weak var coordinator: HomeCoordinator?
    
    lazy var selfPraticeButton: ASButtonNode = {
        let node = ASButtonNode()
        node.setAttributedTitle(NSAttributedString(string: "Self pratice", attributes: [
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
    
    lazy var playWithRobotButton: ASButtonNode = {
        let node = ASButtonNode()
        node.setAttributedTitle(NSAttributedString(string: "Play with robot", attributes: [
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
    
    lazy var multiPlayerButton: ASButtonNode = {
        let node = ASButtonNode()
        node.setAttributedTitle(NSAttributedString(string: "Multi player", attributes: [
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
    
    lazy var HistoryButton: ASButtonNode = {
        let node = ASButtonNode()
        node.setAttributedTitle(NSAttributedString(string: "History", attributes: [
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
        view.addSubnode(selfPraticeButton)
        view.addSubnode(playWithRobotButton)
        view.addSubnode(multiPlayerButton)
        view.addSubnode(HistoryButton)
    }
    
    // MARK: Constructors
    init(viewModel: HomeViewModel) {
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
        
        self.navigationItem.title = "Home"
    }
    
    override func addActionsToSubviews() {
        // did tap submit button
        
        selfPraticeButton.rx.tap.bind { [weak self] in
            self?.selfPraticeAction()
        }.disposed(by: disposeBag)
        
        playWithRobotButton.rx.tap.bind { [weak self] in
            self?.playWithRobotAction()
        }.disposed(by: disposeBag)
        
        multiPlayerButton.rx.tap.bind { [weak self] in
            self?.multiPlayerAction()
        }.disposed(by: disposeBag)
        
        HistoryButton.rx.tap.bind { [weak self] in
            self?.historyAction()
        }.disposed(by: disposeBag)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let x = (10 as CGFloat).adaptiveWidth()
        let y = (self.topBarHeight+10 as CGFloat).adaptiveWidth()
        let height = (50 as CGFloat).adaptiveWidth()
        
        let fieldDiff = (10 as CGFloat).adaptiveWidth()
        
        selfPraticeButton.frame = CGRect(x: x, y: y, width: view.frame.width-(2*x), height: height)
                
        playWithRobotButton.frame = CGRect(x: x, y: selfPraticeButton.frame.maxY + fieldDiff, width: view.frame.width-(2*x), height: height)
        
        multiPlayerButton.frame = CGRect(x: x, y: playWithRobotButton.frame.maxY + fieldDiff, width: view.frame.width-(2*x), height: height)
        HistoryButton.frame = CGRect(x: x, y: multiPlayerButton.frame.maxY + fieldDiff, width: view.frame.width-(2*x), height: height)
    }
    
    private func selfPraticeAction() {
        print("selfPraticeAction")
    }    
    
    private func playWithRobotAction() {
        print("playWithRobotAction")
    }
    
    private func multiPlayerAction() {
        print("multiPlayerAction")
    }
    
    private func historyAction() {
        print("historyAction")
    }
}

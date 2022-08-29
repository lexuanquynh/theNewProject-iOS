//
//  SelfPracticeViewController.swift
//  TheNewProject
//
//  Created by Admintrator Admin on 8/26/22.
//  Copyright © 2022 codetoanbug. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import AsyncDisplayKit

class SelfPracticeViewController: BaseViewController {
    var selfPracticeViewModel: SelfPracticeViewModel!
    var coordinator: SelfPracticeCoordinator?
    var selfPracticeList: [SelfPractice] = [SelfPractice(avatarUrl: "https://img.docbao.vn/images/uploads/2020/06/06/770386348956230409478287557070830538351761n-1591356949120557498652.jpg")]
    
    // MAR: UI Objects
    lazy var tableNode: ASTableNode = {
        let tableNode = ASTableNode(style: .plain)
        tableNode.delegate = self
        tableNode.dataSource = self
        tableNode.reloadData()
        tableNode.view.leadingScreensForBatching = 1.0
        
        return tableNode
    }()
    
    let noDataNode: ASTextNode = {
        let node = ASTextNode()
        
        let paragraphStyleName = NSMutableParagraphStyle()
        paragraphStyleName.alignment = .center
        
        node.attributedText = NSAttributedString(string: "No Data Available, Plz Search", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .medium),
            NSAttributedString.Key.paragraphStyle: paragraphStyleName
        ])
        
        return node
    }()
    
    override func addSubviews() {
        view.addSubnode(tableNode)
        tableNode.addSubnode(noDataNode)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableNode.frame = view.frame
        noDataNode.frame = CGRect(origin: CGPoint(x: 0, y: tableNode.frame.midY-15), size: CGSize(width: tableNode.frame.width, height: 30))
    }
    
    override func bindViewModel() {
        selfPracticeViewModel = viewModel as? SelfPracticeViewModel
        let input = SelfPracticeViewModel.SelfPracticeInput()
        let output = selfPracticeViewModel.getSelfPracticeOutput(input: input)
    }
    
    // MARK: Constructors
    init(viewModel: SelfPracticeViewModel) {
        super.init(viewModel: viewModel)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

// MARK: - ASTableDelegate

extension SelfPracticeViewController: ASTableDelegate {
    func tableView(_ tableView: ASTableView, willBeginBatchFetchWith context: ASBatchContext) {
//        userViewModel.isNewSearch = false
//        triggerEventForsearchUser(query: query)
        context.completeBatchFetching(true)
    }
    
    func shouldBatchFetch(for tableView: ASTableView) -> Bool {
//        guard let totalDataCount = userViewModel.totalDataCount else {
//            return false
//        }
//
//        if totalDataCount > userList.count {
//            return true
//        }
        return false
    }
    
    func tableView(_ tableView: ASTableView, constrainedSizeForRowAt indexPath: IndexPath) -> ASSizeRange {
        return ASSizeRangeMake(CGSize(width: UIScreen.main.bounds.size.width-20, height: 120), CGSize(width: UIScreen.main.bounds.size.width-20, height: .greatestFiniteMagnitude))
    }
    
    func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
//        coordinator?.navigateToUserDetails(user: userList[indexPath.row].asDomain)
    }
}

// MARK: - ASTableDataSource

extension SelfPracticeViewController: ASTableDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selfPracticeList.count
    }
    
    func tableView(_ tableView: ASTableView, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        let item = selfPracticeList[(indexPath as NSIndexPath).row]
        
        return {
            let node = SelfPracticeCellNode(item: item)
            return node
        }
    }
}

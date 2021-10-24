//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Дубинкина Елена on 04/08/2021.
//  Copyright © 2021 Дубинкина Елена. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    let tableView: UITableView = UITableView(frame: .zero, style: .plain)
    let cellID = "cellID"
    private var tempStorage: [Post] = [] {
        didSet{
            tableView.reloadData()
        }
    }
    let headerID = String(describing: ProfileHeaderView.self)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupConstraints()
        
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector:  #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
     
        NotificationCenter.default.addObserver(self, selector:  #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    
    }
    override func viewDidDisappear (_ animated: Bool) {
        super.viewDidAppear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }
    
    func setupTableView() {
        view.addSubview(tableView)
 
        tableView.translatesAutoresizingMaskIntoConstraints = false

        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: headerID)
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func setupConstraints() {
    
    let constraints = [
        
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
    ]
    NSLayoutConstraint.activate(constraints)
    }
}

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Feed.post.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)  as! PostTableViewCell
        cell.post  = Feed.post[indexPath.row]
        return cell
    }
}


extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerID) as! ProfileHeaderView
        if section == 0 {return headerView}
        else  { return nil}
        
    }
}

extension ProfileViewController {

@objc func keyboardWillShow(notification: NSNotification) {
    if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
        
        tableView.contentInset.bottom = keyboardSize.height
        tableView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
    }
}

@objc func keyboardWillHide(notification: NSNotification) {
   
    tableView.contentInset.bottom = .zero
    tableView.verticalScrollIndicatorInsets = .zero
}
}

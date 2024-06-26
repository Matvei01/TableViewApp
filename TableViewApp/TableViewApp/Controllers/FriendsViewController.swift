//
//  FriendsViewController.swift
//  TableViewApp
//
//  Created by Matvei Khlestov on 13.04.2024.
//

import UIKit

// MARK: - FriendsViewController
final class FriendsViewController: UIViewController {
    
    // MARK: - Private Methods
    private let chatCellID = "chatCell"
    
    private let persons = Person.getPersonList()
    
    // MARK: - UI Elements
    private lazy var chatsView: UITableView = {
        let tableView = UITableView(frame: view.frame, style: .insetGrouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: chatCellID)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 90
        
        return tableView
    }()
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Private Methods
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(chatsView)
        
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        title = "Friends"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension FriendsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            "New"
        default:
            "Best"
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        persons.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: chatCellID, for: indexPath)
        
        let person = persons[indexPath.section][indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = person.fullName
        content.secondaryText = "\(person.messages.count) сообщения"
        content.image = UIImage(named: person.fullName)
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        
        cell.contentConfiguration = content
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
}

extension FriendsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = persons[indexPath.section][indexPath.row]
        
        let profileVC = ProfileViewController()
        profileVC.person = person
        
        navigationController?.pushViewController(profileVC, animated: true)
    }
}


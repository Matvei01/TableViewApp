//
//  ProfileViewController.swift
//  TableViewApp
//
//  Created by Matvei Khlestov on 13.04.2024.
//

import UIKit

struct Contact {
    let name: String
    let surname: String
    let image: String
    let message: String
    
    var fullName: String {
        "\(surname) \(name)"
    }
    
    static func getContactList() -> [[Contact]] {
        [
            [
                Contact(
                    name: "Борис",
                    surname: "Богатов",
                    image: "Богатов Борис",
                    message: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod"
                ),
                Contact(
                    name: "Мария",
                    surname: "Глазкова",
                    image: "Глазкова Мария",
                    message: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"
                ),
                Contact(
                    name: "Наталья",
                    surname: "Егорова",
                    image: "Егорова Наталья",
                    message: "Lorem ipsum dolor sit amet, consectetur"
                )
            ]
        ]
        
    }
}

// MARK: - ProfileViewController
final class ProfileViewController: UIViewController {
    
    // MARK: - Public Properties
    var person: Person!
    
    // MARK: - Private Properties
    private let massageCellID = "massageCell"
    
    private let contacts = Contact.getContactList()
    
    // MARK: - UI Elements
    private lazy var personImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: person.fullName)
        imageView.frame.origin = CGPoint(x: 0, y: 114)
        imageView.frame.size = CGSize(width: 136, height: 136)
        imageView.center.x = view.center.x
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageView.frame.width / 2
        
        return imageView
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = person.fullName
        label.textAlignment = .center
        label.frame.origin = CGPoint(x: 0, y: personImageView.frame.maxY + 27)
        label.frame.size = CGSize(width: 139, height: 24)
        label.center.x = view.center.x
        
        return label
    }()
    
    private lazy var massagesView: UITableView = {
        let tableView = UITableView(
            frame: CGRect(
                x: 0,
                y: fullNameLabel.frame.maxY + 50,
                width: view.frame.width,
                height: view.frame.height / 2
            ),
            style: .insetGrouped
        )
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: massageCellID)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 90
        
        return tableView
    }()
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .secondarySystemBackground
        
        addSubviews()
    }
    
    private func addSubviews() {
        setupSubviews(
            personImageView,
            fullNameLabel,
            massagesView
        )
    }
    
    private func setupSubviews(_ subviews: UIView... ) {
        for subview in subviews {
            view.addSubview(subview)
        }
    }
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Massages"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: massageCellID, for: indexPath)
        
        let contact = contacts[indexPath.section][indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = contact.fullName
        content.secondaryText = contact.message
        content.image = UIImage(named: contact.fullName)
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        
        cell.contentConfiguration = content
        
        return cell
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

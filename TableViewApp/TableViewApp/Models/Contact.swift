//
//  Contact.swift
//  TableViewApp
//
//  Created by Matvei Khlestov on 14.04.2024.
//

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

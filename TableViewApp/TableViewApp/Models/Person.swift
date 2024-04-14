//
//  Person.swift
//  TableViewApp
//
//  Created by Matvei Khlestov on 14.04.2024.
//

struct Person {
    let name: String
    let surname: String
    let image: String
    let messages: [String]
    
    var fullName: String {
        "\(surname) \(name)"
    }
    
    static func getPersonList() -> [[Person]] {
        [
            [
                Person(
                    name: "Борис",
                    surname: "Богатов",
                    image: "Богатов Борис",
                    messages: [
                        "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod",
                        "Lorem ipsum dolor sit amet, consectetur adipisicing elit",
                        "Lorem ipsum dolor sit amet, consectetur",
                        "Lorem ipsum dolor sit amet"
                    ]
                ),
                Person(
                    name: "Мария",
                    surname: "Глазкова",
                    image: "Глазкова Мария",
                    messages: [
                        "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod",
                        "Lorem ipsum dolor sit amet, consectetur adipisicing elit",
                    ]
                ),
                Person(
                    name: "Наталья",
                    surname: "Егорова",
                    image: "Егорова Наталья",
                    messages: [
                        "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod",
                        "Lorem ipsum dolor sit amet, consectetur adipisicing elit",
                        "Lorem ipsum dolor sit amet, consectetur"
                    ]
                )
            ],
            
            [
                Person(
                    name: "Иван",
                    surname: "Иванов",
                    image: "Иванов Иван",
                    messages: [
                        "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod",
                        "Lorem ipsum dolor sit amet, consectetur adipisicing elit",
                        "Lorem ipsum dolor sit amet, consectetur"
                    ]
                ),
                Person(
                    name: "Максим",
                    surname: "Петров",
                    image: "Петров Максим",
                    messages: [
                        "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod",
                        "Lorem ipsum dolor sit amet, consectetur adipisicing elit",
                        "Lorem ipsum dolor sit amet, consectetur"
                    ]
                ),
                Person(
                    name: "Михаил",
                    surname: "Сидоров",
                    image: "Сидоров Михаил",
                    messages: [
                        "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod",
                        "Lorem ipsum dolor sit amet, consectetur adipisicing elit",
                        "Lorem ipsum dolor sit amet, consectetur"
                    ]
                )
            ]
        ]
    }
}

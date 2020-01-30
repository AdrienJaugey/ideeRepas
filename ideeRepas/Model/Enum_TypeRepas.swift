//
//  Enum_TypeRepas.swift
//  ideeRepas
//
//  Created by Adrien Jaugey on 19/12/2019.
//  Copyright © 2019 Adrien Jaugey. All rights reserved.
//

enum Enum_TypeRepas: String, Codable {
    case entree = "Entrée"
    case principal = "Plat Principal"
    case dessert = "Dessert"
    case boisson = "Boisson"
    case autre = "Autre"
    
    static let allValues = [entree, principal, dessert, boisson, autre]
    static let allFullString = ["Entrée", "Plat Principal", "Dessert", "Boisson", "Autre"]
    
}

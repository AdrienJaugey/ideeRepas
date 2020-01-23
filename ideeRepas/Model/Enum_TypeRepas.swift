//
//  Enum_TypeRepas.swift
//  ideeRepas
//
//  Created by Adrien Jaugey on 19/12/2019.
//  Copyright © 2019 Adrien Jaugey. All rights reserved.
//

enum Enum_TypeRepas : String {
    case entree = "entree"
    case principal = "principal"
    case dessert = "dessert"
    case boisson = "boisson"
    case autre = "autre"
    
    static let allValues = [entree, principal, dessert, boisson, autre]
    static let allFullString = ["Entrée", "Plat Principal", "Dessert", "Boisson", "Autre"]
    
    public var description: String {
        switch self {
        case .entree:
            return "entree"
        case .principal:
            return "principal"
        case .dessert:
            return "dessert"
        case .boisson:
            return "boisson"
        case .autre:
            return "autre"
        }
    }
    
}

//
//  Enum_TypeRepas.swift
//  ideeRepas
//
//  Created by Adrien Jaugey on 19/12/2019.
//  Copyright © 2019 Adrien Jaugey. All rights reserved.
//

enum Enum_TypeRepas {
    case entree, principal, dessert, boisson, autre
    
    public var description: String {
        switch "\(self)" {
        case "entree":
            return "Entrée"
        case "principal":
            return "Plat Principal"
        case "dessert":
            return "Dessert"
        case "boisson":
            return "Boisson"
        case "autre":
            return "Autre"
        default:
            return "\(self)"
        }
    }
    
}

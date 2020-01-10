//
//  Enum_TypeRepas.swift
//  ideeRepas
//
//  Created by Adrien Jaugey on 19/12/2019.
//  Copyright © 2019 Adrien Jaugey. All rights reserved.
//

enum Enum_TypeRepas : String {
    case entree = "entree", principal = "principal", dessert = "dessert", boisson = "boisson", autre = "autre"
    
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
        default:
            return "\(self)"
        }
    }
    
}

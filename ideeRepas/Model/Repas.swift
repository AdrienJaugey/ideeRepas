//
//  Repas.swift
//  ideeRepas
//
//  Created by Adrien Jaugey on 19/12/2019.
//  Copyright © 2019 Adrien Jaugey. All rights reserved.
//

import Foundation

class Repas {
    
    private var nom: String {
        get {
            return self.nom
        }
        set {
            if !newValue.isEmpty {
                self.nom = newValue
            }
        }
    }
    
    private var type: Enum_TypeRepas {
        get { return self.type }
        set { self.type = newValue }
    }
    
    private var dureePreparation: Int {
        get { return self.dureePreparation }
        set { if newValue >= 0 { self.dureePreparation = newValue } }
    }
    
    private var dureeCuisson: Int {
        get { return self.dureeCuisson }
        set { if newValue >= 0 { self.dureeCuisson = newValue } }
    }
    
    private var ingredients: [String]
    
    private var etapes: [String]
    
    init(nom: String, type: Enum_TypeRepas, dureePreparation: Int, dureeCuisson: Int){
        self.nom = nom
        self.type = type
        self.dureePreparation = dureePreparation
        self.dureeCuisson = dureeCuisson
    }
    
    func getIngredients() -> [String] {
        return self.ingredients
    }
    
    func getIngredient(at: Int) -> String? {
        return ingredients.count > at ? ingredients[at] : nil
    }
    
    func addIngredient(ingredient: String) {
        self.ingredients.append(ingredient)
    }
    
    func getEtapes() -> [String]? {
        return self.etapes
    }
    
    func getEtape(at: Int) -> String? {
        return etapes.count > at ? etapes[at] : nil
    }
    
    func addEtape(description: String) {
        self.etapes.append(description)
    }
    
    func getSimpleDescritption() -> String {
        var desc = self.type.description + " : " + self.nom + "\n"
        if ingredients.count > 0 {
            desc += "Ingredient" + (ingredients.count > 1 ? "s" : "") + " : "
            for i in 0...ingredients.count {
                desc += ingredients[i] + ((i < ingredients.count - 1) ? ", " : "")
            }
        }
        return desc
    }
    
}

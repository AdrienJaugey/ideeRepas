//
//  Repas.swift
//  ideeRepas
//
//  Created by Adrien Jaugey on 19/12/2019.
//  Copyright © 2019 Adrien Jaugey. All rights reserved.
//

import Foundation

class Repas: Codable {
    
    private var _nom: String
    var nom: String {
        get {
            return self._nom
        }
        set {
            if !newValue.isEmpty {
                self._nom = newValue
            }
        }
    }
    
    private var _type: Enum_TypeRepas
    var type: Enum_TypeRepas {
        get { return self._type }
        set { self._type = newValue }
    }
    
    private var _dureePreparation: Int
    var dureePreparation: Int {
        get { return self._dureePreparation }
        set { if newValue >= 0 { self._dureePreparation = newValue } }
    }
    
    private var _dureeCuisson: Int
    var dureeCuisson: Int {
        get { return self._dureeCuisson }
        set { if newValue >= 0 { self._dureeCuisson = newValue } }
    }
    
    private var _dureeRepos: Int
    var dureeRepos: Int {
        get { return self._dureeRepos }
        set { if newValue >= 0 { self._dureeRepos = newValue } }
    }
    
    var ingredients = [String]()
    
    var etapes = [String]()
    
    init(nom: String, type: Enum_TypeRepas, dureePreparation: Int, dureeCuisson: Int, dureeRepos: Int){
        self._nom = nom
        self._type = type
        self._dureePreparation = dureePreparation
        self._dureeCuisson = dureeCuisson
        self._dureeRepos = dureeRepos
    }
    
    init(){
        self._nom = ""
        self._type = .autre
        self._dureePreparation = 0
        self._dureeCuisson = 0
        self._dureeRepos = 0
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
        var desc = self.type.rawValue + " : " + self.nom + "\n"
        if ingredients.count > 0 {
            desc += "Ingredient" + (ingredients.count > 1 ? "s" : "") + " : "
            for i in 0..<ingredients.count {
                desc += ingredients[i] + ((i < ingredients.count - 1) ? ", " : "")
            }
        }
        return desc
    }
    
    static func ==(left: Repas, right: Repas) -> Bool {
        var res = left._nom == right._nom
        res = res && left._type == right._type
        res = res && left._dureePreparation == right._dureePreparation
        res = res && left._dureeCuisson == right._dureeCuisson
        res = res && left._dureeRepos == right._dureeRepos
        res = res && left.ingredients.count == right.ingredients.count
        if res {
            for i in 0...left.ingredients.count {
                res = res && left.ingredients[i] == right.ingredients[i]
            }
        }
        res = res && left.etapes.count == right.etapes.count
        if res {
            for i in 0...left.etapes.count {
                res = res && left.etapes[i] == right.etapes[i]
            }
        }
        return res
    }
    
    static func >(left: Repas, right: Repas) -> Bool {
        return left._nom > right._nom
    }
    
}

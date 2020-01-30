//
//  Gestionnaire.swift
//  ideeRepas
//
//  Created by Adrien Jaugey on 06/01/2020.
//  Copyright © 2020 Adrien Jaugey. All rights reserved.
//

import Foundation

class Gestionnaire {
    private static let instance = Gestionnaire()
    private var repas = [Repas]()
    
    private init(){
        //On récupère le tableau stocké dans la mémoire ou on en initialise un nouveau s'il n'en existe pas en mémoire
        let defaults = UserDefaults.standard
        if let savedRepas = defaults.object(forKey: "savedRepas") as? Data {
            let decoder = JSONDecoder()
            if let repas = try? decoder.decode([Repas].self, from: savedRepas) {
                self.repas = repas
            }
        }
        
        
    }
    
    static func get() -> Gestionnaire {
        return instance
    }
    
    func getRepas(at: Int) -> Repas? {
        return repas.count > at ? repas[at] : nil
    }
    
    func getNbRepas() -> Int {
        return repas.count
    }
    
    func addRepas(_ plat: Repas){
        self.repas.append(plat)
        saveData()
    }
    
    func removeRepas(_ plat: Repas) -> Bool{
        var index = -1
        for i in 0...repas.count {
            if repas[i] == plat {
                index = i
            }
        }
        if index != -1 {
            repas.remove(at: index)
            saveData()
            return true
        }
        return false
    }
    
    func removeRepas(id: Int) -> Bool{
        if(id >= 0 && id < repas.count){
            repas.remove(at: id)
            saveData()
            return true
        }
        return false
    }
    
    func saveData(){
        let defaults = UserDefaults.standard
        if repas.count > 0 {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(repas) {
                let defaults = UserDefaults.standard
                defaults.set(encoded, forKey: "savedRepas")
            }
        } else {
            defaults.removeObject(forKey: "savedRepas")
        }
    }
}

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
            //print("json saved " + String(data: savedRepas, encoding: .utf8)!)
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
            repas.sort { (r1, r2) -> Bool in
                return r2 > r1
            }
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(repas) {
                //print("json saving " + String(data: encoded, encoding: .utf8)!)
                let defaults = UserDefaults.standard
                defaults.set(encoded, forKey: "savedRepas")
            } else {
                print("json encoding failed")
            }
        } else {
            defaults.removeObject(forKey: "savedRepas")
        }
    }
}

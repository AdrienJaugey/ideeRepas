//
//  Gestionnaire.swift
//  ideeRepas
//
//  Created by Adrien Jaugey on 06/01/2020.
//  Copyright © 2020 Adrien Jaugey. All rights reserved.
//

import Foundation

class Gestionnaire {
    private let instance = Gestionnaire()
    private let repas : [Repas]
    
    private init(){
        self.repas = [Repas]()
    }
    
    func get() -> Gestionnaire {
        return instance
    }
    
    func getRepas(at: Int) -> Repas? {
        return repas.count > at ? repas[at] : nil
    }
    
    func getNbRepas() -> Int {
        return repas.count
    }
    
    func addRepas(repas: Repas){
        
    }
}

//
//  Gestionnaire.swift
//  ideeRepas
//
//  Created by Adrien Jaugey on 06/01/2020.
//  Copyright © 2020 Adrien Jaugey. All rights reserved.
//

import Foundation
import UIKit

class Gestionnaire {
    private static let instance = Gestionnaire()
    private var repas : [Repas]
    
    private init(){
        self.repas = [Repas]()
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
    }
}

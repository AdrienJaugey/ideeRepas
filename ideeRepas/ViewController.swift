//
//  ViewController.swift
//  ideeRepas
//
//  Created by Adrien Jaugey on 18/12/2019.
//  Copyright © 2019 Adrien Jaugey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var test = Repas(nom: "Double Ration de frite", type: Enum_TypeRepas.principal, dureePreparation: 0, dureeCuisson: 10)
        test.addIngredient(ingredient: "Patate")
        test.addIngredient(ingredient: "Sel")
        test.addEtape(description: "Ouvrir le sachet de frites industrielles.")
        test.addEtape(description: "Plonger les frites surgelés dans l'huile bouillante pendant 10 minutes.")
        test.addEtape(description: "Sortir les frites et servir 2 rations.")
        test.addEtape(description: "Saler comme Salt bae")
        print(test.getSimpleDescritption())
    }


}


//
//  ViewController.swift
//  ideeRepas
//
//  Created by Adrien Jaugey on 18/12/2019.
//  Copyright © 2019 Adrien Jaugey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    private var gest = Gestionnaire.get()
    @IBOutlet weak var listeRepas: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gest.getNbRepas()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repasCell", for: indexPath) as! RepasCell
        let row = indexPath.row
        
        let temp = gest.getRepas(at: row)
        
        let dark = self.traitCollection.userInterfaceStyle == .dark
        print(dark ? "Thème Sombre" : "Thème Clair")
        
        print((temp?.type.description ?? "principal") + (dark ? "_dark" : "") + ".png")
        cell.repasImg.image = UIImage(named: (temp?.type.description ?? "principal") + ".png")
        cell.repasLabel.text = temp?.nom
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let test = Repas(nom: "Double Ration de frite", type: Enum_TypeRepas.principal, dureePreparation: 0, dureeCuisson: 10)
        test.addIngredient(ingredient: "Patate")
        test.addIngredient(ingredient: "Sel")
        test.addEtape(description: "Ouvrir le sachet de frites industrielles.")
        test.addEtape(description: "Plonger les frites surgelés dans l'huile bouillante pendant 10 minutes.")
        test.addEtape(description: "Sortir les frites et servir 2 rations.")
        test.addEtape(description: "Saler comme Salt bae")
        print(test.getSimpleDescritption())
        gest.addRepas(test)
        
        self.listeRepas.dataSource = self
    }


}


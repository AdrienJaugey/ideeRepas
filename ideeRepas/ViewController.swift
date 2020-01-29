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
        let img = "\(temp?.type ?? .principal)" + (dark ? "_dark" : "") + ".png"
        cell.repasImg.image = UIImage(named: img)
        cell.repasLabel.text = temp?.nom
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let test = Repas(nom: "Double Ration de frite", type: Enum_TypeRepas.principal, dureePreparation: 0, dureeCuisson: 10, dureeRepos: 0)
        test.addIngredient(ingredient: "Patate")
        test.addIngredient(ingredient: "Sel")
        test.addEtape(description: "Ouvrir le sachet de frites industrielles.")
        test.addEtape(description: "Plonger les frites surgelés dans l'huile bouillante pendant 10 minutes.")
        test.addEtape(description: "Sortir les frites et servir 2 rations.")
        test.addEtape(description: "Saler comme Salt bae")
        print(test.getSimpleDescritption())
        gest.addRepas(test)
        
        let test2 = Repas(nom: "La bonne bouillabaisse", type: Enum_TypeRepas.principal, dureePreparation: 15, dureeCuisson: 60, dureeRepos: 20)
        test2.addIngredient(ingredient: "pommes de terre")
        test2.addIngredient(ingredient: "Poissons de roche")
        //test2.addEtape(description: "Balancer le tout par la fenêtre")
        print(test.getSimpleDescritption())
        gest.addRepas(test2)
        
        let test3 = Repas(nom: "Tiramisu", type: .dessert, dureePreparation: 30, dureeCuisson: 0, dureeRepos: 240)
        test3.addIngredient(ingredient: "Mascarpone")
        test3.addIngredient(ingredient: "Sucre")
        test3.addIngredient(ingredient: "Oeufs")
        test3.addIngredient(ingredient: "Biscuits Cuillères")
        test3.addIngredient(ingredient: "Café")
        test3.addIngredient(ingredient: "Cacao")
        test3.addEtape(description: "Mélanger la mascarpone et le sucre")
        test3.addEtape(description: "Battre les blancs en neige")
        test3.addEtape(description: "Mélanger délicatement avec la préparation")
        gest.addRepas(test3)
        self.listeRepas.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showRepas" {
                let detailsRepasVC = segue.destination as! ShowRepasVC
                let row = listeRepas.indexPathForSelectedRow!.row
                detailsRepasVC.platID = row
            }
    }
    
    @IBAction func unwindToMainVC(_ unwindSegue: UIStoryboardSegue) {
        if unwindSegue.identifier == "save" {
            let sourceVC = unwindSegue.source as! EditRepasVC
            if let platId = sourceVC.platID {
                print(platId)
            } else {
                
            }
        }
    }
    
    @IBAction func refreshTableView(_ sender: Any) {
        listeRepas.reloadData()
    }
    
}


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
    @IBOutlet weak var addButton: UIButton!
    
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
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
            let repas = gest.getRepas(at: indexPath.row)
            let alert = UIAlertController(title: "Êtes-vous sûr de vouloir supprimer l'entrée suivante : \(repas?.nom ?? "plat") ?", message: "Cette action est irréversible", preferredStyle: .actionSheet)

            alert.addAction(UIAlertAction(title: "Oui", style: .destructive, handler: { action in
                if(self.gest.removeRepas(id: indexPath.row)){
                    self.listeRepas.reloadData()
                }
            }))
            alert.addAction(UIAlertAction(title: "Non", style: .cancel, handler: nil))

            self.present(alert, animated: true)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dark = self.traitCollection.userInterfaceStyle == .dark
        addButton.layer.cornerRadius = addButton.frame.width / 2.0
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(actualiser), name: UIApplication.willEnterForegroundNotification, object: nil)
        
        if(gest.getNbRepas() == 0){
            print("coucou")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                let alert = UIAlertController(title: "Aucun plat en mémoire", message: "Commencez par ajouter un plat en utilisant le bouton en haut à droite ou ajoutez un plat par défaut en exemple", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Ajouter moi-même un plat", style: .default, handler: { action in
                    let color = CGColor(srgbRed: (dark ? 255 : 0), green: (dark ? 255 : 0), blue: (dark ? 255 : 0), alpha: 50)
                    let defaultTint = self.addButton.tintColor
                    let tint = (dark ? UIColor.black : UIColor.white)
                    self.addButton.tintColor = tint
                    UIView.animate(withDuration: 0.5) {
                        self.addButton.layer.backgroundColor = color
                        self.addButton.tintColor = tint
                    }
                    print(1)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        UIView.animate(withDuration: 0.5) {
                            self.addButton.layer.backgroundColor = nil
                            self.addButton.tintColor = defaultTint
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            UIView.animate(withDuration: 0.5) {
                                self.addButton.layer.backgroundColor = color
                                self.addButton.tintColor = tint
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                UIView.animate(withDuration: 0.5) {
                                    self.addButton.layer.backgroundColor = nil
                                    self.addButton.tintColor = defaultTint
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    UIView.animate(withDuration: 0.5) {
                                        self.addButton.layer.backgroundColor = color
                                        self.addButton.tintColor = tint
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        UIView.animate(withDuration: 0.5) {
                                            self.addButton.layer.backgroundColor = nil
                                            self.addButton.tintColor = defaultTint
                                        }
                                        self.addButton.tintColor = defaultTint
                                    }
                                }
                            }
                        }
                    }
                }))
                alert.addAction(UIAlertAction(title: "Ajouter un exemple", style: .default, handler: { action in
                    let platDefaut = Repas(nom: "Tiramisu", type: .dessert, dureePreparation: 30, dureeCuisson: 0, dureeRepos: 240)
                    platDefaut.addIngredient(ingredient: "Mascarpone")
                    platDefaut.addIngredient(ingredient: "Sucre")
                    platDefaut.addIngredient(ingredient: "Oeufs")
                    platDefaut.addIngredient(ingredient: "Biscuits Cuillères")
                    platDefaut.addIngredient(ingredient: "Café")
                    platDefaut.addIngredient(ingredient: "Cacao")
                    platDefaut.addEtape(description: "Mélanger la mascarpone et le sucre")
                    platDefaut.addEtape(description: "Battre les blancs en neige")
                    platDefaut.addEtape(description: "Mélanger délicatement avec la préparation")
                    self.gest.addRepas(platDefaut)
                    self.listeRepas.reloadData()
                }))
                self.present(alert, animated: true)
            }
        }
        
        self.listeRepas.dataSource = self
    }
    
    @objc func ajoutDefaut(){
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRepas" {
            let showVC = (segue.destination as! ShowRepasVC)
            let row = listeRepas.indexPathForSelectedRow!.row
            showVC.platID = row
        }
    }
    
    @IBAction func unwindToMainVC(_ unwindSegue: UIStoryboardSegue) {
        if unwindSegue.identifier == "save" {
            let sourceVC = unwindSegue.source as! EditRepasVC
            var repas = Repas()
            if let platId = sourceVC.platID {
                print(platId)
                repas = Gestionnaire.get().getRepas(at: platId)!
            } else {
                Gestionnaire.get().addRepas(repas)
            }
            repas.nom = sourceVC.nomLabel.text!
            repas.type = Enum_TypeRepas.allValues[sourceVC.typeRepasPicker.selectedRow(inComponent: 0)]
            repas.dureePreparation = Int(sourceVC.prepaSwitch.isOn ? sourceVC.dureePrepa.countDownDuration / 60: 0)
            repas.dureeCuisson = Int(sourceVC.cuissonSwitch.isOn ? sourceVC.dureeCuisson.countDownDuration / 60: 0)
            repas.dureeRepos = Int(sourceVC.reposSwitch.isOn ? sourceVC.dureeRepos.countDownDuration / 60 : 0)
            var ingredients = [String]()
            let ingredientsTexte = sourceVC.ingredientsTV.text.split(separator: "\n")
            for ing in ingredientsTexte {
                ingredients.append(String(ing))
            }
            repas.ingredients = ingredients
            var etapes = [String]()
            let etapesTexte = sourceVC.etapesTV.text.split(separator: "\n")
            for etape in etapesTexte {
                etapes.append(String(etape))
            }
            repas.etapes = etapes
            sourceVC.dismiss(animated: true) {
                self.actualiser()
            }
        }
    }
    
    @objc func actualiser(){
        if let tv = listeRepas {
            tv.reloadData()
        }
    }
}


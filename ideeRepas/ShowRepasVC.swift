//
//  ShowRepasVC.swift
//  ideeRepas
//
//  Created by Adrien Jaugey on 20/01/2020.
//  Copyright © 2020 Adrien Jaugey. All rights reserved.
//

import UIKit

class ShowRepasVC: UIViewController {
    
    var platID: Int?
    var repas: Repas!
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var typeImage: UIImageView!
    @IBOutlet weak var nomLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet var clockImage: [UIImageView]!
    @IBOutlet var timerLabel: [UILabel]!
    @IBOutlet weak var ingredientsTV: UITextView!
    @IBOutlet weak var etapesTV: UITextView!
    
    @IBAction func Retour(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func rotate(){
        let rotation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = Double.pi * 2
        rotation.duration = 0.250 // or however long you want ...
        rotation.isCumulative = false
        rotation.repeatCount = 4//Float.greatestFiniteMagnitude
        self.typeImage.layer.add(rotation, forKey: "rotationAnimation")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dark = self.traitCollection.userInterfaceStyle == .dark
        
        repas = Gestionnaire.get().getRepas(at: platID!)
        navigationBar.topItem?.title = repas.nom
        nomLabel.text = repas.nom
        typeLabel.text = repas.type.rawValue
        typeImage.image = UIImage(named: "\(repas.type)" + (dark ? "_dark" : "") + ".png")
        typeImage.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(rotate))
        typeImage.addGestureRecognizer(tap)
        let clockPicture = "UI_icon_clock" + (dark ? "_dark" : "") + ".png"
        for clock in clockImage {
            clock.image = UIImage(named: clockPicture)
        }
        for i in 0...2 {
            var timer = 0
            switch i {
            case 0:
                timer = repas.dureePreparation
            case 1:
                timer = repas.dureeCuisson
            case 2:
                timer = repas.dureeRepos
            default:
                timer = 0
            }
            let h = timer / 60
            let m = timer % 60
            var texte = ""
            if(h == 0 && m == 0){
                texte = "Aucun" + (i != 2 ? "e" : "")
            } else {
                texte = (h > 0 ? String(h) + " h " : "") + String(m) + " min"
            }
            timerLabel[i].text = texte
        }
        var textIngredient = ""
        for ingre in repas.ingredients {
            textIngredient += "   • " + ingre + "\n"
        }
        if(textIngredient == ""){
            textIngredient = "Aucune donnée"
        }
        ingredientsTV.text = textIngredient
        var textEtapes = ""
        for etape in repas.etapes {
            textEtapes += "   • " + etape + "\n"
        }
        if(textEtapes == ""){
            textEtapes = "Aucune donnée"
        }
        etapesTV.text = textEtapes
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "edit" {
            let editVC = segue.destination as! EditRepasVC
            editVC.platID = platID
        }
    }
    
    @objc func actualiser(){
        let dark = self.traitCollection.userInterfaceStyle == .dark
        if let img = typeImage {
            img.image = UIImage(named: "\(repas.type)" + (dark ? "_dark" : "") + ".png")
            let clockPicture = "UI_icon_clock" + (dark ? "_dark" : "") + ".png"
            for clock in clockImage {
                clock.image = UIImage(named: clockPicture)
            }
        }
    }

}

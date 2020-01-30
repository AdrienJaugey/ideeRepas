//
//  UserManualVC.swift
//  ideeRepas
//
//  Created by Adrien Jaugey on 30/01/2020.
//  Copyright © 2020 Adrien Jaugey. All rights reserved.
//

import UIKit

class UserManualVC: UIViewController {
    @IBOutlet weak var titre: UILabel!
    @IBOutlet weak var ajoutTitre: UILabel!
    @IBOutlet weak var ajoutDesc: UITextView!
    @IBOutlet weak var consulterTitre: UILabel!
    @IBOutlet weak var consulterDesc: UITextView!
    @IBOutlet weak var editerTitre: UILabel!
    @IBOutlet weak var editerDesc: UITextView!
    @IBOutlet weak var supprimerTitre: UILabel!
    @IBOutlet weak var supprimerDesc: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titre.text = "Bienvenue dans l'application Idée Repas !"
        ajoutTitre.text = " • Pour ajouter un repas :"
        ajoutDesc.text = "\tCliquez sur le bouton \"+\" en haut à droite de l'écran principal. "
        + "Remplissez les informations nécessaires telles que le nom, le type de plat, "
        + "les différentes durées associées, les ingrédients ou encore les étapes pour le préparer, le cuire et/ou le servir.\n"
        + "\tLes différents ingrédients et étapes sont à séparer par un retour à la ligne.\n"
        + "\tEnfin, cliquez sur le bouton \"Sauvegarder\" en haut à droite si vous voulez le garder ou \"Retour\" pour annuler son ajout."
        
        consulterTitre.text = " • Pour consulter un repas :"
        consulterDesc.text = "\tCliquez sur un repas dans la liste de la vue principale."
            
        editerTitre.text = " • Pour éditer un repas :"
        editerDesc.text = "\tLorsque vous consultez un repas, cliquez sur le bouton \"Éditer\" en haut à droite. La suite est similaire à l'ajout d'un repas."
        
        supprimerTitre.text = " • Pour supprimer un repas :"
        supprimerDesc.text = "\tSur la vue principale effectuez un swipe vers la gauche sur le repas que vous voulez supprimer. Il ne vous reste plus qu'à valider ou non la suppression."
    }
    
}

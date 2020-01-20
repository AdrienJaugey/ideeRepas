//
//  DetailsRepasVC.swift
//  ideeRepas
//
//  Created by Adrien Jaugey on 20/01/2020.
//  Copyright © 2020 Adrien Jaugey. All rights reserved.
//

import UIKit

class EditRepasVC: UIViewController {
    
    var platID: Int?
    var repas: Repas!

    @IBOutlet weak var navigationBar: UINavigationBar!
    
    @IBAction func Retour(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let id = platID {
            repas = Gestionnaire.get().getRepas(at: id)
            navigationBar.topItem?.title = "Editer " + repas.nom
            print(repas!.getSimpleDescritption())
        } else {
            navigationBar.topItem?.title = "Nouveau Plat"
        }
        // Do any additional setup after loading the view.
    }
    
    /*func getRepas() -> Repas? {
        
    }*/

}

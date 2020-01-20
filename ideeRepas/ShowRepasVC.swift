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
    
    @IBAction func Retour(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        repas = Gestionnaire.get().getRepas(at: platID!)
        navigationBar.topItem?.title = repas.nom
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "edit" {
            let editVC = segue.destination as! EditRepasVC
            editVC.platID = platID
        }
    }

}

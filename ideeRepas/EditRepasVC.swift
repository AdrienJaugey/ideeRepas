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
    var repas: Repas?

    @IBOutlet weak var navigationBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let id = platID {
            self.title = "Editer Plat"
            repas = Gestionnaire.get().getRepas(at: id)
            print(repas!.getSimpleDescritption())
        } else {
            self.title = "Nouveau Plat"
            
        }
        // Do any additional setup after loading the view.
    }

}

//
//  DetailsRepasVC.swift
//  ideeRepas
//
//  Created by Adrien Jaugey on 20/01/2020.
//  Copyright © 2020 Adrien Jaugey. All rights reserved.
//

import UIKit

class EditRepasVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var types = Enum_TypeRepas.allValues
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return types.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return types[row].description
    }
    
    var platID: Int?
    var repas: Repas!

    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var typeRepasPicker: UIPickerView!
    
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
        self.typeRepasPicker.delegate = self
        self.typeRepasPicker.dataSource = self
    }
    
    /*func getRepas() -> Repas? {
        
    }*/

}

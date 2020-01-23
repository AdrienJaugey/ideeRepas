//
//  DetailsRepasVC.swift
//  ideeRepas
//
//  Created by Adrien Jaugey on 20/01/2020.
//  Copyright © 2020 Adrien Jaugey. All rights reserved.
//

import UIKit

class EditRepasVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Enum_TypeRepas.allFullString.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Enum_TypeRepas.allFullString[row].description
    }
    
    var platID: Int?
    var repas: Repas!

    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var typeRepasPicker: UIPickerView!
    @IBOutlet weak var nomLabel: UITextField!
    @IBOutlet weak var dureePrepa: UIDatePicker!
    @IBOutlet weak var dureeCuisson: UIDatePicker!
    @IBOutlet weak var dureeRepos: UIDatePicker!
    @IBOutlet weak var ingredientsLabel: UITextField!
    @IBOutlet weak var etapesLabel: UITextField!
    
    @IBAction func Retour(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.typeRepasPicker.delegate = self
        self.typeRepasPicker.dataSource = self
        
        if let id = platID {
            repas = Gestionnaire.get().getRepas(at: id)
            navigationBar.topItem?.title = "Editer " + repas.nom
            print(repas!.getSimpleDescritption())
            nomLabel.text = repas.nom
            let index = Enum_TypeRepas.allValues.firstIndex(of: repas.type)!
            typeRepasPicker.selectRow(index, inComponent: 0, animated: true)
            dureePrepa.countDownDuration = TimeInterval(repas.dureePreparation * 60)
            dureeCuisson.countDownDuration = TimeInterval(repas.dureeCuisson * 60)
            dureeRepos.countDownDuration = TimeInterval(repas.dureeRepos * 60)
            ingredientsLabel.text = "\(repas.ingredients)"
            etapesLabel.text = "\(repas.etapes)"
        } else {
            navigationBar.topItem?.title = "Nouveau Plat"
        }
        
    }
    
    /*func getRepas() -> Repas? {
        
    }*/

}

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
    var typeRepas = Enum_TypeRepas.principal

    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var typeRepasPicker: UIPickerView!
    @IBOutlet weak var nomLabel: UITextField!
    @IBOutlet weak var dureePrepa: UIDatePicker!
    @IBOutlet weak var prepaSwitch: UISwitch!
    @IBOutlet weak var dureeCuisson: UIDatePicker!
    @IBOutlet weak var cuissonSwitch: UISwitch!
    @IBOutlet weak var dureeRepos: UIDatePicker!
    @IBOutlet weak var reposSwitch: UISwitch!
    @IBOutlet weak var ingredientsTV: UITextView!
    @IBOutlet weak var etapesTV: UITextView!
    
    @IBAction func Retour(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func toggleTimer(_ sender: Any) {
        dureePrepa.isEnabled = prepaSwitch.isOn
        dureeCuisson.isEnabled = cuissonSwitch.isOn
        dureeRepos.isEnabled = reposSwitch.isOn
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ingredientsTV.layer.borderColor = CGColor(srgbRed: 192, green: 192, blue: 192, alpha: 50)
        etapesTV.layer.borderColor = CGColor(srgbRed: 192, green: 192, blue: 192, alpha: 50)
        self.typeRepasPicker.delegate = self
        self.typeRepasPicker.dataSource = self
        
        if let id = platID {
            repas = Gestionnaire.get().getRepas(at: id)
            navigationBar.topItem?.title = "Editer Repas"
            print(repas!.getSimpleDescritption())
            nomLabel.text = repas.nom
            let index = Enum_TypeRepas.allValues.firstIndex(of: repas.type)!
            typeRepasPicker.selectRow(index, inComponent: 0, animated: true)
            if(repas.dureePreparation > 0){
                dureePrepa.countDownDuration = TimeInterval(repas.dureePreparation * 60)
            } else {
                dureePrepa.isEnabled = false
                prepaSwitch.isOn = false
            }
            if(repas.dureeCuisson > 0){
                dureeCuisson.countDownDuration = TimeInterval(repas.dureeCuisson * 60)
            } else {
                dureePrepa.isEnabled = false
                cuissonSwitch.isOn = false
            }
            if(repas.dureeRepos > 0){
                dureeRepos.countDownDuration = TimeInterval(repas.dureeRepos * 60)
            }else {
                dureeRepos.isEnabled = false
                reposSwitch.isOn = false
            }
            var textIngredient = ""
            for ingre in repas.ingredients {
                textIngredient += ingre + "\n"
            }
            ingredientsTV.text = textIngredient
            var textEtapes = ""
            for etape in repas.etapes {
                textEtapes += etape + "\n"
            }
            etapesTV.text = textEtapes
        } else {
            navigationBar.topItem?.title = "Nouveau Plat"
            prepaSwitch.isOn = false
            dureePrepa.isEnabled = false
            cuissonSwitch.isOn = false
            dureeCuisson.isEnabled = false
            reposSwitch.isOn = false
            dureeCuisson.isEnabled = false
        }
        
    }
    
    /*func getRepas() -> Repas? {
        
    }*/

}

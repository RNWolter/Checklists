//
//  itemDetailViewController.swift
//  Checklists
//
//  Created by Rick Wolter on 10/7/18.
//  Copyright © 2018 Razeware. All rights reserved.
//

import UIKit

protocol ItemDetailViewControllerDelegate: class {
    func itemDetailViewControllerDidCancel(_ controller: ItemDetailV)
    func itemDetailViewController (_ controller: ItemDetailV, didFinishAdding item: ChecklistItem)
    func itemDetailViewController (_ controller: ItemDetailV, didFinishEditing item: ChecklistItem)
}

class ItemDetailV: UITableViewController, UITextFieldDelegate {

    
   
    
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
     @IBOutlet weak var addTextField: UITextField!
    var itemToEdit: ChecklistItem?
    weak var delegate: ItemDetailViewControllerDelegate?
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        addTextField.becomeFirstResponder()
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        if let item = itemToEdit {
            title = "Edit Item"
            addTextField.text = item.text
            doneBarButton.isEnabled = true
        }
    }

    

    
    @IBAction func cancel(){
        navigationController?.popViewController(animated: true)
        delegate?.itemDetailViewControllerDidCancel(self)
    }

    
    
    @IBAction func done(){
        if let itemToEdit = itemToEdit {
            itemToEdit.text = addTextField.text!
            delegate?.itemDetailViewController(self, didFinishEditing: itemToEdit)
        } else {
            let item = ChecklistItem()
            item.text = addTextField.text!
            item.checked = false
            delegate?.itemDetailViewController(self, didFinishAdding: item)
  
    }
    }
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return false
//
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text!
        let stringRange = Range(range, in: oldText)
        let newText = oldText.replacingCharacters(in: stringRange!, with: string)
        if newText.isEmpty {
            doneBarButton.isEnabled = false
        } else {
            doneBarButton.isEnabled = true
        }
        return true
    }
    
    
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}

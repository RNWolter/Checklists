//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Brian on 8/17/17.
//  Copyright © 2017 Razeware. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject {

  var text = ""
  var checked = false
  
  func toggleChecked() {
    checked = !checked
  }
  
  
}

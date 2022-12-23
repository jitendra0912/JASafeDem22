//
//  ModuleLogViewModel.swift
//  JASafeDemoV
//
//  Created by Varun Shukla on 07/12/22.
//


import Foundation
import UIKit

class ModuleLogViewModel {
    
    var moduleName: String?
    var moduleLogo: String?
   
    init(moduleModel: ModuleList) {
        
        self.moduleName = moduleModel.moduleName
        self.moduleLogo = moduleModel.logo
       
    }

}






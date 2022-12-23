//
//  SideMenuModel.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 23/08/22.
//

import UIKit

struct SideMenuModel {
    var icon: String
    var title: String
    var storyboard: String
    var controller: String
    
    init(icon: String, title: String, storyboard: String, controller: String) {
        self.icon = icon
        self.title = title
        self.storyboard = storyboard
        self.controller = controller
    }

}



struct StaticSideMenuModel: Codable {
    let isSuccess: Bool
    let returnMessage: String
    let errorMessage: String?
    let data: DataClassess
    let next, previous: String?
    let count: Int

    enum CodingKeys: String, CodingKey {
        case isSuccess = "IsSuccess"
        case returnMessage = "ReturnMessage"
        case errorMessage = "ErrorMessage"
        case data = "Data"
        case next, previous, count
    }
}

// MARK: - DataClass
struct DataClassess: Codable {
    let siteID: Int
    let moduleList: [ModuleList]
    let isActive: Bool
    let createdOn: String
    let createdBy: String
    let createdByID: Int
    let modifiedOn: String
    let modifiedBy: String
    let modifiedByID: Int
}

// MARK: - ModuleList
struct ModuleList: Codable {
    let moduleID, moduleName, logo: String
    
    
}

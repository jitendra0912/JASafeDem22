//
//  GraphViewModel.swift
//  JASafeDemoV
//
//  Created by Varun Shukla on 17/11/22.
//

import Foundation
import UIKit

class GraphViewModel {
    
    var graphTimeStamp: String?
    var graphReadings: Double?
   
    init(graphModel: Object) {
        
        self.graphTimeStamp = self.createDateTime(timestamp: String(describing:  graphModel.timestamp!))
        self.graphReadings = Double(graphModel.localizedReadings?.the111 ?? "0")
        print(self.graphReadings)
       
    }
    
   private func createDateTime(timestamp: String) -> String {
        var strDate = "undefined"
       let date = Date(timeIntervalSince1970: Double(timestamp)!)
            let dateFormatter = DateFormatter()
            let timezone = TimeZone.current.abbreviation() ?? "CET"  // get current TimeZone abbreviation or set to CET
            dateFormatter.timeZone = TimeZone(abbreviation: timezone) //Set timezone that you want
            dateFormatter.locale = NSLocale.current
            dateFormatter.dateFormat = "HH:mm" //Specify your format that you want
            strDate = dateFormatter.string(from: date)
            
        return strDate
    }
    

}

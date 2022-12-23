//
//  CabinetViewModel.swift
//  PENNFoodSafety
//
//  Created by Varun Shukla on 16/10/22.
//

import Foundation
import UIKit

class CabinetViewModel {
    var childSensorDescription: String?
    var resultSensorDescription: String?
    var sensorTemperatureValue: String?
    var cabinetDescription: String?
    var notificationImage: UIImage?
    var notifiactionCount:Int?
    var notificationisHide:Bool?
    var separateViewColor:UIColor?
    var sensorTemperatureLabelColor:UIColor?
    var cellAlarmColor:UIColor?
    var unitID: String?
    
    // Dependency Injection (DI)
    init(cabinetsModel: Result) {
        cellAlarmColor =  .white
        self.childSensorDescription =  cabinetsModel.child?.sensors?[0].sensorDescription
        self.unitID = cabinetsModel.unitID
        self.resultSensorDescription =  cabinetsModel.sensors?[0].sensorDescription
        separateViewColor = .lightGray
        sensorTemperatureValue = "No Data"
        sensorTemperatureLabelColor = .gray
        if let tempValue = cabinetsModel.sensors?[0].value?.value, let degreeCelcius = cabinetsModel.sensors?[0].unitOfMeasurement?.umAbbreviated {
            sensorTemperatureValue = "\(String(describing: tempValue)) \(String(describing: degreeCelcius))"
            separateViewColor = .clear
            sensorTemperatureLabelColor = UIColor(red: 0.549, green: 0.776, blue: 0.243, alpha: 1)
        }
        cabinetDescription =  cabinetsModel.resultDescription
        let count = Int(cabinetsModel.unclearedAlarms ?? 0)
        if count > 0 {
            cellAlarmColor = #colorLiteral(red: 0.9903518558, green: 0.9556843638, blue: 0.9606224895, alpha: 1)
            notificationisHide =  false
            separateViewColor =  .red
            notificationImage = UIImage(named: "bell.png")
            notifiactionCount =  count
        }else{
            notificationisHide =  true
        }
    }

}

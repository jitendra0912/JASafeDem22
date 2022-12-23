//
//  GraphDataModel.swift
//  JASafeDemoV
//
//  Created by Varun Shukla on 17/11/22.
//

import Foundation


struct GraphDataModel: Codable {
    let isSuccess: Bool?
    let returnMessage: String?
    let datas: DataClasses?

    enum CodingKeys: String, CodingKey {
        case isSuccess = "IsSuccess"
        case returnMessage = "ReturnMessage"
        case datas = "Data"
    }
}

// MARK: - DataClass
struct DataClasses: Codable {
    let added: Bool?
    let address: Int?
    let child: Childs?
    let controllable: Bool?
    let dashboardDisplay: Bool?
    let dataDescription: String?
    let enabled: Bool?
    let imei: String?
    let model: String?
    let resourceURI: String?
    let sensors: [DataSensors]?
    let standalone, subscribed: Bool?
    let subscribers: [Int]?
    let tags: [String]?
    let timeout: Int?
    let unclearedAlarms: Int?
    let unitID: String?
    let unitOffline: Bool?
    let gateway: DataGateway?
    let unitGraphValues: UnitGraphValues?

    enum CodingKeys: String, CodingKey {
        case added = "added"
        case address = "address"
        case child = "child"
        case subscribers = "subscribers"
        case tags =  "tags"
        case controllable = "controllable"
        case dashboardDisplay = "dashboard_display"
        case dataDescription = "description"
        case enabled = "enabled"
        case imei = "imei"
        case model = "model"
        case resourceURI = "resource_uri"
        case sensors = "sensors"
        case standalone = "standalone"
        case subscribed = "subscribed"
        case timeout = "timeout"
        case unclearedAlarms = "uncleared_alarms"
        case unitID = "unit_id"
        case unitOffline = "unit_offline"
        case gateway = "gateway"
        case unitGraphValues = "unitGraphValues"
    }
}

// MARK: - Child
struct Childs: Codable {
    let unitID: String?
    let address: Int?
    let child: String?
    let controllable: Bool?
    let dashboardDisplay: Bool?
    let childDescription: String?
    let gateway: ChildGateway?
    let imei: String?
    let sensors: [ChildSensors]?
    let model: String?
    let standalone: Bool?
    let subscribed:Bool?
    let unitOffline: Bool?
    let unclearedAlarms: Int?
    let resourceURI: String?
    let added: Bool?
    let timeout: Int?
    let plot: String?
    let tags: [String]?
    let makemodel: String?
    let subscribers: [Int]?
    let enabled: Bool?

    enum CodingKeys: String, CodingKey {
        case unitID = "unit_id"
        case address = "address"
        case tags = "tags"
        case child = "child"
        case controllable = "controllable"
        case dashboardDisplay = "dashboard_display"
        case childDescription = "description"
        case gateway = "gateway"
        case imei = "imei"
        case sensors = "sensors"
        case model = "model"
        case standalone = "standalone"
        case subscribed = "subscribed"
        case unitOffline = "unit_offline"
        case unclearedAlarms = "uncleared_alarms"
        case resourceURI = "resource_uri"
        case added = "added"
        case timeout = "timeout"
        case plot = "plot"
        case makemodel = "makemodel"
        case subscribers = "subscribers"
        case enabled = "enabled"
    }
}

// MARK: - ChildGateway
struct ChildGateway: Codable {
    let city, countryName: String?
    let gatewayID: String?
    let ip: String?
    let premises: Premisess?
    let regionName: String?
    let estimate: Bool?
    let interval: String?
    let resourceURI: String?

    enum CodingKeys: String, CodingKey {
        case city = "city"
        case countryName = "country_name"
        case gatewayID = "gateway_id"
        case ip = "ip"
        case premises = "premises"
        case regionName = "region_name"
        case estimate = "estimate"
        case interval = "interval"
        case resourceURI = "resource_uri"
    }
}

//enum GatewayIDEnum: String, Codable {
//    case the36Ga0T6Ew95Ay2 = "36GA0T6EW95AY2"
//}

// MARK: - Premises
struct Premisess: Codable {
    let id, company: Int?
    let extendedAddress, locality, name: String?
    let postalCode: String?
    let region: Regions?
    let streetAddress, resourceURI, slug: String?

    enum CodingKeys: String, CodingKey {
        case id, company
        case extendedAddress = "extended_Address"
        case locality, name
        case postalCode = "postal_code"
        case region
        case streetAddress = "street_address"
        case resourceURI = "resource_uri"
        case slug
    }
}

// MARK: - Region
struct Regions: Codable {
    let country, name, resourceURI: String?

    enum CodingKeys: String, CodingKey {
        case country, name
        case resourceURI = "resource_uri"
    }
}

// MARK: - ChildSensor
struct ChildSensors: Codable {
    let key: String?
    let sensorDescription: String?
    let enabled: Bool?
    let offset: Int?
    let unitID: String?
    let category: String?
    let resourceURI: String?
    let unitOfMeasurement: UnitOfMeasurement?
    let visible: Bool?
    let id: Int?
    let stalenessPeriod: Int?
    let reportInterval: Int?
    let minTemp: Double?
    let maxTemp: Double?
    let warningDelayMin: Int?
    let warningDelayMax: Int?
    let alarmDelayMin: Int?
    let alarmDelayMax: Int?
    let alarmRecoveryPeriodMin: Int?
    let alarmRecoveryPeriodMax: Int?
    let autoClear: Bool?

    enum CodingKeys: String, CodingKey {
        case key = "key"
        case sensorDescription = "sensor_description"
        case enabled, offset
        case unitID = "unit_id"
        case category
        case resourceURI = "resource_uri"
        case unitOfMeasurement = "unit_of_measurement"
        case visible = "visible"
        case id = "id"
        case stalenessPeriod = "staleness_period"
        case reportInterval = "report_interval"
        case minTemp = "min_temp"
        case maxTemp = "max_temp"
        case warningDelayMin = "warning_delay_min"
        case warningDelayMax = "warning_delay_max"
        case alarmDelayMin = "alarm_delay_min"
        case alarmDelayMax = "alarm_delay_max"
        case alarmRecoveryPeriodMin = "alarm_recovery_period_min"
        case alarmRecoveryPeriodMax = "alarm_recovery_period_max"
        case autoClear = "auto_clear"
    }
}

// MARK: - UnitOfMeasurement
struct UnitOfMeasurements: Codable {
    let umFull, umAbbreviated, umIndex, umVariable: String?
    let key: String?
    let id: Int?

    enum CodingKeys: String, CodingKey {
        case umFull = "um_full"
        case umAbbreviated = "um_abbreviated"
        case umIndex = "um_index"
        case umVariable = "um_variable"
        case key, id
    }
}

// MARK: - DataGateway
struct DataGateway: Codable {
    let city, countryName: String?
    let estimate: Bool?
    let gatewayID: String?
    let ip, regionName: String?
    let premises: Premises?

    enum CodingKeys: String, CodingKey {
        case city
        case countryName = "country_name"
        case estimate
        case gatewayID = "gateway_id"
        case ip
        case regionName = "region_name"
        case premises
    }
}

// MARK: - DataSensor
struct DataSensors: Codable {
    let alarmDelayMax, alarmDelayMin, alarmRecoveryPeriodMax, alarmRecoveryPeriodMin: Int?
    let autoClear, enabled: Bool?
    let id: Int?
    let key, offset: String?
    let reportInterval: Int?
    let resourceURI, sensorDescription: String?
    let stalenessPeriod: Int?
    let unitID: String?
    let unitOfMeasurement: UnitOfMeasurements?
    let visible: Bool?
    let warningDelayMax, warningDelayMin: String?

    enum CodingKeys: String, CodingKey {
        case alarmDelayMax = "alarm_delay_max"
        case alarmDelayMin = "alarm_delay_min"
        case alarmRecoveryPeriodMax = "alarm_recovery_period_max"
        case alarmRecoveryPeriodMin = "alarm_recovery_period_min"
        case autoClear = "auto_clear"
        case enabled, id, key, offset
        case reportInterval = "report_interval"
        case resourceURI = "resource_uri"
        case sensorDescription = "sensor_description"
        case stalenessPeriod = "staleness_period"
        case unitID = "unit_id"
        case unitOfMeasurement = "unit_of_measurement"
        case visible
        case warningDelayMax = "warning_delay_max"
        case warningDelayMin = "warning_delay_min"
    }
}

// MARK: - UnitGraphValues
struct UnitGraphValues: Codable {
    let objects: [Object]?
    let count: Int?
    
    enum CodingKeys: String, CodingKey {
        case objects = "objects"
        case count = "count"
    }
}

// MARK: - Object
struct Object: Codable {
    let readings: Readings?
    let unit: String?
    let offset: Double?
    let gateway: String?
    let id: String?
    let gain: Int?
    let datetime: String?
    let timestamp: Int?
    let localizedReadings: LocalizedReadings?

    enum CodingKeys: String, CodingKey {
        case readings, unit, gateway, id, gain, datetime, timestamp
        case offset = "offset"
        case localizedReadings = "localized_readings"
    }
}



// MARK: - LocalizedReadings
struct LocalizedReadings: Codable {
    let the111: String?

    enum CodingKeys: String, CodingKey {
        case the111 = "0"
    }
}

// MARK: - Readings
struct Readings: Codable {
    let the111: Double?

    enum CodingKeys: String, CodingKey {
        case the111 = "the111"
    }
}

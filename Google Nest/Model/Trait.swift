//
//  Trait.swift
//  Google Nest
//
//  Created by Muhammad Mudassar Yasin on 06/09/2022.
//

import Foundation

struct Trait : Codable {

    let sdmdevicestraitsConnectivity : SdmDevicesTraitsConnectivity?
    let sdmdevicestraitsFan : SdmDevicesTraitsFan?
    let sdmdevicestraitsHumidity : SdmDevicesTraitsHumidity?
    let sdmdevicestraitsInfo : SdmDevicesTraitsInfo?
    let sdmdevicestraitsSettings : SdmDevicesTraitsSetting?
    let sdmdevicestraitsTemperature : SdmDevicesTraitsTemperature?
    let sdmdevicestraitsThermostatEco : SdmDevicesTraitsThermostatEco?
    let sdmdevicestraitsThermostatHvac : SdmDevicesTraitsConnectivity?
    let sdmdevicestraitsThermostatMode : SdmDevicesTraitsThermostatMode?
    let sdmdevicestraitsThermostatTemperatureSetpoint : SdmDevicesTraitsFan?


    enum CodingKeys: String, CodingKey {
        case sdmdevicestraitsConnectivity = "sdm.devices.traits.Connectivity"
        case sdmdevicestraitsFan = "sdm.devices.traits.Fan"
        case sdmdevicestraitsHumidity = "sdm.devices.traits.Humidity"
        case sdmdevicestraitsInfo = "sdm.devices.traits.Info"
        case sdmdevicestraitsSettings = "sdm.devices.traits.Settings"
        case sdmdevicestraitsTemperature = "sdm.devices.traits.Temperature"
        case sdmdevicestraitsThermostatEco = "sdm.devices.traits.ThermostatEco"
        case sdmdevicestraitsThermostatHvac = "sdm.devices.traits.ThermostatHvac"
        case sdmdevicestraitsThermostatMode = "sdm.devices.traits.ThermostatMode"
        case sdmdevicestraitsThermostatTemperatureSetpoint = "sdm.devices.traits.ThermostatTemperatureSetpoint"
    }
    
    init() {
        sdmdevicestraitsFan = SdmDevicesTraitsFan()
        sdmdevicestraitsConnectivity = SdmDevicesTraitsConnectivity()
        sdmdevicestraitsHumidity = SdmDevicesTraitsHumidity()
        sdmdevicestraitsInfo = SdmDevicesTraitsInfo()
        sdmdevicestraitsSettings = SdmDevicesTraitsSetting()
        sdmdevicestraitsTemperature = SdmDevicesTraitsTemperature()
        sdmdevicestraitsThermostatEco = SdmDevicesTraitsThermostatEco()
        sdmdevicestraitsThermostatHvac = SdmDevicesTraitsConnectivity()
        sdmdevicestraitsThermostatMode = SdmDevicesTraitsThermostatMode()
        sdmdevicestraitsThermostatTemperatureSetpoint = SdmDevicesTraitsFan()
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        sdmdevicestraitsConnectivity = try values.decodeIfPresent(SdmDevicesTraitsConnectivity.self, forKey: .sdmdevicestraitsConnectivity)
        sdmdevicestraitsFan = try values.decodeIfPresent(SdmDevicesTraitsFan.self, forKey: .sdmdevicestraitsFan)
        sdmdevicestraitsHumidity = try values.decodeIfPresent(SdmDevicesTraitsHumidity.self, forKey: .sdmdevicestraitsHumidity)
        sdmdevicestraitsInfo = try values.decodeIfPresent(SdmDevicesTraitsInfo.self, forKey: .sdmdevicestraitsInfo)
        sdmdevicestraitsSettings = try values.decodeIfPresent(SdmDevicesTraitsSetting.self, forKey: .sdmdevicestraitsSettings)
        sdmdevicestraitsTemperature = try values.decodeIfPresent(SdmDevicesTraitsTemperature.self, forKey: .sdmdevicestraitsTemperature)
        sdmdevicestraitsThermostatEco = try values.decodeIfPresent(SdmDevicesTraitsThermostatEco.self, forKey: .sdmdevicestraitsThermostatEco)
        sdmdevicestraitsThermostatHvac = try values.decodeIfPresent(SdmDevicesTraitsConnectivity.self, forKey: .sdmdevicestraitsConnectivity)
        sdmdevicestraitsThermostatMode = try values.decodeIfPresent(SdmDevicesTraitsThermostatMode.self, forKey: .sdmdevicestraitsThermostatMode)
        sdmdevicestraitsThermostatTemperatureSetpoint = try values.decodeIfPresent(SdmDevicesTraitsFan.self, forKey: .sdmdevicestraitsFan)
    }


}

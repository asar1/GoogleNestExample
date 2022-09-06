//
//  DeviceViewModel.swift
//  Google Nest
//
//  Created by Muhammad Asar on 2/27/22.
//

import Foundation

class DeviceViewModel: ObservableObject {
    
    private var service = DeviceService()
    
    @Published var nest: GoogleNest?
    
    var totalDevices: Int {
        nest?.devices?.count ?? 0
    }
    
    init() {}
    
    func device(at index: Int) -> Device {
        nest?.devices?[index] ?? Device()
    }
    
    func getDevices() {
        self.nest = nil
        service.getDevices { devices in
            self.nest = devices
        }
    }
    
    
    
}

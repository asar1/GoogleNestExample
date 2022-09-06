//
//  DeviceDetailView.swift
//  Google Nest
//
//  Created by Muhammad Asar on 3/13/22.
//

import SwiftUI

struct DeviceDetailView: View {
    
    let device: Device
    var body: some View {
        VStack {
            HStack {
                VStack {
                    HStack {
                        Text("Status: ")
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .padding([.all], 6)
                        Spacer()
                    }
                    let status = device.traits?.sdmdevicestraitsConnectivity?.status ?? ""
                    Text(status)
                        .font(.headline)
                        .foregroundColor(status == "online" ? .red : .green)
                }
                Spacer()
                    .frame(width: UIScreen.main.bounds.width/4)
                VStack {
                    HStack {
                        Text("Mode: ")
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .padding([.all], 6)
                        Spacer()
                    }
                    let status = device.traits?.sdmdevicestraitsThermostatMode?.mode ?? ""
                    Text(status)
                        .font(.headline)
                        .foregroundColor(.teal)
                }
            }
            
            SubParametersView(device: device.traits ?? Trait())
            
            Spacer()
        }
        .navigationBarTitle(Text(device.parentRelations?.first?.displayName ?? ""), displayMode: .inline)
    }
}

struct SubParametersView: View {
    
    let device: Trait
    
    var body: some View {
        VStack {
            let heat = String(format: "%.1f", device.sdmdevicestraitsThermostatEco?.heatCelsius ?? 0.0)
            let cool = String(format: "%.1f",  device.sdmdevicestraitsThermostatEco?.coolCelsius ?? 0.0)
            HorizontalStack(label: "Thermostat Eco Mode", result: device.sdmdevicestraitsThermostatEco?.mode ?? "")
            HorizontalStack(label: "Thermostat Hvac", result: device.sdmdevicestraitsThermostatHvac?.status ?? "")
            HorizontalStack(label: "Heat - Cool Celsius", result: "\(heat)° - \(cool)°")
            HorizontalStack(label: "Thermostat Setting", result: device.sdmdevicestraitsSettings?.temperatureScale ?? "")
            HorizontalStack(label: "Ambient Temperature", result: String(format: "%.2f", device.sdmdevicestraitsTemperature?.ambientTemperatureCelsius ?? 0.0) + "°")
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width - 30)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(8)
    }
    
}

struct HorizontalStack: View {
    
    let label: String
    let result: String
    
    var body: some View {
        HStack {
            CustomLabel(text: label)
            Spacer()
            Text(result)
                .font(.footnote)
        }
        .padding([.bottom], 4)
    }
}

struct CustomLabel: View {
    
    let text: String
    
    var body: some View {
        Text(text)
            .font(.system(size: 12))
            .foregroundColor(.gray)
    }
}

struct DeviceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceDetailView(device: Device())
    }
}

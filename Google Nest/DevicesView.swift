//
//  DevicesView.swift
//  Google Nest
//
//  Created by Muhammad Asar on 2/27/22.
//

import SwiftUI

struct DevicesView: View {
    
    @ObservedObject var vm = DeviceViewModel()
    
    var body: some View {
        
        ZStack {
            NavigationView {
                List(vm.nest?.devices ?? [], id: \.name) { device in
                    NavigationLink {
                        DeviceDetailView(device: device)
                    } label: {
                        HStack {
                            VStack {
                                let status = device.traits?.sdmdevicestraitsConnectivity?.status
                                switch status?.lowercased() {
                                case "online":
                                    Circle()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.green)
                                case "offline":
                                    Circle()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.red)
                                case .none:
                                    EmptyView()
                                case .some(_):
                                    EmptyView()
                                }
                            }
                            Text(device.parentRelations?.first?.displayName ?? "Not Available")
                                .font(.headline)
                                .padding()
                        }
                    }
                    .listRowSeparator(.hidden)
                    .listItemTint(Color.blue)
                    .listRowBackground(Color.gray.opacity(0.1)
                                        .clipped()
                                        .cornerRadius(20)
                                        .padding([.top, .bottom], 6))
                }
                //            .listStyle(GroupedListStyle())
                .onAppear {
                    vm.getDevices()
                }
                .navigationBarTitle(Text("Devices"))
                .navigationBarItems(leading: Button(action: {
                    
                }, label: {
                    ZStack {
                        Image(systemName: "person.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 22, height: 22)
                            .foregroundColor(.green)
                    }
                    .frame(width: 30, height: 30)
                }), trailing: Button(action: {
                    vm.getDevices()
                }, label: {
                    ZStack {
                        Image(systemName: "arrow.counterclockwise")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 22, height: 22)
                            .foregroundColor(.blue)
                    }
                    .frame(width: 30, height: 30)
                }))
            }
            
            if vm.totalDevices == 0 {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
        }
    }
}

struct cellView: View {
    
    let device: Device
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 30, height: 60)
                .foregroundColor(.green)
            VStack {
                let status = device.traits?.sdmdevicestraitsConnectivity?.status
                switch status?.lowercased() {
                case "online":
                    Image(systemName: "arrow.up")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.green)
                case "offline":
                    Image(systemName: "arrow.down")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.red)
                case .none:
                    EmptyView()
                case .some(_):
                    EmptyView()
                }
            }.frame(width: 50, height: 50)
            Text("Not Available")
                .font(.headline)
                .padding()
        }
        .background(Color.gray.opacity(0.15))
        .clipShape(Capsule())
        .padding([.all], 4)
    }
}

struct DevicesView_Previews: PreviewProvider {
    static var previews: some View {
        DevicesView()
        cellView(device: Device())
            .previewLayout(.sizeThatFits)
    }
}

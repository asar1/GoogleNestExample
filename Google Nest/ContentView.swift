//
//  ContentView.swift
//  Google Nest
//
//  Created by Muhammad Asar on 2/27/22.
//

import SwiftUI
import GoogleSignIn

let signInConfig = GIDConfiguration(clientID: "196102721302-955712ar7jrp30is6f9106sqe8ehrbo7.apps.googleusercontent.com")
let projectID = "2cbd3ac3-f320-4d05-878e-5a7842ab61af"

var googleUser = GIDGoogleUser()

struct ContentView: View {
    
    @State var push = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                Text("Google Nest")
                    .font(.largeTitle)
                    .padding()
                
                Text("for")
                    .font(.footnote)
                    .padding([.leading, .trailing, .bottom])
                
                Text("Device State")
                    .font(.headline)
                    .foregroundColor(.green)
                
                Spacer()
                    .frame(height: 200)
                
                NavigationLink(isActive: $push) {
                    DevicesView()
                        .navigationBarHidden(true)
                } label: {
                    Button {
                        let scenes = UIApplication.shared.connectedScenes
                        guard let windowScene = scenes.first as? UIWindowScene, let window = windowScene.windows.first, let rootVC = window.rootViewController else { return }
                        
                        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: rootVC) { user, error in
                            guard error == nil else { return }
                            
                            if let gUser = user {
                                googleUser = gUser
                                self.push = true
                            }
                        }
                    } label: {
                        HStack {
                            Image(systemName: "g.circle")
                                .resizable()
                                .frame(width: 25, height: 25)
                            Text("Sign in")
                                .padding([.leading], 0)
                                .font(.headline)
                        }
                        .clipShape(Rectangle())
                    }
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
var tuple = ("sohaib", 10, 10, "Ali")

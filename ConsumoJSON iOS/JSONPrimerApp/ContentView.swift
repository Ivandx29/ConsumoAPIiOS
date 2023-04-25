//
//  ContentView.swift
//  JSONPrimerApp
//
//  Created by Ivan Cruz on 24/04/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var login : PostViewModel
    
    var body: some View {
        Group{
            if login.authenticated == 0 {
                Login()
            } else if login.authenticated == 1{
                Home()
            } else if login.authenticated == 2{
                VStack{
                    Text("Usuario y/o Contraseña incorrectos")
                    Button(action: {
                        login.authenticated = 0
                    }){
                        Text("Regresar")
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

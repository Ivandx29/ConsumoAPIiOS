//
//  JSONPrimerAppApp.swift
//  JSONPrimerApp
//
//  Created by Ivan Cruz on 24/04/23.
//

import SwiftUI

@main
struct JSONPrimerAppApp: App {
    var body: some Scene {
        let login  = PostViewModel()
        WindowGroup {
            ContentView().environmentObject(login)
        }
    }
}

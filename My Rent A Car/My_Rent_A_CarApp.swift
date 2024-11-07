//
//  My_Rent_A_CarApp.swift
//  My Rent A Car
//
//  Created by Dev Reptech on 20/03/2024.
//

import SwiftUI

@main
struct My_Rent_A_CarApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

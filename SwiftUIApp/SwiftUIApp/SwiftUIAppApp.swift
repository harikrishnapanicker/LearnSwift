//
//  SwiftUIAppApp.swift
//  SwiftUIApp
//
//  Created by HariPanicker on 29/01/22.
//

import SwiftUI

@main
struct SwiftUIAppApp: App {
    @StateObject var order = Order()

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(Order)
        }
    }
}

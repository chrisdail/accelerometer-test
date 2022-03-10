//
//  AccelTestApp.swift
//  AccelTest
//
//  Created by Chris on 2021-01-11.
//

import SwiftUI

@main
struct AccelTestApp: App {
    var model = AccelModel()

    var body: some Scene {
        WindowGroup {
            ContentView(model: model)
        }
    }
    
    init() {
        model.start()
    }
}

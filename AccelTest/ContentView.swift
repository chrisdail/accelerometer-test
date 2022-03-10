//
//  ContentView.swift
//  AccelTest
//
//  Created by Chris on 2021-01-11.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model: AccelModel
    var body: some View {
        VStack(alignment: .leading) {
            Text("VitalRecorder").font(.title)
            HStack {
                Text("Max G (y-axis)")
                Spacer()
                Text(String(format: "%0.1f", model.maxG))
            }
            HStack {
                Text("Frequency")
                Spacer()
                Text("\(model.frequency)")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: AccelModel())
    }
}

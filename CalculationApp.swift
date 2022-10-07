//
//  CalculationApp.swift
//  Calculation
//
//  Created by Colin Dively on 9/19/22.
//

import SwiftUI

@main
struct CalculationApp: App {
	@State var expressionModel = ExpressionModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
				.environmentObject(expressionModel)
        }
    }
}

//
//  ContentView.swift
//  Calculation
//
//  Created by Colin Dively on 9/19/22.
//

import SwiftUI

struct ContentView: View {
	@EnvironmentObject var expressionModel: ExpressionModel
    var body: some View {
        VStack {
            NumberGridView()
				.environmentObject(expressionModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

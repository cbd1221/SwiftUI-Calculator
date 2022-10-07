//
//  NumberGridView.swift
//  Calculation
//
//  Created by Colin Dively on 9/19/22.
//

import SwiftUI

struct NumberGridView: View {
	@EnvironmentObject var em: ExpressionModel
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    let numbers = ["0","1", "2", "3", "4", "5", "6", "7", "8", "9"]
    let operators = ["x", "+", "-", "/", "%", "="]
    var body: some View {
        VStack {
			HStack {
				Spacer()
				Text(em.lhString)
				Text(String(em.operand.rawValue))
				Text(em.rhString)
			}
			.font(.headline)
            HStack {
                Text("Results:")
                Spacer()
				Text(em.result)
            }
			.font(.headline)
            .padding()
            HStack {
				Text("Expression: ")
                Spacer()
                ExpressionView()
            }
            .padding()
            LazyVGrid(columns: columns, spacing: 40) {
                ForEach(numbers, id: \.self) { num in
                    Button("\(num)") {
						em.addCharacter(char: num)
                    }
                }
                ForEach(operators, id: \.self) { operand in
                    Button(operand) {
						em.addOperator(char: operand)
                    }
                }
            }.buttonStyle(.bordered)
            Button("Clear") {
				em.clear()
            }.buttonStyle(.borderedProminent)
        }
    }
}
struct NumberGridView_Previews: PreviewProvider {
    static var previews: some View {
        NumberGridView()
    }
}



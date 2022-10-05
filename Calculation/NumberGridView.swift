//
//  NumberGridView.swift
//  Calculation
//
//  Created by Colin Dively on 9/19/22.
//

import SwiftUI

struct NumberGridView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    let numbers = ["0","1", "2", "3", "4", "5", "6", "7", "8", "9"]
    let operators = ["x", "+", "-", "/", "%", "="]
    @State var expression = ""
    @State var results = ""
    @State var hasOperator = false
        
    var body: some View {
        VStack {
            HStack {
                Text("Results:")
                Spacer()
                ExpressionView(content: results)
            }
            .padding()
            HStack {
                Text("Expression: ")
                Spacer()
                ExpressionView(content: expression)
            }
            .padding()
            LazyVGrid(columns: columns, spacing: 40) {
                ForEach(numbers, id: \.self) { num in
                    Button("\(num)") {
                        buttonPressed(buttonText: num)
                    }
                }
                ForEach(operators, id: \.self) { buttonText in
                    Button(buttonText) {
                        buttonPressed(buttonText: buttonText)
                    }
                }
            }.buttonStyle(.bordered)
            Button("Clear") {
                clear()
            }.buttonStyle(.borderedProminent)
        }
    }
    
    func buttonPressed(buttonText: String) {
        switch buttonText {
        case "=":
            if let result = calculate() {
                expression = ""
                results = result
            }
        case "%":
            if expression.isEmpty {
                return
            }
            let percent = NSExpression(format: expression)
            var literal = percent.expressionValue(with: nil, context: nil) as! Double
            literal *= 0.01
            expression = String(format: "%.2f", literal)
        case "x", "/", "+", "-":
            addOperation(buttonText)
        case "Clear":
            clear()
        default:
            expression += buttonText
        }
    }
//MARK: Struct Functions
    
    func addOperation(_ operand: String) {
        if !expression.isEmpty {
            let last = String(expression.last!)
            if (operators.contains(last) || last == "-") {
                expression.removeLast()
            }
            expression += operand
            hasOperator = true
        }
    }
    
    func calculate() -> String? {
        if hasOperator {
            var calculation = expression.replacingOccurrences(of: "%", with: " * 0.01")
            calculation = expression.replacingOccurrences(of: "x", with: "*")
            let workingCalculation = NSExpression(format: calculation)
           //if the numbers are too large, this will throw a fatal error: "unable to bridge number to Double"
			let results = workingCalculation.expressionValue(with: nil, context: nil) as! Double
            let finalResults = formatExpression(results)
            hasOperator = false
            return String(finalResults)
        }
        return nil
    }
    
    func formatExpression(_ value: Double) -> String {
        if (value.truncatingRemainder(dividingBy: 1) == 0) {
            return String(format: "%0.f", value)
        }
        return String(format: "%.2f", value)
    }
    
    func clear() {
        expression = ""
        results = ""
    }
	
}
    
struct NumberGridView_Previews: PreviewProvider {
    static var previews: some View {
        NumberGridView(expression: "", results: "")
    }
}



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
    
    func clear() {
        expression = ""
        results = ""
    }
    
    var body: some View {
        VStack {
            ExpressionView(content: results)
            ExpressionView(content: expression)
            LazyVGrid(columns: columns, spacing: 40) {
                ForEach(numbers, id: \.self) { num in
                    Button("\(num)") {
                        buttonPressed(cell: num)
                    }
                }
                ForEach(operators, id: \.self) { cell in
                    Button(cell) {
                        buttonPressed(cell: cell)
                    }
                }
            }.buttonStyle(.bordered)
            Button("Clear") {
                clear()
            }.buttonStyle(.borderedProminent)
        }
    }
    
    func buttonPressed(cell: String) {
        switch cell {
        case "=":
            if let result = calculate() {
                expression = ""
                results = result
            }
        case "%":
            let percent = NSExpression(format: expression)
            var literal = percent.expressionValue(with: nil, context: nil) as! Double
            literal *= 0.01
            expression = String(literal)
            
        case "x", "/", "+", "-":
            addOperation(cell)
        case "Clear":
            clear()
        default:
            expression += cell
        }
    }
    
    
    func addOperation(_ cell: String) {
        if !expression.isEmpty {
            let last = String(expression.last!)
            if (operators.contains(last) || last == "-") {
                expression.removeLast()
            }
            expression += cell
            hasOperator = true
        }
    }
    
    func calculate() -> String? {
        if hasOperator {
            var calculation = expression.replacingOccurrences(of: "%", with: " * 0.01")
            calculation = expression.replacingOccurrences(of: "x", with: "*")
            let workingCalculation = NSExpression(format: calculation)
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
    
}

struct NumberGridView_Previews: PreviewProvider {
    static var previews: some View {
        NumberGridView(expression: "", results: "")
    }
}



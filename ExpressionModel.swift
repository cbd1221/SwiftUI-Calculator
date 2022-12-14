//
//  ExpressionModel.swift
//  Calculation
//
//  Created by Colin Dively on 10/6/22.
//

import Foundation

class ExpressionModel: ObservableObject {
	@Published var userinput: String = ""
	@Published var lhs: Double?
	@Published var lhString: String = ""
	@Published var rhs: Double?
	@Published var operand: Operand = .none
	@Published var hasOperand: Bool = false
	@Published var result: String = ""
	@Published var rhString: String = ""
	@Published var clearWasTapped: Bool = false

	enum Operand: Character, RawRepresentable {
		case mult = "*"
		case div = "/"
		case per = "%"
		case plus = "+"
		case min = "-"
		case equals = "="
		case none = " "
	}
	
	public func addCharacter(char: String) {
		switch char {
		case ".":
			if hasOperand {
				userinput = "0."
				rhString += "0."
				hasOperand = false
			}
			if userinput.isEmpty {
				userinput = "0."
			}
			userinput += "."
		case "0":
			if hasOperand {
				userinput = ""
				rhString += "0"
				hasOperand = false
			}
			self.userinput += "0"
		case "1":
			if hasOperand {
				userinput = ""
				rhString += "1"
				hasOperand = false
			}
			self.userinput += "1"
		case "2":
			if hasOperand {
				userinput = ""
				rhString += "2"
				hasOperand = false
			}
			self.userinput += "2"
		case "3":
			if hasOperand {
				userinput = ""
				rhString += "3"
				hasOperand = false
			}
			self.userinput += "3"
		case "4":
			if hasOperand {
				userinput = ""
				rhString += "4"
				hasOperand = false
			}
			self.userinput += "4"
		case "5":
			if hasOperand {
				userinput = ""
				rhString += "5"
				hasOperand = false
			}
			self.userinput += "5"
		case "6":
			if hasOperand {
				userinput = ""
				rhString += "6"
				hasOperand = false
			}
			self.userinput += "6"
		case "7":
			if hasOperand {
				userinput = ""
				rhString += "7"
				hasOperand = false
			}
			self.userinput += "7"
		case "8":
			if hasOperand {
				userinput = ""
				rhString += "8"
				hasOperand = false
			}
			self.userinput += "8"
		case "9":
			if hasOperand {
				userinput = ""
				rhString += "9"
				hasOperand = false
			}
			self.userinput += "9"
		default:
			return
		}
	}

	func clearTapped() {
		if clearWasTapped {
			allClear()
			clearWasTapped = false
			return
		}
		userinput = ""
		clearWasTapped = true
	}
	
	func allClear() {
		userinput = ""
		lhs = nil
		lhString = ""
		rhs = nil
		operand = .none
		hasOperand = false
		result = ""
		rhString = ""
		clearWasTapped = false
	}

	
	func addOperator(char: String) {
		switch char {
		case "x":
			if hasOperand {
				operand = .mult
				userinput = "X"
			}
			operand = .mult
			lhs = Double(userinput)
			lhString = userinput
			userinput = "X"
			hasOperand = true
		case "/":
			if hasOperand {
				operand = .div
				userinput = "/"
			}
			operand = .div
			lhs = Double(userinput)
			lhString = userinput
			userinput = "/"
			hasOperand = true
		case "%":
			if hasOperand {
				operand = .per
				userinput = "%"
			}
			operand = .per
			lhs = Double(userinput)
			lhString = userinput
			userinput = "%"
			hasOperand = true
		case "+":
			if hasOperand {
				operand = .plus
				userinput = "+"
			}
			operand = .plus
			lhs = Double(userinput)
			lhString = userinput
			userinput = "+"
			hasOperand = true
		case "-":
			if hasOperand {
				operand = .min
				userinput = "-"
			}
			operand = .min
			lhs = Double(userinput)
			lhString = userinput
			userinput = "-"
			hasOperand = true
		case "=":
			if lhString.isEmpty { operand = .none; return }
			if userinput.isEmpty { operand = .none; return  }
			rhs = Double(userinput)
			let numResult = calculate(operand)
			if let numResult = numResult {
				result = String(numResult)
			}
			operand = .none
			userinput = ""
			lhString = ""
			lhs = nil
			rhs = nil
			rhString = ""
			hasOperand = false
		default:
			return
		}
		clearWasTapped = false
	}
	
	func calculate(_ operand: Operand) -> Double? {
		guard let lhs = lhs else { return nil }
		guard let rhs = rhs else { return nil }
		switch operand {
		case .mult:
			return lhs * rhs
		case .div:
			return lhs / rhs
		case .per:
			return lhs * 0.01
		case .plus:
			return lhs + rhs
		case .min:
			return lhs - rhs
		default:
			return nil
		}
	}
	
	
	
}

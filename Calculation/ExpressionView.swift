//
//  ExpressionView.swift
//  Calculation
//
//  Created by Colin Dively on 9/21/22.
//

import SwiftUI

struct ExpressionView: View {
	@EnvironmentObject var expressionModel: ExpressionModel
    var body: some View {
		Text(expressionModel.userinput)
            .font(.title2)
            .multilineTextAlignment(.trailing)
            .lineLimit(3)
            .minimumScaleFactor(0.2)
		
    }
}

struct ExpressionView_Previews: PreviewProvider {
    static var previews: some View {
        ExpressionView()
    }
}

//
//  ExpressionView.swift
//  Calculation
//
//  Created by Colin Dively on 9/21/22.
//

import SwiftUI

struct ExpressionView: View {
    var content: String
    var body: some View {
        Text(content)
            .font(.title2)
            .multilineTextAlignment(.trailing)
            .lineLimit(1)
            .minimumScaleFactor(0.2)
    }
}

struct ExpressionView_Previews: PreviewProvider {
    static var previews: some View {
        ExpressionView(content: "E = MC 2")
    }
}

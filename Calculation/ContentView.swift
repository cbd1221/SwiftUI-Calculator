//
//  ContentView.swift
//  Calculation
//
//  Created by Colin Dively on 9/19/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var expression = ""
    var body: some View {
        VStack {
            ExpressionView(content: expression)
            NumberGridView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

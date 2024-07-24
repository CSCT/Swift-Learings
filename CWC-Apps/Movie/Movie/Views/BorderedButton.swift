//
//  BorderedButton.swift
//  Movie
//
//  Created by Graceson Thompson on 1/17/24.
//

import SwiftUI

struct BorderedButton: View {
    var action : () -> Void
    var title : String
    
    var body: some View {
        Button(action: action,label: {Text(title)})
            .padding(10)
            .border(Color.blue)
            
            
    }
}

func print1(){
    print("hey")
}

#Preview {
    BorderedButton(action: print1, title: "Print hey")
}

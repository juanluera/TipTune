//
//  InputTextField.swift
//  TipTune
//
//  Created by Juan Angel Luera on 6/28/24.
//

import SwiftUI
import UIKit

struct InputTextField: View {
    var placeholderText: String
    var width: CGFloat
    @Binding var input: String
    var img: Image?
    var dautocorrection: Bool // disable autocorrention bool
    var capitalizationType: UITextAutocapitalizationType = .none
    var body: some View {
        RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)).frame(width: 300,height:50).foregroundColor(.gray).opacity(0.25)
            .overlay(
                HStack{
                    if (img != nil){
                        img.padding(.leading)
                    }
                    TextField(placeholderText, text: $input).disableAutocorrection(dautocorrection)
                        .autocapitalization(capitalizationType)
                })
    }
}


struct InputTextField_Previews: PreviewProvider {
    static var previews: some View {
        InputTextField(placeholderText: "placeholder", width: 300, input: .constant("Some Input"), img: Image(systemName: "person.fill"),
            dautocorrection: true)
    }
}

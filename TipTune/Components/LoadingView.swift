//
//  LoadingView.swift
//  TipTune
//
//  Created by Juan Angel Luera on 9/8/24.
//

import SwiftUI

struct LoadingView: View {
    var text: String?
    var scale: Double
    var tint: Color
    @State var scaleEffect: CGSize = CGSize(width: 1, height: 1)
    var body: some View {
        VStack{
            if(text != nil) {
                ProgressView(text!).scaleEffect(scaleEffect).progressViewStyle(CircularProgressViewStyle(tint: tint))
            }
            else{
                ProgressView().scaleEffect(scaleEffect).progressViewStyle(CircularProgressViewStyle(tint: tint))
            }
        }.onAppear{
            scaleEffect = CGSize(width: scale, height: scale)
        }
    }
}



#Preview {
    LoadingView(text: "Loading", scale: 1, tint: .black)
}

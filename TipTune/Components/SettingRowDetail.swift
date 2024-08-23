//
//  SettingRowDetail.swift
//  TipTune
//
//  Created by Juan Angel Luera on 7/26/24.
//

import SwiftUI

struct SettingRowDetail: View {
    var imageName: String
    var title: String
    var color: Color
    var body: some View {
        HStack{
            Image(systemName: imageName)
                .resizable()
                .foregroundColor(color)
            
            Text(title)

        }
    }
}

#Preview {
    SettingRowDetail(imageName: "figure.archery", title: "sample", color: .red)
}

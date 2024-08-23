//
//  BalanceDetail.swift
//  TipTune
//
//  Created by Juan Angel Luera on 7/20/24.
//

import SwiftUI

struct BalanceDetail: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        if let user = viewModel.currentUser {
            VStack(alignment: .leading, spacing: 4) {
                Text("Balance")
                
                Text("\(user.balance)")
                    .font(.title)
                    .fontWeight(.semibold)
                
                HStack {
                    
                    Button {
                        print("check")
                    } label: {
                        Text("Cash Out")
                    }
                    Spacer()
                    Button {
                        print("check")
                    } label: {
                        Text("Add Funds")
                    }
                    
                }
            }
        }
    }
}

#Preview {
    BalanceDetail().environmentObject(AuthViewModel())
}

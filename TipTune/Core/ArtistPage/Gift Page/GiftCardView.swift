//
//  GiftCardView.swift
//  TipTune
//
//  Created by Juan Antonio Luera on 10/8/24.
//

import SwiftUI


struct GiftCardView: View {
    let gift: GiftItem
    let onPurchase: () -> Void
    
    var body: some View {
        VStack{
            Image(systemName: gift.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .padding()
            
            Text(gift.name)
                .font(.headline)
            
            Text(gift.description)
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 5)
            
            Text("$\(gift.bits, specifier: "%.2f")")
                .font(.subheadline)
                .fontWeight(.bold)
            
            Button("Gift"){
                onPurchase()
            }
            .padding(.vertical, 5)
            .padding(.horizontal, 10)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .frame(width: 120, height: 200)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}
struct GiftItem: Identifiable{
    let id = UUID()
    let name: String
    let description: String
    let bits: Double
    let imageName: String
    
}


//#Preview {
//    let gift = GiftItem(name: "Virtual Flower", description: "Send a beautiful virtual flower", bits: 50.00, imageName: "leaf.fill")
//    
//    
//    GiftCardView(gift: gift, onPurchase: {
//        print("Item has been purchased")
//    })
//}

struct GiftCardView_Previews: PreviewProvider {
    static var previews: some View {
        let gift = GiftItem(name: "Virtual Flower", description: "Send a beautiful virtual flower", bits: 50.00, imageName: "leaf.fill")
        
        GiftCardView(gift: gift, onPurchase: {
            print("Item has been purchased")
        })
    }
}

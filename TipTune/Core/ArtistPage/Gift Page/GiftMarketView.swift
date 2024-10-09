//
//  GiftMarketView.swift
//  TipTune
//
//  Created by Juan Antonio Luera on 10/8/24.
//

import SwiftUI



struct GiftMarketView: View {
    let columns = [
        GridItem(.adaptive(minimum: 120),spacing:20)
    ]
    let gifts: [GiftItem]
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns, spacing: 20){
                ForEach(gifts){ gift in
                    GiftCardView(gift: gift, onPurchase: { print("tapped gift")} )
                }
            }
            .padding()
        }
        .navigationTitle("Market")
    }
}

struct GiftMarketView_Previews: PreviewProvider {
    static var previews: some View {
        
        let gifts = [
            GiftItem(name: "Virtual Flower", description: "Send a beautiful virtual flower", bits: 0.99, imageName: "leaf.fill"),
            GiftItem(name: "Virtual Tomato", description: "Throw a virtual tomato", bits: 0.49, imageName: "flame.fill"),
            GiftItem(name: "Band T-Shirt", description: "Official band merchandise", bits: 19.99, imageName: "tshirt.fill"),
            GiftItem(name: "Virtual Applause", description: "Show your appreciation", bits: 1.99, imageName: "hands.clap.fill"),
            // Add more items as needed
        ]
        
        GiftMarketView(gifts: gifts)
    }
}

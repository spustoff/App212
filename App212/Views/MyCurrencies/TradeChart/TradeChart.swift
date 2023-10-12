//
//  TradeChart.swift
//  App212
//
//  Created by IGOR on 09/10/2023.
//

import SwiftUI

struct TradeChart: View {
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.blue)
                                .font(.system(size: 15, weight: .regular))
                            
                            Text("Back")
                                .foregroundColor(.blue)
                                .font(.system(size: 16, weight: .regular))
                        })
                        
                        Spacer()
                    }
                    
                    Text("Bitcoin")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .medium))
                }
                .padding()
                
                HStack {
                    
                    Text("$\(String(format: "%.f", Double(.random(in: 22000...30000))))")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .semibold))
                    
                    Text("+\(String(format: "%.f", Double(.random(in: 2...7))))%")
                        .foregroundColor(.green)
                        .font(.system(size: 15, weight: .semibold))
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.bottom)
                
                    Chart()
                    .disabled(true)
                
            }
        }
    }
}

struct TradeChart_Previews: PreviewProvider {
    static var previews: some View {
        TradeChart()
    }
}

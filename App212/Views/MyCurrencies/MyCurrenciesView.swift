//
//  MyCurrenciesView.swift
//  App212
//
//  Created by IGOR on 07/10/2023.
//

import SwiftUI

struct MyCurrenciesView: View {
    
    @State var percentCircle: Double = 0
    @Binding var show: Bool

    var body: some View {
   
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                show = true

                            }
                            
                        }, label: {
                            
                            VStack(spacing: 3) {
                                
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(.white)
                                    .frame(width: 20, height: 2)
                                
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(.white)
                                    .frame(width: 20, height: 2)
                                
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(.white)
                                    .frame(width: 20, height: 2)
                            }
                            .padding(9)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.3)))
                            
                        })
                        
                        Text("My currencies")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .semibold))
                        
                        Spacer()

                    }
                    
                    ZStack {
                        
                        
                        Circle()
                            .stroke(Color.gray.opacity(0.2), lineWidth: 15)
                            .frame(width: 200)
                        
                        Circle()
                            .trim(from: 0, to: CGFloat(calculatePercentage() / 100))
                            .stroke(Color("blue"), lineWidth: 15)
                            .frame(width: 200)
                            .rotationEffect(.degrees(-90))
                        
                        Text("Currency usage ratio")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                        
                    }
                    .padding()
                }
                .padding()
                .background(Color("b").ignoresSafeArea())
                
                NavigationLink(destination: {
                    
                    TradeChart()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    HStack {
                        
                        Image("bitcoin")
                        
                        Text("Bitcoin")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .medium))
                        
                        Spacer()
                        
                        Text("\(String(format: "%.f", calculatePercentage())) %")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .medium))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 7).fill(Color("b")))
                    .padding()
                })
                
                Spacer()
            }
        }
    }
    
    func calculatePercentage() -> Double {
        
        let value = Double(.random(in: 1...98))
        let maxValue = 100
        
        let percentCircle = Double(value) / Double(maxValue) * 100
        
        return percentCircle
    }
}

struct MyCurrenciesView_Previews: PreviewProvider {
    static var previews: some View {
        MyCurrenciesView(show: .constant(true))
    }
}

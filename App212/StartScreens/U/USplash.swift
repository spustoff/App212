//
//  USplash.swift
//  App212
//
//  Created by IGOR on 05/10/2023.
//

import SwiftUI

struct USplash: View {
    
    let telegram: URL
    let isTelegram: Bool
    let isContacts: Bool
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("users_1")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    VStack(alignment: .center, spacing: 6, content: {
                        
                        Text("Be the best at what you do")
                            .foregroundColor(.white)
                            .font(.system(size: 28, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("Become a pro in the financial market")
                            .foregroundColor(.white.opacity(0.7))
                            .font(.system(size: 17, weight: .regular))
                    })
                    .padding()
                    .padding(.top)
                    
                    NavigationLink(destination: {
                        
                        Reviews(telegram: telegram, isTelegram: isTelegram, isContacts: isContacts)
                            .navigationBarBackButtonHidden()
                        
                    }, label:  {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("blue")))
                            .padding()
                    })
                    .padding(.top, 60)
                    .padding(.bottom)
                }
                .frame(maxWidth: .infinity)
                .background(Color.black)
            }
        }
    }
}

struct USplash_Previews: PreviewProvider {
    static var previews: some View {
        USplash(telegram: URL(string: "h")!, isTelegram: false, isContacts: false)
    }
}

//
//  Join.swift
//  App212
//
//  Created by IGOR on 05/10/2023.
//

import SwiftUI

struct Join: View {
    
    let telegram: URL
    let isContacts: Bool
    
    var body: some View {
        

        ZStack {
            
            Color(red: 0/255, green: 174/255, blue: 237/255)
                .ignoresSafeArea()
            
            VStack {
                
                Image("users_3")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    VStack(alignment: .center, spacing: 6, content: {
                        
                        Text("Join and earn")
                            .foregroundColor(.white)
                            .font(.system(size: 28, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("Join our Telegram group trade with our team")
                            .foregroundColor(.white.opacity(0.7))
                            .font(.system(size: 17, weight: .regular))
                    })
                    .padding()
                    .padding(.top)
                    
                    Button(action: {

                        UIApplication.shared.open(telegram)
                        
                    }, label:  {
                        
                        Text("Join")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color(red: 0/255, green: 174/255, blue: 237/255)))
                            .padding()
                    })
                    .padding(.top, 60)
                    
                    NavigationLink(destination: {

                        if isContacts == true {

                            Manager()
                                .navigationBarBackButtonHidden()

                        } else if isContacts == false {

                            Not()
                                .navigationBarBackButtonHidden()
                        }
                        
                    }, label: {
                        
                        Text("Skip")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 30)
                    })
                    .padding(.bottom)
                }
                .frame(maxWidth: .infinity)
                .background(Color("b").ignoresSafeArea())
            }
        }
    }
}


struct Join_Previews: PreviewProvider {
    static var previews: some View {
        Join(telegram: URL(string: "h")!, isContacts: false)
    }
}

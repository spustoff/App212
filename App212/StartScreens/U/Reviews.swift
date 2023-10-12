//
//  Reviews.swift
//  App212
//
//  Created by IGOR on 05/10/2023.
//

import SwiftUI
import StoreKit

struct Reviews: View {
    
    let telegram: URL
    let isTelegram: Bool
    let isContacts: Bool
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("users_2")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    VStack(alignment: .center, spacing: 6, content: {
                        
                        Text("Rate our app in the AppStore")
                            .foregroundColor(.white)
                            .font(.system(size: 28, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("Help make the app even better")
                            .foregroundColor(.white.opacity(0.7))
                            .font(.system(size: 17, weight: .regular))
                    })
                    .padding()
                    .padding(.top)
                    
                    NavigationLink(destination: {
                        
                        if isTelegram == true {
                            
                            Join(telegram: telegram, isContacts: isContacts)
                                .navigationBarBackButtonHidden()
                            
                        } else if isTelegram == false {
                            
                            if isContacts == true {
                                
                                Manager()
                                    .navigationBarBackButtonHidden()
                                
                            } else if isContacts == false {
                                
                                Not()
                                    .navigationBarBackButtonHidden()
                            }
                        }
                        
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
        .onAppear{
            
            SKStoreReviewController.requestReview()
        }
    }
}


struct Reviews_Previews: PreviewProvider {
    static var previews: some View {
        Reviews(telegram: URL(string: "h")!, isTelegram: false, isContacts: false)
    }
}

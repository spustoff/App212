//
//  Not.swift
//  App212
//
//  Created by IGOR on 05/10/2023.
//

import SwiftUI

struct Not: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {
        

        ZStack {
            
            Color("b")
                .ignoresSafeArea()
            
            VStack {
                
                Image("users_5")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    VStack(alignment: .center, spacing: 6, content: {
                        
                        Text("Don’t miss anything")
                            .foregroundColor(.white)
                            .font(.system(size: 28, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("Don’t miss the most userful information")
                            .foregroundColor(.white.opacity(0.7))
                            .font(.system(size: 17, weight: .regular))
                    })
                    .padding()
                    .padding(.top)
                    
                    Button(action: {
                        
                        status = true
                        
                    }, label: {
                        
                        Text("Enable Notifications")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("blue")))
                            .padding()
                    })
                    .padding(.top, 60)
                    
                    Button(action: {
                        
                        status = true
                        
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


struct Not_Previews: PreviewProvider {
    static var previews: some View {
        Not()
    }
}

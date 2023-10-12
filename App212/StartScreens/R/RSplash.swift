//
//  RSplash.swift
//  App212
//
//  Created by IGOR on 05/10/2023.
//

import SwiftUI

struct RSplash: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("reviewers_1")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    Text("All your crypto transactions")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .semibold))
                        .multilineTextAlignment(.center)
                        .padding()
                        .padding(.top)
                    
                    Text("Control your crypto income and expenses")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .regular))
                    
                    NavigationLink(destination: {
                        
                        RSplash2()
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

struct RSplash_Previews: PreviewProvider {
    static var previews: some View {
        RSplash()
    }
}

//
//  RSplash2.swift
//  App212
//
//  Created by IGOR on 05/10/2023.
//

import SwiftUI

struct RSplash2: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("reviewers_2")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    Text("Detailed information")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .semibold))
                        .multilineTextAlignment(.center)
                        .padding()
                        .padding(.top)
                    
                    Text("Detailed transaction report")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .regular))
                    
                    NavigationLink(destination: {
                        
                        RSplash3()
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

struct RSplash2_Previews: PreviewProvider {
    static var previews: some View {
        RSplash2()
    }
}

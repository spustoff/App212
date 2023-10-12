//
//  RSplash3.swift
//  App212
//
//  Created by IGOR on 05/10/2023.
//

import SwiftUI

struct RSplash3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("reviewers_3")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    Text("Instant creation")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .semibold))
                        .multilineTextAlignment(.center)
                        .padding()
                        .padding(.top)
                    
                    Text("Convenient creation menu")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .regular))
                    
                    Button(action: {
                        
                        status = true
                        
                    }, label: {
                        
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

struct RSplash3_Previews: PreviewProvider {
    static var previews: some View {
        RSplash3()
    }
}

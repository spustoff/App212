//
//  LoadingView.swift
//  App212
//
//  Created by IGOR on 05/10/2023.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Image("logo")
            }
            
            VStack {
                
                Spacer()
                
                ProgressView()
                    .padding()
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}

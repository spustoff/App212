//
//  Menu.swift
//  App212
//
//  Created by IGOR on 06/10/2023.
//

import SwiftUI
import StoreKit

struct Menu: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var tabs: [String] = ["Main", "My currencies", "Calendar", "My categories", "Policy Usage", "Rate Us"]
    @State var isDelete: Bool = false
    
    @Binding var show: Bool
    @Binding var currentTab: String
    
    var body: some View {
        
        ZStack {
            
            Color("b")
                .ignoresSafeArea()
                .opacity(show ? 0.5 : 0)
                .onTapGesture {
                    
                    withAnimation(.spring()) {
                        
                        show = false
                    }
                }
            
            VStack {
                
                HStack {
                    
                    Text("Menu")
                        .foregroundColor(.white)
                        .font(.system(size: 32, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            show = false
                        }
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .bold))
                    })
                }
                .padding()
                
                VStack {
                    
                    ForEach(tabs, id: \.self) { index in
                        
                        Button(action: {
                            
                            if index == "Rate Us" {
                                
                                SKStoreReviewController.requestReview()
                                
                            } else if index == "Policy Usage" {
                                
                                guard let url = URL(string: "https://www.termsfeed.com/live/9aabbc51-ff6e-4493-bdde-3b403a3e7ac5") else { return }
                                
                                UIApplication.shared.open(url)
                                
                            } else {
                                
                                withAnimation(.spring()) {
                                    
                                    currentTab = index
                                }
                            }
                            
                            withAnimation(.spring()) {
                                
                                show = false
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(index)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                                
                                Text(index)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .medium))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                            }
                            .padding()
                        })
                    }
                }
                .padding(.horizontal, 10)
                
                Spacer()
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        isDelete = true
                    }
                    
                }, label: {
                    
                    HStack {
                        
                        Text("Reset progress")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 5).stroke(Color.white.opacity(0.1)))
                    }
                    
                })
                .padding()
                
            }
            .padding(.vertical, 50)
            .frame(width: UIScreen.main.bounds.width / 1.2)
            .frame(maxHeight: .infinity)
            .background(Color("b"))
            .frame(maxWidth: .infinity, alignment: .leading)
            .offset(x: show ? 0 : -UIScreen.main.bounds.width)
        }
        .ignoresSafeArea()
        .overlay (
            
            DeleteAccount(delete: $isDelete)
        )
    }
}

struct DeleteAccount: View {
    @AppStorage("status") var status: Bool = false
    
    @Binding var delete: Bool

    @AppStorage("history") var history: [String] = []
    @AppStorage("history2") var history2: [String] = []
    @AppStorage("history3") var history3: [String] = []
    @AppStorage("history5") var history5: [String] = []
    @AppStorage("history_cat_e") var history_cat_e: [String] = []
    @AppStorage("history_cat_i") var history_cat_i: [String] = []
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
                .opacity(delete ? 0.8 : 0)
                .onTapGesture {
                    
                    withAnimation(.spring()) {
                        
                        delete = false
                    }
                }
            
            VStack {
                
                Text("Reset progress")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .semibold))
                
                Text("Your entire progress will be permanently deleted")
                    .foregroundColor(.gray)
                    .font(.system(size: 13, weight: .regular))
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        delete = false
                    }

                    history.removeAll()
                    history2.removeAll()
                    history3.removeAll()
                    history5.removeAll()
                    history_cat_i.removeAll()
                    history_cat_e.removeAll()

                    status = false
                    
                }, label: {
                    
                    Text("Reset")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.red))
                })
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color("b")))
            .padding()
            .offset(y: delete ? 0 : UIScreen.main.bounds.height)
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu(show: .constant(true), currentTab: .constant(""))
    }
}

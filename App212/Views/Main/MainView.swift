//
//  MainView.swift
//  App212
//
//  Created by IGOR on 05/10/2023.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
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
                        
                        Text("Main")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .semibold))
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            Text("+")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .regular))
                        })
                        .frame(width: 30, height: 30)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("blue")))
                    }
                    
                    Text("$\(viewModel.balance)")
                        .foregroundColor(.white)
                        .font(.system(size: 34, weight: .semibold))
                }
                .padding()
                .background(Color("b").ignoresSafeArea())
                
                VStack(alignment: .leading) {
                    
                    Text("Education")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    Text("Upgrade your skills")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .regular))
                        .padding(.horizontal)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .background(Image("ebg").resizable())
                .padding(.top, 5)
                
                HStack {
                    
                    ForEach(viewModel.operations, id: \.self) { index in
                        
                        Button(action: {
                            
                            viewModel.current_operation = index
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 4)
                                .background(RoundedRectangle(cornerRadius: 7).fill(viewModel.current_operation == index ? .gray.opacity(0.6) : .gray.opacity(0.3)))
                                .padding(.vertical)
                            
                        })
                        
                    }
                }
                
                if viewModel.current_operation == "Income" {
                    
                    if viewModel.history.isEmpty {
                        
                        VStack() {
                            
                            Image("empty")
                            
                            Text("Empty")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .semibold))
                            
                            Text("You have no added income")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                        }
                        .frame(maxHeight: .infinity, alignment: .center)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: true) {
                            
                            VStack {
                                
                                ForEach(viewModel.history, id: \.self) { index in
                                    
                                    HStack {
                                        
                                        Text(index)
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .semibold))
                                        
                                        Spacer()
                                        
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 5).fill(.gray.opacity(0.2)))
                                    
                                }
                            }
                            .padding()
                        }
                    }
                    
                } else {
                    
                    if viewModel.history2.isEmpty {
                        
                        VStack() {
                            
                            Image("empty")
                            
                            Text("Empty")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .semibold))
                            
                            Text("You have no added expenses")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                        }
                        .frame(maxHeight: .infinity, alignment: .center)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: true) {
                            
                            VStack {
                                
                                ForEach(viewModel.history2, id: \.self) { index in
                                    
                                    
                                    HStack {
                                        
                                        Text(index)
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .semibold))
                                        
                                        Spacer()
                                        
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 5).fill(.gray.opacity(0.2)))
                                    
                                }
                            }
                            .padding()
                        }
                    }
                }
                
                Spacer()
            }
            .overlay (
                
                withAnimation(.spring()) {
                    
                    oper()

                }
            )
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
    
    @ViewBuilder
    func oper() -> some View {
        
        ZStack {
            
            Color.black.opacity(0.5)
                .ignoresSafeArea()
                .opacity(viewModel.isAdd ? 1 : 0)
                .onTapGesture {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = false
                    }
                }
            
            VStack {
                
                Text("What do you want to add?")
                    .foregroundColor(.white)
                    .font(.system(size: 17, weight: .semibold))
                
                HStack {
                
                ForEach(viewModel.operations, id: \.self) { index in
                    
//                    if let curOper = viewModel.current_operation {
                        
                        NavigationLink(destination: {
                            
                            AddOperationView(mainModel: viewModel)
                                .navigationBarBackButtonHidden()
                                .onAppear {
                                    
                                    viewModel.current_operation = index
                                }
                            
                        }, label: {
                            
                            HStack {
                                
                                VStack(alignment: .leading, content: {
                                    
                                    Text(index)
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .medium))
                                })
                                
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 5).stroke(.gray.opacity(0.15)))
                        })
//                    }
                }
            }
            }
            .padding()
            .padding(.vertical)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(RoundedRectangle(cornerRadius: 0).fill(Color("b")))
            .frame(maxHeight: .infinity, alignment: .bottom)
            .offset(y: viewModel.isAdd ? 0 : UIScreen.main.bounds.height)
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(show: .constant(true))
    }
}

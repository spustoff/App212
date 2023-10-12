//
//  MyCategoriesView.swift
//  App212
//
//  Created by IGOR on 08/10/2023.
//

import SwiftUI

struct MyCategoriesView: View {
    
    @StateObject var viewModel = MyCategoriesViewModel()
    
    @Binding var show: Bool
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
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
                    
                    Text("My categories")
                        .foregroundColor(.white)
                        .font(.system(size: 26, weight: .semibold))
                    
                    Spacer()
                    
                }
                
                HStack {
                    
                    ForEach(viewModel.catType, id: \.self) { index in
                        
                        Button(action: {
                            
                            viewModel.current_cat = index
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 4)
                                .background(RoundedRectangle(cornerRadius: 7).fill(viewModel.current_cat == index ? .gray.opacity(0.6) : .gray.opacity(0.3)))
                                .padding(.vertical)
                            
                        })
                        
                    }
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    if viewModel.current_cat == "Income" {
                       
                        if viewModel.history_cat_i.isEmpty {
                            
                            VStack {
                                
                                Image("empty")
                                    .padding(.top, 160)
                                
                                Text("Empty")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .semibold))
                                
                                Text("No income categories created")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                                
                            }
                            .frame(maxHeight: .infinity, alignment: .center)
                            
                        } else {
                            
                            ScrollView(.vertical, showsIndicators: true) {
                                
                                VStack {
                                    
                                    ForEach(viewModel.history_cat_i, id: \.self) { index in
                                        
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
                            }
                        }

                    } else {
                        
                        if viewModel.history_cat_e.isEmpty {
                            
                            VStack() {
                                
                                Image("empty")
                                    .padding(.top, 160)
                                
                                Text("Empty")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .semibold))
                                
                                Text("No expenses categories created")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                            }
                            .frame(maxHeight: .infinity, alignment: .center)
                            
                        } else {
                            
                            ScrollView(.vertical, showsIndicators: true) {
                                
                                VStack {
                                    
                                    ForEach(viewModel.history_cat_e, id: \.self) { index in
                                        
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
                            }
                        }
                    }
                }
                
                Spacer()
                                
                Button(action: {
                    
                    viewModel.isAddCat = true
                    
                }, label: {
                    
                    if viewModel.current_cat == "Income" {
                        
                        Text("Add income category")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 7).fill(Color("blue")))
                            .padding(.vertical)
                        
                    } else {
                        
                        Text("Add expenses category")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 7).fill(Color("blue")))
                            .padding(.vertical)
                    }
                })
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isAddCat, content: {
            
            AddCategory(mainModel: viewModel)

        })
    }
}

struct MyCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        MyCategoriesView(show: .constant(true))
    }
}

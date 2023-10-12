//
//  AddCategory.swift
//  App212
//
//  Created by IGOR on 08/10/2023.
//

import SwiftUI

struct AddCategory: View {
    
    @StateObject var viewModel = AddCategoryViewModel()
    @StateObject var mainModel: MyCategoriesViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                RoundedRectangle(cornerRadius: 5)
                    .fill(.gray.opacity(0.2))
                    .frame(width: 40, height: 5)
                    .padding(.bottom, 9)
                
                HStack {
                    
                    Text("Plan")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .semibold))
                    
                    Text(mainModel.current_cat)
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .semibold))
                }
                
                ZStack(alignment: .leading, content: {
                    
                    Text("Category name ")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .opacity(viewModel.catName.isEmpty ? 1 : 0)

                    
                    TextField(" $", text: $viewModel.catName)
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                })
                .padding()
                .background(RoundedRectangle(cornerRadius: 7).fill(Color.white.opacity(0.1)))
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.2))
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: 2)
                
                Button(action: {
                                            
                        if mainModel.current_cat == "Income" {
                                                        
                            mainModel.history_cat_i.append("\(viewModel.catName)")

                        } else {
                            
                            mainModel.history_cat_e.append("\(viewModel.catName)")
                            
                        }
                        
                        presentationMode.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Create")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 7).fill(Color("blue")))
                        .padding(.vertical)
                })
                .opacity(viewModel.catName.isEmpty ? 0.5 : 1)
                .disabled(viewModel.catName.isEmpty ? true : false)
                
                Spacer()
                
            }
            .padding()
        }
    }
}

struct AddCategory_Previews: PreviewProvider {
    static var previews: some View {
        AddCategory(mainModel: MyCategoriesViewModel())
    }
}

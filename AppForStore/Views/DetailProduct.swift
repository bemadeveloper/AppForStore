//
//  DetailProduct.swift
//  AppForStore
//
//  Created by Bema on 30/4/24.
//

import SwiftUI

struct DetailProduct: View {
    @StateObject var editManager = EditManager()
    @State private var editedName = ""
    @State private var editedPrice = ""
    @State private var editedManufacturer = ""
    var product: Product
    
    var body: some View {
        VStack {
            ZStack {
                Color("Bg")
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    Image(product.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .edgesIgnoringSafeArea(.top)
                    
                    DescriptionView(editedName: $editedName, editedPrice: $editedPrice, editedManufacturer: $editedManufacturer, product: product, editManager: editManager)
                        .offset(y: -40)
                    
                        .toolbar {
                            NavigationLink {
                                EditProductView(product: product, productList: productList)
                                    .environmentObject(editManager)
                            } label: {
                                EditButton()
                            }
                        }
                }
            }
        }
        .onAppear {
            editedName = product.name
            editedManufacturer = product.brand ?? ""
        }
    }
}

#Preview {
    DetailProduct(product: productList[0])
        .environmentObject(CartManager())
}

struct DescriptionView: View {
    @Binding var editedName: String
    @Binding var editedPrice: String
    @Binding var editedManufacturer: String
    @State private var isDataModified = false
    @State private var counter = 1
    var product: Product
    var editManager: EditManager
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Button(action: {
                isDataModified.toggle()
                if editedName != product.name {
                    editManager.changeName(for: product, newName: editedName)
                }
            }) {
                TextField("", text: $editedName)
                    .font(.title)
                    .fontWeight(.bold)
            }
            
            HStack(spacing: 4) {
                ForEach(0..<5) { item in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                Text("(4.6)")
                    .opacity(0.5)
                    .padding(.leading, 8)
                Spacer()
            }
            Text("Описание")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            
            Text(product.descriton ?? "")
                .lineSpacing(6)
                .opacity(0.6)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Размеры")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    Text("42-50")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading) {
                    Text("Производитель")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    
                    TextField(product.brand ?? "", text: $editedManufacturer)
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical)
            
            Button(action: {
                NavigationLink(destination: EditProductView(product: product, productList: productList)) {
                    EditProductView(product: product, productList: productList)
                        .environmentObject(editManager)
                }
            }) {
                Text("Редактировать")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .background(isDataModified ? Color.green : Color.blue)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
            
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text("Цвета")
                        .fontWeight(.semibold)
                    
                    HStack {
                        ColorDotView(color: .black)
                        ColorDotView(color: .red)
                        ColorDotView(color: .blue)
                    }
                }
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Количество")
                        .fontWeight(.semibold)
                    
                    HStack() {
                        Button(action: {
                            self.counter -= 1
                        }) {
                            Image(systemName: "minus")
                                .padding(.all, 8)
                        }
                        .frame(width: 30, height: 30)
                        .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                        .foregroundColor(.black)
                        
                        Text("\(counter)")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 8)
                        
                        Button(action: {
                            self.counter += 1
                        }) {
                            Image(systemName: "plus")
                                .padding(.all, 8)
                        }
                        //.frame(width: 30, height: 30)
                        .background(.brown)
                        .clipShape(Circle())
                        .foregroundColor(.white)
                    }
                }
            }
        }
        .padding()
        .padding(.top)
        .background(Color.white)
        .cornerRadius(40)
    }
}

struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}

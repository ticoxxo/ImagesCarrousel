//
//  ContentView.swift
//  ImagesCarrousel
//
//  Created by Alberto Almeida on 09/02/24.
//

import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    let name: String
}

struct ContentView: View {
    // Pones tus imagenes aqui
    @State var items: [Item] = [Item(name:"image1"), Item(name:"image2"),Item(name:"image3")]
    @State var scrolledID: Item.ID?
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing:0) {
                    ForEach(items) { tour in
                        ZStack(alignment: .bottom) {
                            Image(tour.name)
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.horizontal, 10)
                                    .containerRelativeFrame(.horizontal)
                                    .scrollTransition(.animated, axis: .horizontal) { content, phase in
                                        content
                                            .opacity(phase.isIdentity ? 1.0 : 0.8)
                                            .scaleEffect(phase.isIdentity ? 1.0 : 0.8)
                                    }
                            Label("HALF TIME: 23:16", systemImage: "xmark.square")
                                .font(.headline)
                                .padding(10)
                                .background(.white)
                                .foregroundStyle(.black)
                                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 3)
                                .offset(y: 20)
                            Text("Fri, MAY 5 / 7:00 PM")
                                .font(.headline)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading)
                                .padding(.top, 20)
                                .offset(y:60)
                                
                        }
                        .frame(height: UIScreen.main.bounds.width)
                    
                    }
                }
                .scrollTargetLayout()
            }
            .scrollPosition(id: $scrolledID)
            .scrollTargetBehavior(.paging)
            
            HStack(spacing: 10) {
                ForEach(items) { index in
                    Rectangle()
                        .frame(width: 30, height: 5)
                        .foregroundColor(index.id == scrolledID ? .black : .gray)
                }
            }
             
        }
        .border(Color.blue)
        
    }
}


#Preview {
    ContentView()
}


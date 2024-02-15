//
//  ContentView.swift
//  ImagesCarrousel
//
//  Created by Alberto Almeida on 09/02/24.
//

import SwiftUI


struct ContentView: View {
    @State private var currentIndex = 0
    // Pones tus imagenes aqui
    var images = ["image1", "image2", "image3"]
   
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                    ForEach(0..<images.count, id:\.self) { index in
                        Image(images[index])
                            .resizable()
                            .scaledToFit()
                            .opacity(index == currentIndex ? 1 : 0)
                    }
                    Label("HALF TIME: 23:16", systemImage: "xmark.square")
                        .font(.headline)
                        .padding(10)
                        .background(.white)
                        .foregroundStyle(.black)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 3)
                        .offset(y: 20)
                }
                
                
                Text("Fri, MAY 5 / 7:00 PM")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.top, 20)
                Text("TAYLOR SWIFT: THE ERAS TOUR")
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                
            HStack(spacing: 10) {
                ForEach(0..<images.count, id: \.self) { index in
                    Rectangle()
                        .frame(width: 30, height: 5)
                        .foregroundColor(index == currentIndex ? .black : .gray)
                        .onTapGesture {
                            withAnimation {
                                currentIndex = index
                            }
                        }
                }
            }
        }
        .border(Color.blue)
        
    }
}

#Preview {
    ContentView()
}

struct Tour {
    var id: String
    var name: String
    var artist: String
    var title: String
    var halftime: String
}

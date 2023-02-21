//
//  ListView.swift
//  CapselSample
//
//  Created by cmStudent on 2023/02/08.
//

import SwiftUI
import Firebase

import SwiftUI
struct ListCell: View {
    @State var dog: Dog
    @StateObject var manager: DataManeger
    @State var rank = 0
   
    var body: some View {
      
        HStack{
            Text("\(rank)位")
            Text(dog.breed)
            Text("\(dog.score)")
        }
        .onAppear(){
            if let index = manager.dogs.firstIndex(of: dog) {
                rank = index+1

            }
        }
        
    }
}



struct ListView: View {
//    @ObservedObject var manager: DataManeger
    @ObservedObject var dataManeger: DataManeger
    @State private var showPopup = false
    var body: some View {
        NavigationView {
            VStack{
                List(dataManeger.dogs,id: \.self){ dog in
                    ListCell(dog: dog, manager: dataManeger)
                }
                .navigationTitle("ランキング")
                .navigationBarItems(trailing: Button(action: {
                    showPopup.toggle()
                }, label: {
                   
                }))                                                                                                                                              
               
            }
            .onAppear(){
                dataManeger.fetchDogs()
            }

        }
    }
}

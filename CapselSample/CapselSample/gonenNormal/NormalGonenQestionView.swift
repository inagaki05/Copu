//
//  GonenQestionView.swift
//  CapselSample
//
//  Created by cmStudent on 2023/01/31.
//

import SwiftUI

struct NormalGonenQestionView: View {
    @ObservedObject var viewModel: NormalQuestionViewModel
    @State var questionNum: Int
    var body: some View {
        ZStack{
            VStack {
                Text("問題:  \(viewModel.hoge[0])")
                    .font(.largeTitle)
                    .padding()
                
                LazyVGrid(columns:viewModel.columus) {
                    ForEach(1..<5){ i in
                        Button(action: {
                            viewModel.answerqestion(choice: viewModel.hoge[i], num: questionNum)
                        }, label: {
                            ZStack{
                                oppai()
                                Text("\(viewModel.choiceIndex[i-1])\(viewModel.hoge[i])")
                                    
                                    .font(.system(size: 20))
                                    .foregroundColor(Color.blue.opacity(0.5))
                            }
                        })
                    }
                }
            }
        }
        
        //開いた瞬間起動
        .onAppear(){
            let filename = "tangonormal"
            viewModel.allTango = viewModel.getTangoFile(name: filename).shuffled()
            viewModel.getQuestions()
            viewModel.shuffleChoice()
            print("-----問題----- \(viewModel.hoge[0])")
        }
    }
}

struct oppai1: View {
    var body: some View {
        ZStack {
            Circle().frame(width: 130)
                .foregroundColor(Color(red: 0.4, green: 0.7, blue: 0.0).opacity(0.7))
                .frame(width: 130, height: 130)
        }
    }
    
}


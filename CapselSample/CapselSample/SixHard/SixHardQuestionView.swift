//
//  QuestionView.swift
//  HerdSample
//
//  Created by cmStudent on 2023/01/30.
//

import SwiftUI



struct SixHardQuestionView: View {
    @ObservedObject var viewModel: SixHardQuestionViewModel
    @State var questionNum: Int
    var body: some View {
        ZStack{
            VStack {
                Text("問題:  \(viewModel.hoge[0])")
                    .fontWeight(.regular)
                    .padding()
                
                LazyVGrid(columns:viewModel.columus) {
                    ForEach(1..<5){ i in
                        Button(action: {
                            viewModel.answerqestion(choice: viewModel.hoge[i], num: questionNum)
                        }, label: {
                            ZStack{
                                maru()
                                Text("\(viewModel.choiceIndex[i-1])\(viewModel.hoge[i])")
                                    
                                    .font(.system(size: 20))
                                    .foregroundColor(Color.white.opacity(0.5))
                            }
                        })
                    }
                }
            }
        }
        
        //開いた瞬間起動
        .onAppear(){
            let filename = "SixHard"
            viewModel.allTango = viewModel.getTangoFile(name: filename).shuffled()
            viewModel.getQuestions()
            viewModel.shuffleChoice()
            print("-----問題----- \(viewModel.hoge[0])")
        }
    }
}





struct maru: View {
    var body: some View {
        ZStack {
            Circle().frame(width: 130)
                .foregroundColor(Color(red: 1.0, green: 0.5, blue: 0.0).opacity(0.7))
                .frame(width: 130, height: 130)
        }
    }
    
}


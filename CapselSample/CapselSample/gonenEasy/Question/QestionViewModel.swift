//
//  Qestion.swift
//  EasySample1
//
//  Created by cmStudent on 2023/01/13.
//

import Foundation
import SwiftUI
import AVFoundation



class QuestionViewModel: ObservableObject{
    
    //問題を見えなくする
    @Published var end: [Bool] = [true,true,true,true,true,true]
    
    //矢印を押させないようにする
    @Published var yajirusistop: Bool = true
    
    
    @Published var allTango: [String] = []
    @Published var indexNum = 0
    let choiceIndex = ["A: ", "B: ", "C: ", "D: "]
    @Published var hoge = ["", "", "", "", ""]
    @Published var answer = ""
    let columus = [GridItem(.fixed(phone.w/3)), GridItem(.fixed(phone.w/3))]
    // 問題 _ 答え _ 答えに似たやつ _ スペル間違えてるやつ
    @Published var mondai = ""
    //問題の数
    @Published var mondainunnbetr = 0
    
    @ObservedObject var manager: dispManager = .DispManager
    //ボタンを使えなくする
    
    
    
    let  seikai = NSDataAsset(name:"seikai")!.data
    let  batu = NSDataAsset(name:"batu")!.data
    
    var thinkPlayer: AVAudioPlayer!
    
    
    func seikaiPlay(){
        do{
            
            self.thinkPlayer = try AVAudioPlayer(data: self.seikai)
            
            thinkPlayer.play()
        } catch {
            print("エラーが発生しました")
        }
        
    }
    func batuPlay(){
        do{
            
            self.thinkPlayer = try AVAudioPlayer(data: self.batu)
            
            thinkPlayer.play()
        } catch {
            print("エラーが発生しました")
        }
        
    }
    
    
    // allTangoから問題を取得し、加工してhogeに代入
    func getQuestions() {
        let question: String = allTango[indexNum]
        let questionArray = question.split(separator: "_")
        hoge = []
        for material in questionArray {
            hoge.append(String(material))
        }
        answer = hoge[1]
        
        if indexNum < allTango.count-1 {
            // 継続
            indexNum+=1
            shuffleChoice()
            
        } else {
            // クリア
            print("ひでが問題つくるの遅いからこれで終わり。")
        }
    }
    
    
    
    func   answerqestion(choice: String, num: Int){
        if answer == choice {
            manager.questionview = 0
            end[num-1] = false
            yajirusistop = true
            seikaiPlay()
            mondainunnbetr+=1
            print("正解")
        }else{
            batuPlay()
            print("不正解")
        }
        print("----\(end)")
    }
    
    
    
    
    // 配列の先頭以外を並べ替え
    func shuffleChoice() {
        let question = hoge[0]
        hoge.removeFirst()
        hoge.shuffle()
        hoge.insert(question, at: 0)
    }
    
    
    // tangoから一行ずつ問題を取り出し
    func getTangoFile(name: String) -> [String] {
        guard let fileURL = Bundle.main.url(forResource: name, withExtension: "txt"),
              let fileContents = try? String(contentsOf: fileURL)
        else {
            print("aaaa")
            return []
        }
        return fileContents.split(separator: "\n").compactMap { $0.isEmpty ? nil : String($0) }
    }
    
    
}

//
//  SwiftUIView.swift
//  yuugioh
//
//  Created by 高橋沙久哉 on 2024/04/17.
//

import SwiftUI

class YokoViewController: UIViewController {

  override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
     //左横画面に変更
       if(UIDevice.current.orientation.rawValue == 4){
              UIDevice.current.setValue(4, forKey: "orientation")
              return .landscapeLeft
      }
       //左横画面以外の処理
       else {
              //最初の画面呼び出しで画面を右横画面に変更させる。
              UIDevice.current.setValue(3, forKey: "orientation")
              return .landscapeRight
      }
 }

   // 画面を自動で回転させるかを決定する。
   override var shouldAutorotate: Bool {
      //画面が縦だった場合は回転させない
      if(UIDevice.current.orientation.rawValue == 1){
           return false
     }
       else{
           return true
     }
  }
   override func viewDidLoad() {
     //画面向きを左横画面でセットする
     UIDevice.current.setValue(4, forKey: "orientation")

     //画面の向きを変更させるために呼び出す。
     print(supportedInterfaceOrientations)
     
  }
}

#Preview {
    
}

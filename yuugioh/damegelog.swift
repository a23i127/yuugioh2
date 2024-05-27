//
//  damegelog.swift
//  yuugioh
//
//  Created by 高橋沙久哉 on 2024/05/15.
//

import SwiftUI
let DamegeLog=DamegeList()
//@Stateは、変数を再描写するだけでなく、スコープの拡大も機能の一つとして保持している。普通は、view内で宣言された変数はそのview内でしか使用できないが、（モディファイアで宣言された変数にも同じことが言える）
//@Stateを使うと、viewないだろうが、モディファイアないだろうが、どこにでもアクセスすることができる変数を作れる

//基本的に、viewでは、コンテナを指定してあげるのが一般的（Vstuckなど。）これがないと、if文などは、動かすことができない場合がある。
//.onAppearは、some view自体につけるのではなく、コンテナに、モディファイアをつけるということになる。
//空のviewは、エラーを引き起こしているのと同じで、viewの中身がprintだけでも、それは、viewの中自体は、からであることと同じなので、表示することはないから。表示するための何かを配置しない限り、viewは表示するための何かに、表示するものがないよ。ってことになるので、エラーが起きる

struct damegelog: View {
    @State var isShowing=false
    @State var Pointcpy:[Int]=[]
    @State var Pointscpy:[Int]=[]
    @State var Damegecpy:[String]=[]
    @State var Damegescpy:[String]=[]
    
    var body: some View {
        
        VStack{
            
            
            
            //配列を、Boxからコピーして、子のSwiftUIのviewのなかで、Textで、表示する必要がある。
            if isShowing{
                ForEach(Pointcpy, id: \.self) { element in
                    Text("\(element)")
                }
            }
        }
        
        .onAppear{//.onAppearは、view版のイニシャライザで、viewが表示された時の初期処理である
            
            isShowing=true
            Pointcpy=[0]
            Pointscpy=[0]
            Damegecpy=[""]
            Damegescpy=[""]
            print(DamegeLog.Point.count)
            DamegeLog.Boxcpy(number:&Pointcpy,from: DamegeLog.Point)
            
            print(Pointcpy.count)
        }
    }
}

#Preview {

            damegelog()
        
    }
    
 


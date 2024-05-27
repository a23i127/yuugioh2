import SwiftUI

struct ContentView: View {
    @State var lifepoint=8000
    @State var lifepoints=8000
    @State var input=""
    @State var turnCount=0
    @State var turn=true
    @State var Swich=false
    
    //インスタンス化
    let DamegeLIST = DamegeList()
    
    var body: some View {
        
        HStack {
            
            
            ZStack{   //ここにコードを表示
                Rectangle()
                    .foregroundColor(.white)
                VStack{
                    HStack{Spacer()
                        Text("DueList_1").underline()
                        Spacer()
                        Text("DueList_2").underline()
                        Spacer()
                    }
                    HStack{
                        
                        
                        Button(action: {
                            turn=true
                        }
                               , label: {
                            Text("\(lifepoint)")
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                            .modifier(if:turn){content in//モディファイアにBoolを適応させたい場合extentionViewで、Viewを拡張させることが必要です
                                
                                    content.underline()
                                .foregroundColor(.red)}
                        })
                        
                        Spacer()
                        Button(action:  {
                            lifepoint=8000
                            lifepoints=8000
                            
                            
                        }, label: {
                            VStack{
                                Image(systemName: "arrow.clockwise.circle.fill")
                                Text("リセット")
                                    .font(.caption)
                            }
                        })
                        Spacer()
                        
                        Button(action: {
                            turn=false
                        }, label: {
                            Text("\(lifepoints)")
                            .frame(width: 100)
                            .modifier(if: turn==false) { content in
                                content.underline()
                                    .foregroundColor(.red)
                            }
                        })
                       
                    }
                    .foregroundColor(.black)
                    .padding()
                    .font(.title)
                    HStack{Spacer()
                        
                            Button(action: {
                                lifepoint=DamegeLIST.reset()
                            }, label: {
                                VStack{
                                    Image(systemName: "arrowshape.turn.up.backward.badge.clock.fill")
                                    Text("一つ前に戻る").font(.caption)
                                }
                            })
                        
                            Spacer()
                   
                            Button(action: {
                                lifepoints=DamegeLIST.reset2()
                            }, label: {
                                VStack{ Image(systemName: "arrowshape.turn.up.backward.badge.clock.fill.rtl")
                                    Text("一つ前に戻る").font(.caption)
                                }
                            })
                        
                        Spacer()
                    }
                    VStack{
                        
        
                        Text("\(input)")
                            .padding()
                        HStack{Button(action: {
                            input=""
                        }, label: {
                            ZStack{
                                Rectangle()
                                    .stroke(Color.black, lineWidth: 2.0)
                                    .frame(width: 80,height: 60)
                                    .cornerRadius(10.0)
                                
                                Text("CLR")
                                .foregroundColor(.black)}
                        })
                            ForEach(1..<4){number in
                                Button(action: {
                                    
                                    input+="\(number)"
                                    
                                }, label: {
                                    
                                    ZStack{
                                        Rectangle()
                                            .stroke(Color.blue, lineWidth: 2.0)
                                            .frame(width: 80,height: 60)
                                            .cornerRadius(10.0)
                                        
                                        Text("\(number)")
                                        .foregroundColor(.blue)}
                                })
                            }
                            
                        }
                        HStack{
                            Button(action: {//scannerを使うことで、整数型の文字列を、整数に変換している
                                let scanner = Scanner(string: input)
                                var integerValue:Int=0
                                if scanner.scanInt(&integerValue){
                                    if turn==true{
                                        lifepoint += integerValue
                                        DamegeLIST.PointSave(number: lifepoint)
                                        DamegeLIST.DamegeCount(number:"+"+input)
                                    }
                                    else{
                                        lifepoints += integerValue
                                        DamegeLIST.PointSaves(number: lifepoints)
                                        DamegeLIST.DamegeCounts(number:"+"+input)
                                    }
                                }
                                else{
                                    print("system error")
                                }
                                input=""
                            }, label: {
                                ZStack{
                                    Rectangle()
                                        .stroke(Color.black, lineWidth: 2.0)
                                        .frame(width: 80,height: 60)
                                        .cornerRadius(10.0)
                                    
                                    Text("＋")
                                    .foregroundColor(.black)}
                            })
                            ForEach(4..<7){number in
                                Button(action: {
                                    input+="\(number)"
                                }, label: {
                                    ZStack{
                                        Rectangle()
                                            .stroke(Color.blue, lineWidth: 2.0)
                                            .frame(width: 80,height: 60)
                                            .cornerRadius(10.0)
                                        
                                        Text("\(number)")
                                        .foregroundColor(.blue)}
                                })
                                
                                
                                
                            }}
                        HStack{                        Button(action: {
                            let scanner = Scanner(string: input)
                            var integerValue:Int=0
                            if scanner.scanInt(&integerValue){
                                if turn==true{
                                    lifepoint -= integerValue
                                    DamegeLIST.PointSave(number: lifepoint)
                                    DamegeLIST.DamegeCount(number:"-"+input)
                                }
                                else{
                                    lifepoints -= integerValue
                                   DamegeLIST.PointSaves(number:lifepoints)
                                    DamegeLIST.DamegeCount(number:"-"+input)
                                }
                            }
                            else{
                                print("system error")
                            }
                            
                        input=""
                        }, label: {
                            ZStack{
                                Rectangle()
                                    .stroke(Color.black, lineWidth: 2.0)
                                    .frame(width: 80,height: 60)
                                    .cornerRadius(10.0)
                                
                                Text("ー")
                                .foregroundColor(.black)}
                        })
                            
                            ForEach(7..<10){number in
                                Button(action: {
                                    input+="\(number)"
                                }, label: {
                                    ZStack{
                                        Rectangle()
                                            .stroke(Color.blue, lineWidth: 2.0)
                                            .frame(width: 80,height: 60)
                                            .cornerRadius(10.0)
                                        
                                        Text("\(number)")
                                        .foregroundColor(.blue)}
                                })
                            }}
                        HStack{                        Button(action: {
                            
                        
                                if turn==true{
                                    lifepoint = lifepoint/2
                                    let InputlifePoint="\(lifepoint)"
                                    DamegeLIST.PointSave(number: lifepoint)
                                    DamegeLIST.DamegeCount(number:"-"+InputlifePoint)
                                }
                                else{
                                    lifepoints = lifepoints/2
                                    let InputlifePoints="\(lifepoints)"
                                    DamegeLIST.PointSaves(number: lifepoints)
                                    DamegeLIST.DamegeCounts(number:"-"+InputlifePoints)
                                    
                                }
                            
                            
                            
                        
                        }, label: {
                            ZStack{
                                Rectangle()
                                    .stroke(Color.black, lineWidth: 2.0)
                                    .frame(width: 80,height: 60)
                                    .cornerRadius(10.0)
                                
                                Text("/２")
                                .foregroundColor(.black)}
                        })
                            
                            
                            Button(action: {
                                input+="0"
                            }, label: {
                                ZStack{
                                    Rectangle()
                                        .stroke(Color.blue, lineWidth: 2.0)
                                        .frame(width: 80,height: 60)
                                        .cornerRadius(10.0)
                                    
                                    Text("0")
                                    .foregroundColor(.blue)}
                            })
                            Button(action: {
                                input+="00"
                            }, label: {
                                ZStack{
                                    Rectangle()
                                        .stroke(Color.blue, lineWidth: 2.0)
                                        .frame(width: 80,height: 60)
                                        .cornerRadius(10.0)
                                    
                                    Text("00")
                                    .foregroundColor(.blue)}
                            })
                            Button(action: {
                                input+="000"
                            }, label: {
                                ZStack{
                                    Rectangle()
                                        .stroke(Color.blue, lineWidth: 2.0)
                                        .frame(width: 80,height: 60)
                                        .cornerRadius(10.0)
                                    
                                    Text("000")
                                    .foregroundColor(.blue)}
                            })
                            
                            }
                        Button(action: {
                            if input.count<=2{
                                input+="00"
                            }
                            
                                let scanner = Scanner(string: input)
                                var integerValue:Int=0
                                if scanner.scanInt(&integerValue){
                                    if turn==true{
                                        lifepoint -= integerValue
                                        DamegeLIST.PointSave(number: lifepoint)
                                        DamegeLIST.DamegeCount(number:"-"+input)
                                    }
                                    else{
                                        lifepoints -= integerValue
                                        DamegeLIST.PointSaves(number: lifepoints)
                                        DamegeLIST.DamegeCounts(number:"-"+input)
                                    
                                }
                               print(input)
                                input=""
                            }
                        }, label: {
                            ZStack{
                                Rectangle()
                                    .stroke(Color.black, lineWidth: 2.0)
                                    .frame(width: 340,height: 55)
                                    .cornerRadius(10.0)
                                Text("=")
                                    .foregroundColor(.black)
                            }
                        })
                        
                        TabView{
                            Button(action: {
                                Swich.toggle()
                                
                            }, label: {
                                VStack{
                                    Image(systemName: "list.clipboard.fill")
                                    Text("ログ").font(.caption2)
                                }
                            }).sheet(isPresented: $Swich) {
                                damegelog().presentationDetents([.medium])
                            }
                            
                        }
                        
                    }
                    
                }
            }
        }
        
        
        
    }
    
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
extension View {
    func modifier<Content: View>(if condition: Bool, content: (Self) -> Content) -> some View {
        if condition {
            return AnyView(content(self))
        } else {
            return AnyView(self)
        }
    }
}

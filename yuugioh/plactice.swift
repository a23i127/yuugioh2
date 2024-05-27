import SwiftUI

struct plactice: View {
    @State private var input = ""
    @State private var result = ""
    
    var body: some View {
        VStack {
            Text("入力: \(input)")
                .padding()
            Text("結果: \(result)")
                .padding()
            
            HStack {
                ForEach(1..<10) { number in
                    Button("\(number)") {
                        self.input += "\(number)"
                    }
                    .padding()
                }
            }
            
            HStack {
                Button("0") {
                    self.input += "0"
                }
                .padding()
                
                Button("計算") {
                    self.result = "\(self.calculate())"
                }
                .padding()
            }
        }
        .padding()
    }
    
    func calculate() -> Int {
        // 入力された値を計算する関数
        return Int(input) ?? 0
    }
}

struct plactice_Previews: PreviewProvider {
    static var previews: some View {
        plactice()
    }
}


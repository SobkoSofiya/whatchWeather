//
//  ContentView.swift
//  WeatherWhatch WatchKit Extension
//
//  Created by Sofi on 12.02.2021.
//

import SwiftUI



struct v:View {
    @ObservedObject var model = Weath()
    var body: some View{
        ZStack{
            VStack{
            ForEach(model.m, id: \.self){ i in
                
            ContentView(mode: i)
             
            }
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView: View {
    @ObservedObject var model = Weath()
    @State var mode:Model
 
    var body: some View {
       
        ZStack{
           
            VStack{
                Spacer()
                HStack{
                    Text("Weather").foregroundColor(.white)
                    Text("time")
                }
                Text("\(mode.nam)").font(.custom("", size: 14)).foregroundColor(.white)
                HStack{
                    Image(systemName: "sun.max.fill").resizable().frame(width: 40, height: 40, alignment: .center).foregroundColor(.yellow).padding(.horizontal,20)
                    VStack(alignment:.leading){
                        Text("\(mode.temp)º").font(.custom("", size: 24))
                        Text("\(mode.scor)m/s").foregroundColor(.white).opacity(0.8)
                    }
                   
                }
                Text("\(mode.wheth)").foregroundColor(.white).opacity(0.8)
                RoundedRectangle(cornerRadius: 20).frame(width: 180, height: 1, alignment: .center).opacity(0.3)
                HStack(spacing:15){
                    VStack{
                        Text("10-1p").foregroundColor(.white).opacity(0.8)
                        Image(systemName: "sun.max.fill").resizable().frame(width: 30, height: 30, alignment: .center).foregroundColor(.yellow).padding(4)
                        Text("\(mode.temp)º").foregroundColor(.white).opacity(0.8)
                    }
                    VStack{
                        Text("10-1p").foregroundColor(.white).opacity(0.8)
                        Image(systemName: "sun.max.fill").resizable().frame(width: 30, height: 30, alignment: .center).foregroundColor(.yellow).padding(4)
                        Text("\(mode.temp)º").foregroundColor(.white).opacity(0.8)
                    }
                    VStack{
                        Text("10-1p").foregroundColor(.white).opacity(0.8)
                        Image(systemName: "moon.fill").resizable().frame(width: 30, height: 30, alignment: .center).foregroundColor(.yellow).padding(4)
                        Text("\(mode.temp)º").foregroundColor(.white).opacity(0.8)
                    }
                }
            }
            
        }.edgesIgnoringSafeArea(.all).onAppear(perform: {
            model.GetWeath()
          
        })
    }
}
//
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        v()
    }
}

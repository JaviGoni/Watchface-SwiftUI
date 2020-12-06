//
//  ContentView.swift
//  WatchFace
//
//  Created by Javier Goñi Puerta on 5/12/20.
//

import SwiftUI

let width: CGFloat = 184
let height: CGFloat = 224

let batteryValue: Float = 66
let activityValue: Float = 491
let exerciseValue: Float = 25
let standUpValue: Float = 7

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black
            VStack(spacing: 0) {
                HStack {
                    ProgressBar(progress: batteryValue, type: .constant(.battery))
                        .frame(width: 36, height: 36)
                    Spacer()
                    ZStack {
                        Circle().foregroundColor(.gray).opacity(0.5)
                        Text("8º")
                    }
                    .frame(width: 36, height: 36)
                }.padding(.bottom, 4)
                HStack {
                    Spacer()
                    Text("20:50:33")
                        .font(.system(.largeTitle, design: .rounded))
                }.padding(.bottom, 4)
                HStack {
                    ZStack {
                        ProgressBar(progress: activityValue, type: .constant(.activity))
                            .frame(width: 80, height: 80, alignment: .leading)
                        ProgressBar(progress: exerciseValue, type: .constant(.exercise))
                            .frame(width: 55, height: 55, alignment: .leading)
                        ProgressBar(progress: standUpValue, type: .constant(.standUp))
                            .frame(width: 30, height: 30, alignment: .leading)
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text(String(format: "%.0f", activityValue))
                            .foregroundColor(.red)
                            .font(.system(.title, design: .rounded))
                        Text(String(format: "%.0f", exerciseValue))
                            .foregroundColor(.green)
                            .font(.system(.title, design: .rounded))
                        Text(String(format: "%.0f", standUpValue))
                            .foregroundColor(.blue)
                            .font(.system(.title, design: .rounded))
                    }
                }.padding(.bottom, 4)
                Text("sáb, 5 de diciembre")
                    .font(.caption)
                    .textCase(.uppercase)
            }
            .foregroundColor(.white)
            .padding()
            .frame(width: width, height: height)
            .overlay(RoundedRectangle(cornerRadius: 40,style: .continuous)
                        .stroke(Color.gray, lineWidth: 3))
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

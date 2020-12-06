//
//  ProgressBar.swift
//  WatchFace
//
//  Created by Javier Goñi Puerta on 5/12/20.
//

import SwiftUI

enum ProgressType {
    case battery
    case activity
    case exercise
    case standUp
}

struct ProgressBar: View {
    
    let progress: Float
    
    @Binding var type: ProgressType
    
    private var lineWidth: CGFloat {
        switch type {
        case .battery: return 2.0
        default: return 10.0
        }
    }
    
    private var circleColor: Color {
        switch type {
        case .battery: return .gray
        case .activity: return .red
        case .standUp: return .blue
        case .exercise: return .green
        }
    }
    
    private var circleTrim: CGFloat {
        switch type {
        case .battery: return CGFloat(min(progress/100, 1.0))
        case .activity: return CGFloat(min(progress/700, 1.0))
        case .standUp: return CGFloat(min(progress/12, 1.0))
        case .exercise: return CGFloat(min(progress/30, 1.0))
        }
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: lineWidth)
                .opacity(0.3)
                .foregroundColor(circleColor).opacity(0.5)
            Circle()
                .trim(from: 0.0, to: circleTrim)
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                .foregroundColor(circleColor)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
            if type == .battery {
                Text(String(format: "%.0f", min(progress, 100.0))).font(.callout)
            }
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(progress: 50, type: .constant(.activity))
    }
}

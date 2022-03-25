//
//  LivePredictionView.swift
//  happy-tracker
//
//  Created by Patrick Fuller on 3/24/22.
//

import SwiftUI

struct LivePredictionView: View {
    
    @EnvironmentObject var frameManager: FrameManager
    
    @State var predictionLabel = ""
    
        
    var body: some View {
        
        PredictionLabelBox(label: predictionLabel)
            .onReceive(frameManager.$current) { cvpBuffer in
                updatePredLabel(cvpBuffer: cvpBuffer)
            }
    }
    
    func updatePredLabel(cvpBuffer: CVPixelBuffer?) {
        ImageClassifier.classifyBuffer(cvpBuffer: cvpBuffer) { bufferPred in
            let emotionPred = EmotionPrediction(
                happyConf: bufferPred.happyConfidence,
                sadConf: bufferPred.sadConfidence)
            predictionLabel = emotionPred.emotion
        }
    }
}


struct Box_Previews: PreviewProvider {
    static var previews: some View {
        PredictionLabelBox(label: "neutral")
    }
}


struct PredictionLabelBox: View {
    
    let label: String
    
    let displayRadius = 20.0
    
    let emotionColor: [String: Color] = [
        "happy": .green,
        "neutral": .white,
        "sad": .blue
    ]
    
    var body: some View {
        Text(label.capitalized)
            .fontWeight(.black)
            .font(.title)
            .foregroundColor( emotionColor[label] ?? .white)
            .frame(width: 110)
            .padding()
            .background(Color.black.opacity(0.5))
            .cornerRadius(displayRadius)
            .overlay(
                RoundedRectangle(cornerRadius: displayRadius)
                    .stroke(lineWidth: 4)
                    .foregroundColor(.white)
            )
    }
}

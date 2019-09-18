//
//  GoogleTranslate.swift
//  Workspace
//
//  Created by James touri on 9/17/19.
//  Copyright © 2019 jamestouri. All rights reserved.
//

import Foundation
import AVFoundation

let Key = "AIzaSyD7RpDRF15KsNnvv_Poln8oqVBp5-VP_ZI"
let ApiUrl = "https://speech.googleapis.com/v1p1beta1/speech:longrunningrecognize"

class SpeechService: NSObject, AVAudioPlayerDelegate {

    private var player: AVAudioPlayer?
    private var completionHandler: (() -> Void)?
    
    private(set) var busy: Bool = false
    
    func speech() {
        self.busy = true
        
        DispatchQueue.global(qos: .background) .async {
            
        }
        
    }
    
    private func buildPostData(audio: NSData, voiceType: VoiceType) -> Data {
        
        var voiceParams: [String: Any] = [
            // All available voices here: https://cloud.google.com/text-to-speech/docs/voices
            "languageCode": "en-US"
        ]
        
        if voiceType != .undefined {
            voiceParams["name"] = voiceType.rawValue
        }
        
        let params: [String: Any] = [
            "input": [
                "audio": audio
            ],
        ]
        
        // Convert the Dictionary to Data
        let data = try! JSONSerialization.data(withJSONObject: params)
        return data
    }
    
    
    
}

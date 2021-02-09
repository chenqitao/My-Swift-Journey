//
//  JMSpeechPermissionManager.swift
//  
//
//  Created by Jevon Mao on 2/2/21.
//

import Foundation
import Speech

struct JMSpeechPermissionManager{
    static let shared = JMSpeechPermissionManager()
    func requestPermission(completion: @escaping (Bool)->()) {
        SFSpeechRecognizer.requestAuthorization {authStatus in
            switch authStatus{
            case .authorized:
                completion(true)
            case .notDetermined:
                break
            default:
                completion(false)
            }
        }
    }
}

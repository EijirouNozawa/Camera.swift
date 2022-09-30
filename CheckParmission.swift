//
//  CheckParmission.swift
//  Swift6Camera
//
//  Created by 野澤英二郎 on 2021/02/08.
//

import Foundation
import Photos

class CheckParmission{
    
    func checkCamera(){
        
        PHPhotoLibrary.requestAuthorization { (status) in
            switch(status){
            
            case .authorized:
                
                print("authorized")
                
            case .notDetermined:
                print("notDetermined")
            case .restricted:
                print("restricted")
            case .denied:
                print("denied")
            case .limited:
                print("limited")
            @unknown default:
                break
            }
        }
        
        
    }
    
    
}


//
//  ViewController.swift
//  Swift6Camera
//
//  Created by 野澤英二郎 on 2021/02/08.
//

import UIKit
import Photos

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
    var checkPermission = CheckParmission()
    

    @IBOutlet weak var backImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkPermission.checkCamera()
        
        
        
        
    }
    
    
    @IBAction func camera(_ sender: Any) {
        
        let sourceType:UIImagePickerController.SourceType = .camera
        creatImagePicker(sourceType: sourceType)
        
        
    }
    
    
    
    @IBAction func album(_ sender: Any) {
        
        let sourceType:UIImagePickerController.SourceType = .photoLibrary
        creatImagePicker(sourceType: sourceType)
        
    }
    

    @IBAction func shere(_ sender: Any) {
        
        let text = ""
        let image = backImageView.image?.jpegData(compressionQuality: 0.5)
        let item = [text,image as Any]
        let activityVC = UIActivityViewController(activityItems: item, applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
        
        
    }
    
    func creatImagePicker(sourceType:UIImagePickerController.SourceType){
        
        let cameraPicker = UIImagePickerController()
        cameraPicker.sourceType = sourceType
        cameraPicker.delegate = self
        cameraPicker.allowsEditing = true
        self.present(cameraPicker, animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickerImage = info[.editedImage] as? UIImage{
            
            backImageView.image = pickerImage
            
            picker.dismiss(animated: true, completion: nil)
            
        }
        
    }
    
    
    
}


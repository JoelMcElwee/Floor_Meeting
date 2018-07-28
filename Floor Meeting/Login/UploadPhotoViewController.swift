//
//  UploadPhotoViewController.swift
//  Floor Meeting
//
//  Created by Joel McElwee on 5/23/18.
//  Copyright © 2018 Joel McElwee. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class UploadPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var profilePicView: UIImageView!
    
    @IBOutlet weak var discardPhotoButton: UIButton!
    @IBOutlet weak var usePhotoButton: UIButton!
    
    @IBAction func usePhotoAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func discardButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profilePicView.layer.cornerRadius = profilePicView.frame.size.height/2
        discardPhotoButton.layer.cornerRadius = 10
        usePhotoButton.layer.cornerRadius = 10
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        profilePicView.isUserInteractionEnabled = true
        profilePicView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var selectedPictureFromImage: UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] {
            selectedPictureFromImage = editedImage as? UIImage
        }
        else if let originalImage = info["UIImagePickerControllerOriginalImage"] {
            selectedPictureFromImage = originalImage as? UIImage
        }
        
        if let selectedImage = selectedPictureFromImage {
            profilePicView.image = selectedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
}

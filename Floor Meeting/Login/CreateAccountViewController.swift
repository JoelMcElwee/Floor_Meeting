//
//  CreateAccountViewController.swift
//  Floor Meeting
//
//  Created by Joel McElwee on 5/12/18.
//  Copyright © 2018 Joel McElwee. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage

class CreateAccountViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var fullNameField: UITextField!
    @IBOutlet weak var emailAddressField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var usePhoto: UIButton!
    @IBOutlet weak var discardPhoto: UIButton!
    @IBOutlet weak var uploadCopy: UILabel!
    @IBOutlet weak var changePhoto: UIButton!
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    var photoState = 0
    
    @IBAction func discardPhotoAction(_ sender: Any) {
        // There is an image literal to the right of the expression. It is difficult to see.
        profileImageView.image = #imageLiteral(resourceName: "upload photo")
        hideImageButtons(hide: true)
        uploadCopy.isHidden = false
    }
    
    @IBAction func usePhotoAction(_ sender: Any) {
        hideImageButtons(hide: true)
        changePhoto.isHidden = false
        
        buttonFormat(color: .williams(), button: changePhoto)
        
        signUpButton.isEnabled = true
    }
    
    @IBAction func changePhotoAction(_ sender: Any) {
        profileImageView.image = #imageLiteral(resourceName: "upload photo")
        hideImageButtons(hide: true)
        changePhoto.isHidden = true
        uploadCopy.isHidden = false
        
    }
    
    @IBAction func signUp(_ sender: Any) {
        createAccount()
    }
    
    func createAccount() {
        guard let email = emailAddressField.text else {return}
        guard let password = passwordField.text else {return}
        guard let name = fullNameField.text else {return}
        
        Auth.auth().createUser(withEmail: email, password: password){ user, error in
            if error == nil && user != nil {
                print("User Created!")
                
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = name
                changeRequest?.commitChanges(completion: { (error) in
                    if error == nil {
                        print("User display name changed!!")
                    }
                })
                
                guard let uid = user?.uid else {return}
                
                
                // Successfully authenticated user
                
                // Creates a unique string id
                let imageName = NSUUID().uuidString
                let storageRef = Storage.storage().reference().child("\(imageName).png")
                
                if let uploadData = UIImagePNGRepresentation(self.profileImageView.image!) {
                    storageRef.putData(uploadData, metadata: nil, completion: { (metadata, error) in
                        if error != nil {
                            print(error)
                            return
                        }
                        
                        if let profileImageUrl = metadata?.downloadURL()?.absoluteString {
                            let values = ["name": name, "email": email, "profileImageUrl": profileImageUrl]
                            self.registerUserIntoDatabaseWithUID(uid: uid, values: values)
                        }
                    })
                }
                
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "tabBarVC")
                self.present(controller!, animated: true, completion: nil)
            }
            else{
                let alert = UIAlertController(title: "There was an error creating your account!", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: { action in
                    self.dismiss(animated: true, completion: nil)
                }))
                self.present(alert, animated: true, completion: nil)
                print("Error creating user: \(error?.localizedDescription)")
            }
        }
    }
    
    private func registerUserIntoDatabaseWithUID(uid: String, values: [String: Any]) {
        let ref = Database.database().reference(fromURL: "https://floor-meeting.firebaseio.com/")
        
        let usersReference = ref.child("users").child(uid)
        usersReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
            if err != nil {
                print(err)
            }
            print("Saved user successfully")
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpButton.layer.cornerRadius = 10
        profileImageView.layer.cornerRadius = profileImageView.frame.size.height/2
        
        if profileImageView.image != #imageLiteral(resourceName: "upload photo") {
            usePhoto.isHidden = false
            discardPhoto.isHidden = false
            uploadCopy.isHidden = true
            signUpButton.isEnabled = true
        }
        else {
            signUpButton.isEnabled = false
        }

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        profileImageView.isUserInteractionEnabled = true
        profileImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func hideImageButtons(hide:Bool) {
        discardPhoto.isHidden = hide
        usePhoto.isHidden = hide
        
        buttonFormat(color: .gilchrist(), button: usePhoto)
        buttonFormat(color: .yakeley(), button: discardPhoto)
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
            profileImageView.image = selectedImage
            uploadCopy.isHidden = true
            
            hideImageButtons(hide: false)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func buttonFormat(color: UIColor, button: UIButton){
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = color.cgColor
        button.titleLabel?.textColor = color
    }

}

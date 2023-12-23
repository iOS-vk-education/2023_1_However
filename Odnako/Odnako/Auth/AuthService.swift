//
//  AuthService.swift
//  Odnako
//
//  Created by User on 18.12.2023.
//

import Foundation
import CoreMedia
import FirebaseAuth
import FirebaseFirestore

class AuthService {
    
    public static let shared = AuthService()
    private init() {}
    
    public func registerUser(with userRequest: RegisterUserRequest, completion: @escaping (Bool, Error?)->Void) {
            let username = userRequest.username
            let email = userRequest.email
            let password = userRequest.password
            
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(false, error)
                return
            }

            guard let resultUser = result?.user else {
                completion(false, nil)
                return
            }

            // Установка имени пользователя
            let changeRequest = resultUser.createProfileChangeRequest()
            changeRequest.displayName = username
            changeRequest.commitChanges { error in
                if let error = error {
                    completion(false, error)
                    return
                }

                // Сохранение данных в Firestore
                let db = Firestore.firestore()
                db.collection("users")
                    .document(resultUser.uid)
                    .setData([
                        "username": username,
                        "email": email
                    ]) { error in
                        if let error = error {
                            completion(false, error)
                            return
                        }

                        completion(true, nil)
                    }
            }
        }
    }
    
    public func signIn(with userRequest: loginUserRequest, completion: @escaping(Error?)->Void){
        Auth.auth().signIn(withEmail: userRequest.email, password: userRequest.password) {
            result, error in
            if let error = error {
                completion(error)
                return
            } else {
                completion(nil)
                
            }
        }
    }
    
    public func signOut(complition: @escaping(Error?)->Void){
        do{
            try Auth.auth().signOut()
            complition(nil)
        } catch let error {
            complition(error)
        }
    }
    
    
}

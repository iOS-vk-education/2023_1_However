//
//  APIManager.swift
//  Odnako
//
//  Created by User on 23.12.2023.
//

import Foundation
import FirebaseStorage
import FirebaseFirestore
import FirebaseAuth


class APIManager {
    
    static let shared = APIManager()
    
    private func ConfigureFB() -> Firestore {
        var db: Firestore!
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        return db
    }
    
    func getUserDeadlines(collection: String, userID: String, completion: @escaping([Deadline]?, Error?) -> Void) {
        
        var deadlinesArray: [Deadline] = []
        
        let db = ConfigureFB()
        // Создаем запрос к базе данных с фильтром по userId
        let query = db.collection(collection).whereField("userId", isEqualTo: userID)
        print(query.count)
        
        // Выполняем запрос
        query.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    let data = document.data()
                    // Извлекаем данные и создаем объекты Deadline
                    if let title = data["title"] as? String,
                       let hasDate = data["hasDate"] as? Bool,
                       var date = (data["date"] as? Timestamp)?.dateValue(),
                       let complexity = data["complexity"] as? Int,
                       let commentary = data["commentary"] as? String,
                       let userId = data["userId"] as? String,
                       let isComplete = data["isComplete"] as? Bool {
                        if !hasDate {
                            date = Date()
                        }
                        // Создаем объект Deadline
                        let deadline = Deadline(title: title, hasDate: hasDate, date: date, complexity: complexity, commentary: commentary, userId: userId, isComplete: isComplete)
                        deadlinesArray.append(deadline)
                    }
                }
            }
            completion(deadlinesArray, nil)
        }
    }
    
    
    func saveDeadlineToFirestore(collection: String, deadline: Deadline) {
        let db = ConfigureFB() // Получаем ссылку на базу данных Firestore
        
        do {
            // Преобразуем объект Deadline в формат, который можно сохранить в Firestore
            let documentData: [String: Any] = [
                "title": deadline.title,
                "hasDate": deadline.hasDate,
                "date": deadline.date,
                "complexity": deadline.complexity,
                "commentary": deadline.commentary,
                "userId": deadline.userId,
                "isComplete": deadline.isComplete
                // Добавьте другие поля, если они есть
            ]
            
            // Сохраняем данные в коллекцию "deadlines" в Firestore
            var ref: DocumentReference? = nil  // Объявляем переменную для DocumentReference
            ref = db.collection(collection).addDocument(data: documentData) { error in
                if let error = error {
                    // Обрабатываем ошибку, если сохранение не удалось
                    print("Error adding document: \(error)")
                } else {
                    // Данные успешно сохранены
                    print("Document added with ID: \(ref!.documentID)")
                }
            }
        } catch let error {
            // Произошла ошибка при преобразовании данных
            print("Error encoding deadline data: \(error.localizedDescription)")
        }
    }
    
    func updateDeadlineInFirestore(collection: String, deadline: Deadline, title: String) {
        let db = ConfigureFB()
        
        db.collection(collection).whereField("title", isEqualTo: title).getDocuments { (querySnapshot, error) in
            if error != nil {
                print("Document missed! - \(String(describing: error?.localizedDescription))")
            } else {
                for document in querySnapshot!.documents {
                    print(document.data())
                    document.reference.updateData([
                        "title": deadline.title,
                        "hasDate": deadline.hasDate,
                        "date": deadline.date,
                        "complexity": deadline.complexity,
                        "commentary": deadline.commentary,
                        "isComplete": deadline.isComplete
                    ])
                    print("Document successfully updated!")
                }
                
            }
        }
    }
    
    func deleteDeadlineFromFirestore(collection: String, deadline: Deadline) {
        let db = ConfigureFB()
        
        db.collection(collection).whereField("title", isEqualTo: deadline.title).getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error removing document: \(error.localizedDescription)")
            } else {
                for document in querySnapshot!.documents {
                    print(document.data())
                    document.reference.delete()
                    print("Document successfully removed!")
                }
                
            }
        }
    }
}

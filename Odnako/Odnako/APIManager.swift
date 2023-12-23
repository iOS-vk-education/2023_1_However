//
//  APIManager.swift
//  Odnako
//
//  Created by User on 23.12.2023.
//

import Foundation
import FirebaseStorage
import FirebaseFirestore


class APIManager {
    static let shared = APIManager()
    
    private func ConfigureFB() -> Firestore {
        var db: Firestore!
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        return db
    }
    
//    func getPost(collection: String, docName: String, completion: @escaping(Deadline?) -> Void){
//        let db = ConfigureFB()
//        db.collection(collection).document(docName).getDocument(completion: { (deadline, error) in
//            guard error == nil else { completion(nil); return }
//            
//            let dl = Deadline(title: deadline?.get("title") as! String,
//                              date: deadline?.get("date") as! Timestamp,
//                              complexity: deadline?.get("complexity") as! Int,
//                              commentary: deadline?.get("commentary") as! String)
//
//            completion(dl)
//        })
//        
//        
//    }
    
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
                       let date = (data["date"] as? Timestamp)?.dateValue(),
                       let complexity = data["complexity"] as? Int,
                       let commentary = data["commentary"] as? String,
                       let userId = data["userId"] as? String {
                           // Создаем объект Deadline
                           let deadline = Deadline(title: title, date: date, complexity: complexity, commentary: commentary, userId: userId)
                        deadlinesArray.append(deadline)
                    }
                }
            }
            completion(deadlinesArray, nil)
        }

       // completion(deadlinesArray, nil)

    }
    
    
    func saveDeadlineToFirestore(collection: String, deadline: Deadline) {
        let db = ConfigureFB() // Получаем ссылку на базу данных Firestore

        do {
            // Преобразуем объект Deadline в формат, который можно сохранить в Firestore
            let documentData: [String: Any] = [
                "title": deadline.title,
                "date": deadline.date,
                "complexity": deadline.complexity,
                "commentary": deadline.commentary,
                "userId": deadline.userId
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

    
}

//
//  DatabasManager.swift
//  Instagram
//
//  Created by kms on 2021/08/03.
//

import FirebaseDatabase

public class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    // MARK: - Public
    
    /// 유저이름과 이메일이 가능한지
    /// - Parameters
    /// - email: String reprenting email
    /// - username: String representing username
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void) {
        completion(true)
    }
    
    /// 새로운 정보 데이터베이스에 삽입
    /// 유저이름과 이메일이 가능한지
    /// - Parameters
    /// - email: String reprenting email
    /// - username: String representing username
    public func insertNewUser(with email : String, username: String, completion : @escaping (Bool) -> Void) {
        let key = email.safeDatabaseKey()
        print(key)
        
        database.child(key).setValue(["username": username]) { error, _ in
            if error == nil {
                // 성공
                completion(true)
                return
            }else {
                //실패
                completion(false)
                return
            }
        }
    }
    
    
}

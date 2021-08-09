//
//  AuthManager.swift
//  Instagram
//
//  Created by kms on 2021/08/04.
//
import FirebaseAuth

public class AuthManager {
    
    static let shared = AuthManager()
    
    // MARK: - Public
    
    public func registerNewUser(username : String, email : String, password : String, completion: @escaping (Bool) -> Void) {
        /*
         - 유저이름 사용가능한지
         - 이메일 사용가능한지
         */
        DatabaseManager.shared.canCreateNewUser(with: email, username: username) { canCreate in
            if canCreate {
                /*
                - 계정생성
                - 데이터베이스에 계정 삽입
                */
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    guard error == nil, result != nil else {
                        // firebase 계정 생성 X
                        completion(false)
                        return
                    }
                    // database에 삽입
                    DatabaseManager.shared.insertNewUser(with: email, username: username) { inserted in
                        if inserted {
                            completion(true)
                            return
                        }else {
                            // 데이터베이스 삽입 실패
                            completion(false)
                            return
                        }
                    }
                    
                }
            }else {
                completion(false)
            }
        }
    }
    
    public func loginUser(username : String?, email : String?, password : String, completion : @escaping ((Bool) -> Void)){
        if let email = email {
            // 이메일 로그인
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
                
                completion(true)
            }
        }else if let username = username {
            // 유저이름 로그인
            print(username)
        }
    }
    
    public func logOut(completion : (Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(true)
            return
        } catch {
            print(error)
            completion(false)
            return
        }
    }
}

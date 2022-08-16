//
//  ViewController.swift
//  ErrorHandling
//
//  Created by Yaz Burrell on 8/16/22.
//

import UIKit

enum EncryptionError: Error {
    case empty
    case short
}

class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // do this only if the condition passes
        do {
            let encrypted = try encrypt("hackable, secret info", withPassword: "123456")
            print(encrypted)
        //but just in case
        } catch EncryptionError.empty {
            print("You must provide a password")
        } catch EncryptionError.short {
            print("Passwords must be at least 5 characters, preferably 8 with a special character and number")
        } catch {
            print("Something ain't right")
        }
    }

    // Method to encrypt return an 'encrypted' pw
    // Adding throws protects against unacceptable pw conditions e.g., a pw called pw or no pw
    func encrypt(_ str: String, withPassword password: String) throws -> String {
        guard password.count > 0 else { throw EncryptionError.empty }
        guard password.count >= 4 else { throw EncryptionError.short }
        
        let encrypted = password + str + password
        
        return String(encrypted.reversed())
    }
    
    
    


}


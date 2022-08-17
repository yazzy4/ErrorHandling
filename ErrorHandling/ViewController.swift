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
    case obvious(String)
}

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            let encrypted = try encrypt("hackable,secretinfo", withPassword: "123456")
            print(encrypted)
        } catch EncryptionError.empty {
            print("You must provide a password")
        } catch EncryptionError.short {
            print("Passwords must be at least 5 characters, preferably 8 with a special character and number")
        } catch {
            print("Something ain't right")
        }
    }

    func encrypt(_ str: String, withPassword password: String) throws -> String {
        guard password.count > 0 else { throw EncryptionError.empty }
        guard password.count >= 4 else { throw EncryptionError.short }
        guard password != "123456" else  { throw EncryptionError.obvious("Mel Brooks in Spaceballs password")}
        
        let encrypted = password + str + password
        
        return String(encrypted.reversed())
    }
    
    //https://www.hackingwithswift.com/new-syntax-swift-2-error-handling-try-catch
}


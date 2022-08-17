# ErrorHandling

A quick exercise in error handling using do, try, catch, throw and throws

#### Method to return a very weak and'encrypted' password


```swift
func encrypt(_ str: String, withPassword password: String) -> String {
        let encrypted = password + str + password
        return String(encrypted.reversed())
    }
 ```
    

#### Adding throws protects against unacceptable pw conditions e.g., a password called password or no password at all!




```swift
func encrypt(_ str: String, withPassword password: String) throws -> String {
        let encrypted = password + str + password
        return String(encrypted.reversed())
    }
 ```
    
    
#### Add do, catch to viewDidLoad() 


```swift
        do {
            let encrypted = try encrypt("hackable, secret info", withPassword: "123456")
            print(encrypted) // show encrypted password in console
        } catch {
            print("Something ain't right")
        }
 ```
    
- Adding do here is meant to alert the developer that some condition might fail 
- If the condition does fail, 'catch' is where the failure is captured


#### Let's add an enum to specifiy the type of errors we might expect to see. In this case the pw might be too short or the user doesn't add a password


```swift 
enum EncryptionError: Error {
    case empty
    case short
}
```

#### Now we can specify what to do in case the user hasn't entered a password or if the password is too short

```swift
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
 ```
 
 #### We can further stitch the encrypt method up by guard statements that point pack to 'EncryptionError' type enum
 
 
```swift 
        guard password.count > 0 else { throw EncryptionError.empty }
        guard password.count >= 4 else { throw EncryptionError.short }
```

#### Swift, however wants to handle all errors, even ones that have not yet been defined


 
```swift 
enum EncryptionError: Error {
    case empty
    case short
    case obvious(String)
}
```

#### Now we are able to provide a message with a reason/admonishment of a person's choice of password

```swift 
 guard password != "123456" else  { throw EncryptionError.obvious("Mel Brooks in Spaceballs password")}
```
tsk tsk

 ### References 
 ------
 
 https://www.hackingwithswift.com/new-syntax-swift-2-error-handling-try-catch

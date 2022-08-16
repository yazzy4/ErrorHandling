# ErrorHandling

A quick exercise in error handling using do, try, catch, throw and throws

### Method to return a very weak and'encrypted' password
===============

```swift
func encrypt(_ str: String, withPassword password: String) -> String {
        let encrypted = password + str + password
        return String(encrypted.reversed())
    }
 ```
    

### Adding throws protects against unacceptable pw conditions e.g., a password called password or no password at all!
----------------------------



```swift
func encrypt(_ str: String, withPassword password: String) throws -> String {
        let encrypted = password + str + password
        return String(encrypted.reversed())
    }
 ```
    
    
### Add do, catch to viewDidLoad() 
----------------------------

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


### Let's add an enum to specifiy the type of errors we might expect to see. In this case the pw might be too short or the user doesn't add a password
----------------------------

```swift 
enum EncryptionError: Error {
    case empty
    case short
}
```

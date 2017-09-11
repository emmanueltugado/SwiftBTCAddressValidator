# SwiftBTCAddressValidator
Validate Bitcoin addresses in one line!

## Installation - Use CocoaPods
**pod 'SwiftBTCAddressValidator'**

### Usage

```
import SwiftBTCAddressValidator

let validator = BTCAddressValidator()

validator.isValid("1Q1pE5vPGEEMqRcVRMbtBK842Y6Pzo6nK9") // true
validator.isValid("1AGNa15ZQXAZUgFiqJ2i7Z2DPU2J6hW62j") // false
validator.isValid("") // false
```

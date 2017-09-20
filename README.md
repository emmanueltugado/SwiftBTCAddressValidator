# SwiftBTCAddressValidator
Validate Bitcoin addresses in one line!

## Install via CocoaPods
```
pod 'SwiftBTCAddressValidator'
```

### Usage
```
import SwiftBTCAddressValidator

let validator = BTCAddressValidator()

validator.isValid(bitcoinAddress: "1Q1pE5vPGEEMqRcVRMbtBK842Y6Pzo6nK9") // true
validator.isValid(bitcoinAddress: "1AGNa15ZQXAZUgFiqJ2i7Z2DPU2J6hW62j") // false
validator.isValid(bitcoinAddress: "") // false
```

#### Inspired by [this Rosetta Code discussion](https://rosettacode.org/wiki/Bitcoin/address_validation)

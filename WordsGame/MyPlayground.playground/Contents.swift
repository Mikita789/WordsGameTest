import UIKit
import Foundation

var globalWord = Array("Триангуляция".lowercased())
let userWord = Array("три")
var flag = true


for chr in userWord{
    if globalWord.contains(chr){
        globalWord.remove(at: globalWord.firstIndex(of: chr)!)
    }else {
        flag = false
    }
}

print( flag)


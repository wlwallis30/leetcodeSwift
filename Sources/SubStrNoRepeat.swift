//
// Created by LW on 7/3/18.
// Copyright (c) 2018 wlwallis30. All rights reserved.
//

import Foundation

protocol SubStrNoRepeatFunc {
}

class SubStrNoRepeat: SubStrNoRepeatFunc {
}

extension SubStrNoRepeatFunc {
    // company: FTwGL, medium level
    func subStrNoRepeat_3(_ str: String) -> Int {
        var res = 0
        let str = NSString(string: str)
        let asciiStart = unichar(0)
        // previous new story position map for each char, new story position means, for this char, next left side of window
        var preNewStoryMap = Array(repeating: 0, count: 256)
        var globalNewStory = 0
        for idx in 0..<str.length {
            let charKey = Int(str.character(at: idx) - asciiStart)
            if preNewStoryMap[charKey] == 0
                       || preNewStoryMap[charKey] < globalNewStory {
                res = max(res, idx - globalNewStory + 1)
            } else {
                globalNewStory = preNewStoryMap[charKey]
            }
            preNewStoryMap[charKey] = idx + 1

        }

        return res
    }

    func minWindowSubStr_76(_ source: String, _ target: String) -> String {
        var res = ""
        if source.isEmpty || target.count > source.count { return res }

        var targetCharMap = [Character: Int]()
        var sourceCharMap = [Character: Int]()
        for eachChar in target {
            sourceCharMap[eachChar] = 0
            if targetCharMap[eachChar] != nil {
                targetCharMap[eachChar]! += 1
            } else {
                targetCharMap[eachChar] = 1
            }
        }
        var left = 0, minResLen = source.count + 1, goalCount = 0
        for right in 0..<source.count {
            var curChar: Character = source[right]
            if targetCharMap[curChar] != nil {
                sourceCharMap[curChar]! += 1
                if sourceCharMap[curChar]! <= targetCharMap [curChar]! { goalCount += 1 }
            }

            while(goalCount == target.count) {
                curChar = source[left]
                if right-left+1 < minResLen {
                    minResLen = right - left + 1
                    res = source[Range(left...right)]
                }

                if sourceCharMap[curChar] != nil {
                    sourceCharMap[curChar]! -= 1
                    if sourceCharMap[curChar]! < targetCharMap [curChar]! { goalCount -= 1 }
                }
                left += 1
            }
        }
        return  res
    }

    func minWindowSubStr_76_1(_ source: String, _ target: String) -> String {
        var res = ""
        if source.isEmpty || target.count > source.count { return res }

        let source = NSString(string: source)
        let target = NSString(string: target)
        var targetCharMap = [unichar: Int]()
        var sourceCharMap = [unichar: Int]()
        for idx in 0..<target.length {
            let eachChar = target.character(at: idx)
            sourceCharMap[eachChar] = 0
            if targetCharMap[eachChar] != nil {
                targetCharMap[eachChar]! += 1
            } else {
                targetCharMap[eachChar] = 1
            }
        }
        var left = 0, minResLen = source.length + 1, goalCount = 0
        for right in 0..<source.length {
            var curChar = source.character(at: right)
            if targetCharMap[curChar] != nil {
                sourceCharMap[curChar]! += 1
                if sourceCharMap[curChar]! <= targetCharMap [curChar]! { goalCount += 1 }
            }

            while(goalCount == target.length) {
                curChar = source.character(at: left)
                if right-left+1 < minResLen {
                    minResLen = right - left + 1
                    res = source.substring(with: NSRange(location: left, length: minResLen))
                }

                if sourceCharMap[curChar] != nil {
                    sourceCharMap[curChar]! -= 1
                    if sourceCharMap[curChar]! < targetCharMap [curChar]! { goalCount -= 1 }
                }
                left += 1
            }
        }
        return  res
    }
}
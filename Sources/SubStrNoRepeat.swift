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
}
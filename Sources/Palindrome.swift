//
// Created by LW on 7/15/18.
// Copyright (c) 2018 wlwallis30. All rights reserved.
//

import Foundation

protocol PalindromeFunc {
}

class PalinDrome: PalindromeFunc {
}

extension PalindromeFunc {
    // MABlom, medium
    func longestPalindrome_5 (_ str: String) -> String {
        if str.count <= 1 { return str }
        let str = NSString(string: str)
        var resLeft = 0, resRight = 0, maxLen = 0
        var dp = Array(repeating: Array(repeating: 0, count: str.length), count: str.length)

        for end in 0..<str.length {
            dp[end][end] = 1
            for start in 0..<end {
                if str.character(at: start) == str.character(at: end)
                           && (end == start+1 || dp[start+1][end-1] == 1) {
                    dp[start][end] = 1
                } else { dp[start][end] = 0 }

                if dp[start][end] == 1 && maxLen < end-start+1 {
                    resLeft = start
                    resRight = end
                    maxLen = end - start + 1
                }
            }
        }
        maxLen = max(maxLen, resRight - resLeft + 1)
        return str.substring(with: NSRange(location: resLeft, length: maxLen))
    }

    // FABlomSnapYelp, medium
    func groupAnagram_49(_ strs: [String]) -> [[String]] {
        var res = [[String]]()
        var charStrsMap = [String: [String]]()
        var charA = Character("a").ascii

        for str in strs {
            var charCount = Array(repeating: 0, count: 26)
            var charGroupKey = ""
            for char in str {
                let idx = Int(char.ascii! - charA!)
                charCount[idx] += 1
            }

            for eachCnt in charCount { charGroupKey += String(eachCnt) + "$" }
            if charStrsMap[charGroupKey] != nil {
                charStrsMap[charGroupKey]!.append(str)
            } else { charStrsMap[charGroupKey] = [str] }
        }
        for oneGroup in charStrsMap { res.append(oneGroup.value.sorted()) }
        return res
    }

    func groupAnagramUseSort_49(_ strs: [String]) -> [[String]] {
        var res = [[String]]()
        var charStrsMap = [String: [String]]()

        for str in strs {
            let key = String(str.sorted())
            if charStrsMap[key] != nil {
                charStrsMap[key]!.append(str)
            } else { charStrsMap[key] = [str] }
        }

        for oneGroup in charStrsMap { res.append(oneGroup.value.sorted()) }
        return res
    }
}

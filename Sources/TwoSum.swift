//
// Created by LW on 6/18/18.
// Copyright (c) 2018 wlwallis30. All rights reserved.
//

import Foundation

protocol TwoSumFunc {
}

extension Array: Hashable where Element == Int {
    public var hashValue: Int {
        return self.reduce(into: 0) { accumulated, eachInt in accumulated &= eachInt.hashValue }
    }
}

extension TwoSumFunc {
    func twoSum_1(nums: [Int], target: Int) -> [Int] {
        var map: [Int: Int] = [Int: Int]()
        for idx in 0..<nums.count {
            let complement = target - nums[idx]
            if map[complement] != nil {
                return [map[complement]!, idx]
            }
            map[nums[idx]] = idx
        }
        return [Int]()
    }

    // !medium
    // you can use inout to mutate/sort value type of [Int], to pass with leetcoce.com use copy
    func threeSum_15(numbers: [Int]) -> [[Int]] {
        var res = [[Int]]()
        if numbers.count < 3 {
            return res
        }
        let nums = numbers.sorted()

        for idx in 0..<nums.count - 2 {
            if nums[idx] > 0 {
                break
            }
            if idx > 0 && nums[idx] == nums[idx - 1] {
                continue
            }
            var left = idx + 1, right = nums.count - 1
            while left < right {
                let tmpSum = nums[idx] + nums[left] + nums[right]
                if tmpSum == 0 {
                    res.append([nums[idx], nums[left], nums[right]])
                    left += 1
                    while nums[left] == nums[left - 1] && left < right {
                        left += 1
                    } // skip the same b
                    right -= 1
                    while nums[right] == nums[right + 1] && left < right {
                        right -= 1
                    } // skip the same c
                } else if tmpSum > 0 {
                    right -= 1
                    while nums[right] == nums[right + 1] && left < right {
                        right -= 1
                    }
                } else {
                    left += 1
                    while nums[left] == nums[left - 1] && left < right {
                        left += 1
                    }
                }
            }
        }
        return res
    }

    // !medium
    func threeSum_16(numbers: [Int], target: Int) -> Int {
        if numbers.count < 3 {
            return Int.max
        }
        var closest = numbers[0] + numbers[1] + numbers[2]
        var nums = numbers.sorted()
        var diff = abs(closest - target)
        for idx in 0..<nums.count - 2 {
            var left = idx + 1, right = nums.count - 1
            while left < right {
                let sum = nums[idx] + nums[left] + nums[right]
                let tmpDiff = abs(sum - target)
                if tmpDiff < diff {
                    closest = sum
                    diff = tmpDiff
                }
                if sum < target {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
        return closest
    }

    // !medium
    func fourSum_18(numbers: [Int], target: Int) -> [[Int]] {
        var res = Set<[Int]>()
        if numbers.count < 4 { return [[Int]]() }
        var nums = numbers.sorted()
        for i in 0..<nums.count-3 {
            for j in i+1..<nums.count-2 {
                if j > i + 1 && nums[j] == nums[j - 1] { continue }
                var left = j + 1, right = nums.count - 1
                while left < right {
                    let sum = nums[i] + nums[j] + nums[left] + nums[right]
                    if sum == target {
                        res.insert([nums[i], nums[j], nums[left], nums[right]])
                        left += 1
                        while nums[left] == nums[left - 1] && left < right { left += 1 }
                        right -= 1
                        while nums[right] == nums[right + 1] && left < right { right -= 1 }
                    } else if sum > target {
                        right -= 1
                        while nums[right] == nums[right + 1] && left < right { right -= 1 }
                    } else {
                        left += 1
                        while nums[left] == nums[left - 1] && left < right { left += 1 }
                    }
                }
            }
        }

        var result = [[Int]]()
        _ = res.map { result.append($0) }
        return result
    }

    func twoSumSorted_167(nums: [Int], target: Int) -> [Int] {
        var left = 0, right = nums.count - 1
        while left < right {
            let tmpSum = nums[left] + nums[right]
            if tmpSum == target {
                return [left+1, right+1]
            } else if tmpSum < target {
                left += 1
            } else { right -= 1 }
        }
        return [Int]()
    }

    func twoSumBST_653 (_ root: TreeNode?, _ target: Int) -> Bool {
        guard root != nil else {
            return false
        }
        var numSet = Set<Int>()
        return helper(&numSet, root, target)
    }

    func helper(_ numSet: inout Set<Int>, _ node: TreeNode?, _ target: Int) -> Bool {
        guard let node = node else {
            return false
        }
        if numSet.contains(target - node.val) { return true }
        numSet.insert(node.val)
        return helper(&numSet, node.left, target) || helper(&numSet, node.right, target)
    }

    // !medium
    func threeSumSmaller_259(_ nums: [Int], _ target: Int) -> Int {
        if nums.count < 3 { return 0 }
        let nums = nums.sorted { $0 < $1 }
        var res = 0
        for idx in 0..<nums.count-2 {
            var left = idx + 1, right = nums.count - 1
            while left < right {
                if nums[idx] + nums[left] + nums[right] < target {
                    res += right - left
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
        return res
    }
}

// @170 in leetcode for two sum design
// leetcode does not have swift interface for 170, still putting here
final class TwoSum: TwoSumFunc {
    var twoSumMap = [Int: Int]()

    func add(num: Int) {
        if self.twoSumMap[num] != nil {
            self.twoSumMap[num]! += 1
        } else {
            self.twoSumMap[num] = 1
        }
    }

    func find(target: Int) -> Bool {
        for key in twoSumMap.keys {
            let search = target - key
            if search != key && twoSumMap[search] != nil
                       || search == key && twoSumMap[key]! > 1 {
                return true
            }
        }
        return false
    }
}

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

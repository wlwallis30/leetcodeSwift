//
// Created by LW on 7/10/18.
// Copyright (c) 2018 wlwallis30. All rights reserved.
//

import Foundation

protocol LevelOrderFunc {
}

class LevelOrder: LevelOrderFunc {
}

extension LevelOrderFunc {
    // FMALBlomApp, medium
    func levelOrderQueue_102(_ root: TreeNode?) -> [[Int]] {
        var res = [[Int]]()
        if let root = root {
            var treeQ = Queue<TreeNode>()
            treeQ.enqueue(root)
            while !treeQ.isEmpty {
                var curLevelArray = [Int]()
                let curQSize = treeQ.count
                var curNode: TreeNode? = nil
                for _ in 0..<curQSize {
                    curNode = treeQ.dequeue()
                    curLevelArray.append(curNode!.val)
                    if let leftNode = curNode!.left { treeQ.enqueue(leftNode) }
                    if let rightNode = curNode!.right { treeQ.enqueue(rightNode) }
                }
                res.append(curLevelArray)
            }
        }

        return res
    }

    func levelOrderRecursive_102(_ root: TreeNode?) -> [[Int]] {
        var res = [[Int]]()
        leveOrderDFS(root, res: &res, level: 0)
        return res
    }

    private func leveOrderDFS(_ curNode: TreeNode?, res: inout [[Int]], level: Int) {
        if let curNode = curNode {
            if res.count == level { res.append([Int]()) }
            // now you can access res[level]
            res[level].append(curNode.val)
            if let left = curNode.left { self.leveOrderDFS(left, res: &res, level: level + 1) }
            if let right = curNode.right { self.leveOrderDFS(right, res: &res, level: level + 1) }
        }
        return
    }

    // MLBlom, medium
    func zigzagLevelOrder_103(_ root: TreeNode?) -> [[Int]] {
        var res = [[Int]]()
        if let root = root {
            var leftToRightStack = Stack<TreeNode>(), rightToLeftStack = Stack<TreeNode>()
            var curLevelArray = [Int]()
            leftToRightStack.push(root)
            var curNode: TreeNode? = nil
            while !leftToRightStack.isEmpty || !rightToLeftStack.isEmpty {
                while !leftToRightStack.isEmpty {
                    curNode = leftToRightStack.pop()
                    curLevelArray.append(curNode!.val)
                    if let left = curNode!.left { rightToLeftStack.push(left) }
                    if let right = curNode!.right { rightToLeftStack.push(right) }
                }
                if !curLevelArray.isEmpty { res.append(curLevelArray) }
                curLevelArray.removeAll()
                while !rightToLeftStack.isEmpty {
                    curNode = rightToLeftStack.pop()
                    curLevelArray.append(curNode!.val)
                    if let right = curNode!.right { leftToRightStack.push(right) }
                    if let left = curNode!.left { leftToRightStack.push(left) }
                }
                if !curLevelArray.isEmpty { res.append(curLevelArray) }
                curLevelArray.removeAll()
            }
        }

        return res
    }

    // easy
    func levelOrderBottomQueue_107(_ root: TreeNode?) -> [[Int]] {
        var res = [[Int]]()
        if let root = root {
            var treeQ = Queue<TreeNode>()
            treeQ.enqueue(root)
            var resStack = Stack<[Int]>()
            while !treeQ.isEmpty {
                var curLevelArray = [Int]()
                let curQSize = treeQ.count
                var curNode: TreeNode? = nil
                for _ in 0..<curQSize {
                    curNode = treeQ.dequeue()
                    curLevelArray.append(curNode!.val)
                    if let leftNode = curNode!.left { treeQ.enqueue(leftNode) }
                    if let rightNode = curNode!.right { treeQ.enqueue(rightNode) }
                }
                resStack.push(curLevelArray)
            }

            while !resStack.isEmpty {
                res.append(resStack.pop()!)
            }
        }

        return res
    }

    // easy
    func levelOrderBottomRecursive_107(_ root: TreeNode?) -> [[Int]] {
        var res = [[Int]]()
        leveOrderDFS(root, res: &res, level: 0)
        return res.reversed()
    }

    // easy
    func minDepth_111(_ root: TreeNode?) -> Int {
        if let root = root {
            if root.left == nil && root.right == nil {
                return 1
            }
            if root.left == nil { return 1 + minDepth_111(root.right) }
            if root.right == nil { return 1 + minDepth_111(root.left) }
            return 1 + min(minDepth_111(root.left), minDepth_111(root.right))
        }
        return 0
    }

    // ULYahooApple, easy
    func maxDepth_104(_ root: TreeNode?) -> Int {
        if let root = root {
            return 1 + max(maxDepth_104(root.left), maxDepth_104(root.right))
        }
        return 0
    }

    // Blom, easy
    func isBalanced_110(_ root: TreeNode?) -> Bool {
       if checkDepth(root) == -1 {
           return false
       } else { return true }
    }

    private func checkDepth(_ node: TreeNode?) -> Int {
       if let node = node {
           let left = checkDepth(node.left)
           if left == -1 {
               return -1
           }
           let right = checkDepth(node.right)
           if right == -1 {
               return -1
           }
           if abs(left - right) > 1 {
               return -1
           }
           return 1 + max(left, right)
       }
        return 0
    }

    // FGSnap, medium
    func verticalOrder_314(_ root: TreeNode?) -> [[Int]] {
        var res = [[Int]]()
        if let root = root {
            typealias VDepthNodePair = (depth: Int, node: TreeNode)
            var pairQ = Queue<VDepthNodePair>()
            pairQ.enqueue((0, root))
            var vDepthValMap = [Int: [Int]]()
            while !pairQ.isEmpty {
                let curPair = pairQ.dequeue()
                if var _ = vDepthValMap[curPair!.depth] {
                    vDepthValMap[curPair!.depth]!.append(curPair!.node.val)
                } else {
                    vDepthValMap[curPair!.depth] = [curPair!.node.val]
                }
                if let left = curPair!.node.left {
                    pairQ.enqueue((curPair!.depth-1, left))
                }
                if let right = curPair!.node.right {
                    pairQ.enqueue((curPair!.depth+1, right))
                }
            }
            let sortedMap = vDepthValMap.sorted { $0.key < $1.key}
            _ = sortedMap.map { res.append($0.value) }
           }
        return res
    }
}

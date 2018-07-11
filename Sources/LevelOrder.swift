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
}

//
//  Node.swift
//  Algo
//
//  Created by Waqas Sultan on 2/11/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit

extension Array {
    
    
    func sliceArray<T>(_ arr: Array<T>, _ x1: Int, _ x2: Int) -> Array<T> {
        
        var tt: Array<T> = []
        
        for index in stride(from: x1, to: (x2+1), by: 1) {
            tt.append(arr[index])
        }
        
        
        return tt
        
    }
    
    func combinations<T>(_ arr: Array<T>,_ k: Int) -> Array<Array<T>> {
        
       
        var ret: Array<Array<T>> = []
        
        var sub: Array<Array<T>> = []
        
        var next: Array<T> = []
        
        for i in stride(from: 0, to: arr.count, by: 1) {
            if(k == 1){
                
                ret.append([arr[i]])
                
            }else {
                 let sliceElement =  sliceArray(arr, i + 1, arr.count - 1)
              
                sub =   combinations(sliceElement, k - 1)
                
                for index in stride(from: 0, to: sub.count, by: 1) {
                    next = sub[index]
                    
                    next.insert(arr[i], at: 0)
                    
                    ret.append(next)
                }
                
                
            }
        }
       
        
        return ret
        
    }
}

extension Array where Element: Equatable {
    mutating func removeDuplicates() {
        var result = [Element]()
        for value in self {
            if !result.contains(value) {
                result.append(value)
            }
        }
        self = result
    }
}

class TreeNode<T> {
    
    var data: T
    var leftNode: TreeNode?
    var rightNode: TreeNode?
    var isAdded = false
    init(data: T,
         leftNode: TreeNode? = nil,
         rightNode: TreeNode? = nil) {
        self.data = data
        self.leftNode = leftNode
        self.rightNode = rightNode
    }
}

class BinaryTree<T: Comparable & CustomStringConvertible> {
    
    private var rootNode: TreeNode<T>?
    var heightLevel = -1

    func insert(element: T) {
        let node = TreeNode(data: element)
        if let rootNode = self.rootNode {
            self.insert(rootNode, node)
        } else {
            node.isAdded = true
            self.rootNode = node
        }
    }
    
    // RECURSIVE FUNCTION
    private func insert(_ rootNode: TreeNode<T>, _ node: TreeNode<T>) {
        
       
        if let leftNode = rootNode.leftNode {
            if let rightNode = rootNode.rightNode {
                if leftNode.leftNode == nil && leftNode.rightNode == nil {
                    self.insert(leftNode, node)
                } else if  leftNode.rightNode == nil {
                     self.insert(leftNode, node)
                } else {
                   // continue
                }
                
              //  return
            } else {
                node.isAdded = true
                rootNode.rightNode = node
                return
            }
            
        } else {
            node.isAdded = true

            rootNode.leftNode = node
            return
        }
        
        if node.isAdded == false {
            
            
            if let rightNode = rootNode.rightNode {
                    if rightNode.leftNode == nil && rightNode.rightNode == nil {
                        self.insert(rightNode, node)
                    } else if  rightNode.rightNode == nil {
                        self.insert(rightNode, node)
                    } else {
                        // continue
                    }
                    
                    //  return
                } else {
                    node.isAdded = true
                    rootNode.rightNode = node
                    return
                }
                
            }
            
            
//            if let rightNode = rootNode.rightNode {
//                if let _ = rootNode.leftNode {
//                    self.insert(rightNode, node)
//                    return
//                } else {
//                    node.isAdded = true
//
//                    rootNode.leftNode = node
//                    return
//                }
//
//            } else {
//                node.isAdded = true
//                rootNode.rightNode = node
//                return
//            }
        if rootNode.leftNode != nil && rootNode.rightNode != nil {
            heightLevel  = heightLevel + 1
        }
        
        }
        
    
//        if rootNode.data > node.data {
//            if let leftNode = rootNode.leftNode {
//                self.insert(leftNode, node)
//            } else {
//                rootNode.leftNode = node
//            }
//        } else {
//            if let rightNode = rootNode.rightNode {
//                self.insert(rightNode, node)
//            } else {
//                rootNode.rightNode = node
//            }
//        }
  
}

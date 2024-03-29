//
//  File.swift
//  
//
//  Created by Aung Ko Min on 10/6/23.
//

import Foundation

public extension DispatchQueue {
    static func safeAsync(execute work: () -> Void) {
        if Thread.isMainThread {
            work()
        } else {
            DispatchQueue.main.sync(execute: work)
        }
    }
}

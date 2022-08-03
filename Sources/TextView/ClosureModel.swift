//
//  File.swift
//  
//
//  Created by qihoo on 2022/8/3.
//

import Foundation

@available(iOS 13.0, macOS 10.15, tvOS 13, watchOS 6, *)
class ClosureModel {
    var didEnd: (() -> Void)? = nil
    var didBegin: (() -> Void)? = nil
    var shouldBegin: (() -> Bool)? = nil
    var shouldEnd: (() -> Bool)? = nil
    var didChange: (() -> Void)? = nil
    var shouldChangeText: ((ReturnKeyType) -> Bool)? = nil
    var didChangeSelection: (() -> Void)? = nil
    var shouldInteractWithURL: ((URL, NSRange, TextItemInteraction) -> Bool)? = nil
    var shouldInteractWithTextAttachment: ((TextAttachment, NSRange, TextItemInteraction) -> Bool)? = nil
}

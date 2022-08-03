//
//  File.swift
//  
//
//  Created by qihoo on 2022/8/3.
//

import Foundation

@available(iOS 13.0, macOS 10.15, tvOS 13, watchOS 6, *)
class ClosureModel {
    var didEnd: ((ViewType) -> Void)? = nil
    var didBegin: ((ViewType) -> Void)? = nil
    var shouldBegin: ((ViewType) -> Bool)? = nil
    var shouldEnd: ((ViewType) -> Bool)? = nil
    var didChange: ((ViewType) -> Void)? = nil
    var shouldChangeText: ((ViewType, NSRange, String) -> Bool)? = nil
    var didChangeSelection: ((ViewType) -> Void)? = nil
    var shouldInteractWithURL: ((ViewType, URL, NSRange, TextItemInteraction) -> Bool)? = nil
    var shouldInteractWithTextAttachment: ((ViewType, TextAttachment, NSRange, TextItemInteraction) -> Bool)? = nil
}

//
//  TextViewClosure.swift
//  
//
//  Created by on 2022/8/3.
//

import Foundation

/// In order to fit the usage of SwiftUI,
/// the methods in UITextViewDelegate are encapsulated in a closure manner

@available(iOS 13.0, macOS 10.15, tvOS 13, watchOS 6, *)
extension TextView {
    
    /// textViewDidBeginEditing
    public func onDidBegin(_ begin: @escaping () -> Void) -> Self {
        self.model.didBegin = begin
        return self
    }
    
    /// textViewDidEndEditing
    public func onDidEnd(_ end: @escaping () -> Void) -> Self {
        self.model.didEnd = end
        return self
    }
    
    /// textViewShouldChangeText
    /// Range
    /// ReplacementText
    public func onSubmit(_ submit: @escaping (ReturnKeyType) -> Bool) -> Self {
        self.model.shouldChangeText = submit
        return self
    }
    
    /// textViewShouldBeginEditing
    public func onShouldBegin(_ shouldBegin: @escaping () -> Bool) -> Self {
        self.model.shouldBegin = shouldBegin
        return self
    }
    
    /// textViewShouldEndEditing
    public func onShouldEnd(_ shouldEnd: @escaping () -> Bool) -> Self {
        self.model.shouldEnd = shouldEnd
        return self
    }
    
    /// textViewDidChangeSelection
    public func onDidChangeSelection(_ didChangeSelection: @escaping () -> Void) -> Self {
        self.model.didChangeSelection = didChangeSelection
        return self
    }
    
    /// textViewShouldInteractWithURL
    /// InCharacter
    /// Range
    /// Interaction
    public func onShouldInteractURL(_ shouldInteract: @escaping (URL, NSRange, TextItemInteraction) -> Bool) -> Self {
        self.model.shouldInteractWithURL = shouldInteract
        return self
    }
    
    /// textView
    /// shouldInteractWith textAttachment
    /// in characterRange
    /// interaction
    public func onShouldInteractTextAttachment(_ shouldInteract: @escaping (TextAttachment, NSRange, TextItemInteraction) -> Bool) -> Self {
        self.model.shouldInteractWithTextAttachment = shouldInteract
        return self
    }
}


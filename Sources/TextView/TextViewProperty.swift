//
//  File.swift
//  
//
//  Created by qihoo on 2022/8/3.
//

import UIKit

/// In order to fit the use of SwiftUI's syntactic sugar,
/// the property settings of UITextView are encapsulated with syntactic sugar.

@available(iOS 13.0, macOS 10.15, tvOS 13, watchOS 6, *)
public extension TextView {
    
    /// set text view font
    /// - Parameter font: UIFont
    /// - Returns: input view
    func font(_ font: UIFont?) -> Self {
        self.textView.font = font
        return self
    }
    
    /// text color
    /// - Parameter color: Color
    /// - Returns: input view
    func foregroundColor(_ color: UIColor) -> Self {
        self.textView.textColor = color
        return self
    }
    
    /// text view is first responder
    /// - Parameter isFirst: isFirst default: false
    /// - Returns: input view
    func isFirstResponder(_ isFirst: Bool) -> Self {
        if isFirst {
            self.textView.becomeFirstResponder()
        } else {
            self.textView.resignFirstResponder()
        }
        return self
    }
    
    /// text view is scroll enable
    /// - Parameter enable: Bool
    /// - Returns: input view
    func isScrollEnable(_ enable: Bool) -> Self {
        self.textView.isScrollEnabled = enable
        return self
    }
    
    /// text view keyboard type
    /// - Parameter type: UIKeyboardType Default: default
    /// - Returns: input view
    func keyboardType(_ type: UIKeyboardType) -> Self {
        self.textView.keyboardType = type
        return self
    }
    
    /// keyboard return key type
    /// - Parameter type: UIReturnKeyType
    /// - Returns: input view
    func returnKeyType(_ type: UIReturnKeyType) -> Self {
        self.textView.returnKeyType = type
        return self
    }
    
    /// text view shows horizontal scroll indicator
    /// - Parameter show: Bool
    /// - Returns: input view
    func showsHorizontal(_ show: Bool) -> Self {
        self.textView.showsHorizontalScrollIndicator = show
        return self
    }
    
    /// text view shows vertical scroll indicator
    /// - Parameter show: Bool
    /// - Returns: input view
    func showsVertical(_ show: Bool) -> Self {
        self.textView.showsVerticalScrollIndicator = show
        return self
    }
    
    /// text view return key automatically
    /// - Parameter enables: Bool
    /// - Returns: input view
    func returnKeyAutomatically(_ enables: Bool) -> Self {
        self.textView.enablesReturnKeyAutomatically = enables
        return self
    }
    
    /// text alignment
    func textAlignment(_ textAlignment: NSTextAlignment) -> Self {
        self.textView.textAlignment = textAlignment
        return self
    }
    
    /// text view is editable
    func isEditable(_ editable: Bool) -> Self {
        self.textView.isEditable = editable
        return self
    }
    
    /// text view is selectable
    func isSelectable(_ selectable: Bool) -> Self {
        self.textView.isSelectable = selectable
        return self
    }
}


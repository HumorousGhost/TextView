import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13, watchOS 6, *)
public typealias TextItemInteraction = UITextItemInteraction

@available(iOS 13.0, macOS 10.15, tvOS 13, watchOS 6, *)
public typealias TextAttachment = NSTextAttachment

@available(iOS 13.0, macOS 10.15, tvOS 13, watchOS 6, *)
public typealias ReturnKeyType = UIReturnKeyType

@available(iOS 13.0, macOS 10.15, tvOS 13, watchOS 6, *)
public struct TextView: UIViewRepresentable {
    
    public typealias UIViewType = UITextView
    
    @Binding var text: String
    @Binding var isSend: Bool
    let isTextCenter: Bool
    let width: CGFloat
    let height: CGFloat
    let model = ClosureModel()
    
    public init(_ text: Binding<String>,
                isSend: Binding<Bool>,
                isTextCenter: Bool = false,
                width: CGFloat = 0,
                height: CGFloat = 0) {
        self._text = text
        self._isSend = isSend
        self.isTextCenter = isTextCenter
        self.width = width
        self.height = height
    }
    
    let textView: UITextView = UITextView()
    
    public func makeUIView(context: Context) -> UITextView {
        self.textView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        self.textView.text = text
        self.textView.delegate = context.coordinator
        self.textView.textContainer.lineFragmentPadding = 0
        self.textView.textContainerInset = .zero
        self.textView.backgroundColor = UIColor.clear
        return self.textView
    }
    
    public func updateUIView(_ uiView: UITextView, context: Context) {
        
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator($text, $isSend, isTextCenter: self.isTextCenter, model: self.model)
    }
    
    public class Coordinator: NSObject, UITextViewDelegate {
        var text: Binding<String>
        var isSend: Binding<Bool>
        var isTextCenter: Bool
        var model: ClosureModel
        
        init(_ text: Binding<String>, _ isSend: Binding<Bool>, isTextCenter: Bool, model: ClosureModel) {
            self.text = text
            self.isSend = isSend
            self.isTextCenter = isTextCenter
            self.model = model
        }
        
        public func textViewDidBeginEditing(_ textView: UITextView) {
            self.model.didBegin?()
        }
        
        public func textViewDidEndEditing(_ textView: UITextView) {
            self.model.didEnd?()
        }
        
        public func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
            return self.model.shouldBegin != nil ? self.model.shouldBegin!() : true
        }
        
        public func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
            return self.model.shouldEnd != nil ? self.model.shouldEnd!() : true
        }
        
        public func textViewDidChangeSelection(_ textView: UITextView) {
            self.model.didChangeSelection?()
        }
        
        public func textViewDidChange(_ textView: UITextView) {
            text.wrappedValue = textView.text
            guard self.model.didChange == nil else {
                self.model.didChange?()
                return
            }
            // text center
            if isTextCenter {
                if !textView.text.isEmpty {
                    let contentSize = textView.contentSize
                    if contentSize.height <= textView.frame.height {
                        let offsetY = (textView.frame.height - contentSize.height) / 2.0
                        textView.contentInset = UIEdgeInsets(top: offsetY, left: 0, bottom: 0, right: 0)
                    }
                } else {
                    textView.contentInset = UIEdgeInsets.zero
                }
            }
        }
        
        /// click keyboard button
        public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            guard text == "\n" else {
                return true
            }
            guard self.model.shouldChangeText == nil else {
                return self.model.shouldChangeText!(textView.returnKeyType)
            }
            if textView.returnKeyType != .default {
                if !textView.text.isEmpty {
                    self.text.wrappedValue = textView.text
                }
                isSend.wrappedValue = true
                switch textView.returnKeyType {
                case .send:
                    textView.text = ""
                    textView.contentInset = UIEdgeInsets.zero
                default:
                    textView.resignFirstResponder()
                    break
                }
                return false
            }
            return true
        }
        
        public func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
            guard self.model.shouldInteractWithURL != nil else {
                return false
            }
            return self.model.shouldInteractWithURL!(URL, characterRange, interaction)
        }
        
        public func textView(_ textView: UITextView, shouldInteractWith textAttachment: NSTextAttachment, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
            guard self.model.shouldInteractWithTextAttachment != nil else {
                return false
            }
            return self.model.shouldInteractWithTextAttachment!(textAttachment, characterRange, interaction)
        }
    }
}

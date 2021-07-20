/// An element that defines a clickable button.
///
/// A ``Button`` can contain text and other elements.
///
public struct Button: Attributable, EventListener {
    public var tag: String = "button"
    public var attributes: [String: String] = [:]
    public var styles: [String: String] = [:]

    var innerHTML: String = ""

    /// Creates a button with a title and an ``onclick`` action.
    ///
    /// - Parameters:
    ///   - title: The title text for the button.
    ///   - action: The action script represented as a string.
    ///
    public init<S>(_ title: S, action: String) where S : StringProtocol {
        attributes["type"] = ButtonType.button.rawValue
        attributes["onclick"] = action
        innerHTML = String(describing: title)
    }

    /// Creates an empty button with an ``onclick`` action.
    ///
    /// - Parameters:
    ///   - action: The action script represented as a string.
    ///   - content: The internal HTML inside of the `<button></button>` tags.
    ///
    public init(action: String, @HTMLBuilder _ content: () -> HTMLConvertible) {
        attributes["type"] = ButtonType.button.rawValue
        attributes["onclick"] = action
        innerHTML = content().stringValue
    }

    /// Creates an empty button.
    ///
    /// - Parameters:
    ///   - content: The internal HTML inside of the `<button></button>` tags.
    ///
    public init(@HTMLBuilder _ content: () -> HTMLConvertible) {
        attributes["type"] = ButtonType.button.rawValue
        innerHTML = content().stringValue
    }
}

/// These extensions are modifiers for an ``Button`` element
/// and will return an ``Button`` element for continued use/updates.
///
public extension Button {
    /// Sets the button attribute: `autofocus`.
    ///
    /// - Parameters:
    ///   - value: Allows user to determine if ``autofocus`` should be added
    ///   based on another boolean.
    ///
    func autofocus(if value: Bool = true) -> Button {
        var copy = self

        if value {
            copy.attributes["autofocus"] = ""
        }

        return copy
    }

    /// Sets the button attribute: `disabled`.
    ///
    /// - Parameters:
    ///   - value: Allows user to determine if ``disabled`` should be added
    ///   based on another boolean.
    ///
    func disabled(if value: Bool = true) -> Button {
        var copy = self

        if value {
            copy.attributes["disabled"] = ""
        }

        return copy
    }

    /// Sets the button attribute: `form`.
    ///
    /// - Parameters:
    ///   - id: Id of the form in which the button belongs.
    ///
    func formId(_ id: String) -> Button {
        var copy = self
        copy.attributes["form"] = id
        return copy
    }

    /// Sets the button attribute: `formaction`.
    ///
    /// Only available for button type ``submit``
    ///
    /// - Parameters:
    ///   - url: URL to send the form data when submitted.
    ///
    func formAction(_ url: String) -> Button {
        var copy = self
        copy.attributes["formaction"] = url
        return copy
    }

    /// Sets the button attribute: `formenctype`.
    ///
    /// Only available for button type ``submit``
    ///
    /// - Parameters:
    ///   - type: Encoding type for the form data.
    ///
    func formEncodeType(_ type: FormEncodeType) -> Button {
        var copy = self
        copy.attributes["formenctype"] = type.rawValue
        return copy
    }

    /// Sets the button attribute: `formmethod`.
    ///
    /// Only available for button type ``submit``
    ///
    /// - Parameters:
    ///   - method: Method in which to send the form data.
    ///
    func formMethod(_ method: FormMethod) -> Button {
        var copy = self
        copy.attributes["formmethod"] = method.rawValue
        return copy
    }

    /// Sets the button attribute: `formnovalidate`.
    ///
    /// Only available for button type ``submit``
    ///
    /// - Parameters:
    ///   - value: Specifies if the form should be validated.
    ///
    func formNoValidate(_ value: Bool) -> Button {
        var copy = self

        if value {
            copy.attributes["formnovalidate"] = ""
        }

        return copy
    }

    /// Sets the button attribute: `formtarget`.
    ///
    /// Only available for button type ``submit``
    ///
    /// - Parameters:
    ///   - target: Target to display the response after submitting.
    ///
    func formTarget(_ target: Target) -> Button {
        var copy = self
        copy.attributes["formtarget"] = target.rawValue
        return copy
    }

    /// Sets the button attribute: `name`.
    ///
    /// - Parameters:
    ///   - name: Name of the button.
    ///
    func name(_ name: String) -> Button {
        var copy = self
        copy.attributes["name"] = name
        return copy
    }

    /// Sets the button attribute: `type`.
    ///
    /// - Parameters:
    ///   - type: Type of the button.
    ///
    func type(_ type: ButtonType) -> Button {
        var copy = self
        copy.attributes["type"] = type.rawValue
        return copy
    }

    /// Sets the button attribute: `value`.
    ///
    /// - Parameters:
    ///   - value: Initial value of the button.
    ///
    func value(_ value: String) -> Button {
        var copy = self
        copy.attributes["value"] = value
        return copy
    }
}

extension Button: HTMLConvertible {
    public var description: String {
        html
    }

    public var debugDescription: String {
        html
    }

    private var html: String {
        "<\(tag)\(attributesString)>\(innerHTML)</\(tag)>"
    }
}

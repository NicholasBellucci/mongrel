/// A ``Select`` element is used to create a drop-down list.
///
/// This element is most often used in a form to collect user input.
///
/// For more information about the ``<select>`` tag,
/// visit https://www.w3schools.com/tags/tag_select.asp
public struct Select: Attributable, EventListener {
    public var tag: String = "select"
    public var attributes: [String: String] = [:]
    public var styles: [String: String] = [:]

    private var innerHTML: String

    /// Creates a select element with an optional id and name.
    ///
    /// - Parameters:
    ///   - id: The id of the select element.
    ///   - name: The name of the select element.
    ///   - content: An ``HTMLBuilder`` that creates the elements
    ///   that make up this element.
    public init(id: String? = nil, name: String? = nil, @HTMLBuilder _ content: () -> HTMLConvertible) {
        attributes["id"] = id
        attributes["name"] = name
        innerHTML = content().stringValue
    }
}

/// These extensions are modifiers for an ``Select`` element
/// and will return an ``Select`` element for continued use/updates.
public extension Select {
    /// Adds a condition that controls whether the element
    /// will allow multiple values.
    ///
    /// - Parameters:
    ///   - value: A Boolean value that determines whether the ``multiple``
    ///   attribute should be added.
    func allowsMultipleValues(_ value: Bool) -> Select {
        var copy = self

        if value {
            copy.attributes["multiple"] = ""
        }

        return copy
    }

    /// Adds a condition that controls whether the element
    /// will be focused automatically on page load.
    ///
    /// - Parameters:
    ///   - value: A Boolean value that determines whether the ``autofocus``
    ///   attribute should be added.
    func autofocused(_ value: Bool) -> Select {
        var copy = self

        if value {
            copy.attributes["autofocus"] = ""
        }

        return copy
    }

    /// Adds a condition that controls whether the element
    /// will be disabled.
    ///
    /// - Parameters:
    ///   - value: A Boolean value that determines whether the ``disabled``
    ///   attribute should be added.
    func disabled(_ value: Bool) -> Select {
        var copy = self

        if value {
            copy.attributes["disabled"] = ""
        }

        return copy
    }

    /// Specifies which form the drop-down list belongs.
    ///
    /// - Parameters:
    ///   - id: The id of the form.
    func formId(_ id: String) -> Select {
        var copy = self
        copy.attributes["form"] = id
        return copy
    }

    /// Sets the name for the drop-down list.
    ///
    /// - Parameters:
    ///   - name: The name to use as the list's name.
    func name(_ name: String) -> Select {
        var copy = self
        copy.attributes["name"] = name
        return copy
    }

    /// Adds a condition that controls whether the element
    /// must have a selected value before submitting.
    ///
    /// - Parameters:
    ///   - value: A Boolean value that determines whether the ``disabled``
    ///   attribute should be added.
    func required(_ value: Bool) -> Select {
        var copy = self

        if value {
            copy.attributes["required"] = ""
        }

        return copy
    }

    /// Sets the number of visible options in a drop-down list.
    ///
    /// - Parameters:
    ///   - size: The size to be used as the list's size.
    func size(_ size: Int) -> Select {
        var copy = self
        copy.attributes["size"] = "\(size)"
        return copy
    }
}

extension Select: HTMLConvertible {
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

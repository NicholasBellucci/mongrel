import Foundation

/// The ``Link`` element links external resources.
///
/// For more information about the ``<link>`` tag,
/// visit https://www.w3schools.com/tags/tag_link.asp
public struct Link: Attributable {
    public var tag: String = "link"
    public var attributes: [String: String] = [:]
    public var styles: [String: String] = [:]

    /// Creates a link element with an href and a relationship.
    ///
    /// - Parameters:
    ///   - href: The location of the linked document.
    ///   - rel: The relationship between the current and linked document.
    public init(href: String, rel: String) {
        attributes["href"] = href
        attributes["rel"] = rel
    }
}

/// These extensions are modifiers for an ``Link`` element
/// and will return an ``Link`` element for continued use/updates.
public extension Link {
    /// Specifies how the element handles cross-origin requests.
    ///
    /// - Parameters:
    ///   - type: The type to be used as the link's cross-origin type.
    func crossorigin(_ type: CrossOriginType) -> Link {
        var copy = self
        copy.attributes["crossorigin"] = type.rawValue
        return copy
    }

    /// Sets the language of the text in the linked document.
    ///
    /// - Parameters:
    ///   - code: The code to use as the language code.
    ///   - country: The code to use as the country code.
    func hrefLanguage(_ code: LanguageCode, country: CountryCode? = nil) -> Link {
        var copy = self

        if let country = country {
            copy.attributes["hreflang"] = "\(code.rawValue)-\(country.rawValue)"
        } else {
            copy.attributes["hreflang"] = "\(code.rawValue)"
        }

        return copy
    }

    /// Allows a browser to check the fetched link to ensure that the file
    /// is never loaded if the source has been manipulated.
    ///
    /// - Parameters:
    ///   - integrity: The hash to be used as the link's integrity.
    func integrity(_ integrity: String) -> Link {
        var copy = self
        copy.attributes["integrity"] = integrity
        return copy
    }

    /// Specifies what device the linked document will be displayed.
    ///
    /// - Parameters:
    ///   - query: The query to use as the link's media/device query.
    func media(_ query: String) -> Link {
        var copy = self
        copy.attributes["media"] = query
        return copy
    }

    /// Specifies which referrer to use when fetching the resource.
    ///
    /// - Parameters:
    ///   - policy: The policy to use as the link's referrer policy.
    func referrerPolicy(_ policy: ReferrerPolicy) -> Link {
        var copy = self
        copy.attributes["referrerpolicy"] = policy.rawValue
        return copy
    }

    /// Sets the media type of the linked document.
    ///
    /// - Parameters:
    ///   - type: The type to use as the link's media type.
    func type(_ type: String) -> Link {
        var copy = self
        copy.attributes["type"] = type
        return copy
    }
}

public extension Link {
    /// Specifies a shortcut key to activate/focus an element.
    ///
    /// - Parameters:
    ///   - key: The key to be used as the element's access key.
    func accessKey(_ key: String) -> Link {
        var copy = self
        copy.attributes["accesskey"] = key
        return copy
    }

    /// Specifies whether the element is to have its spelling and
    /// grammar checked.
    ///
    /// - Parameters:
    ///   - value: A Boolean value that determines whether the ``spellcheck``
    ///   attribute should be added.
    func allowsSpellcheck(_ value: Bool) -> Link {
        var copy = self
        copy.attributes["spellcheck"] = "\(value)"
        return copy
    }

    /// Specifies one or more class names for an element.
    ///
    /// - Parameters:
    ///   - key: The name to be used as the element's class name.
    func `class`(_ name: String) -> Link {
        var copy = self
        copy.attributes["class"] = name
        return copy
    }

    /// Specifies whether the content of an element is editable.
    ///
    /// - Parameters:
    ///   - value: A Boolean value that determines whether the ``contenteditable``
    ///   attribute should be added.
    func contentEditable(_ value: Bool) -> Link {
        var copy = self
        copy.attributes["contenteditable"] = "\(value)"
        return copy
    }

    /// Specifies whether an element is draggable.
    ///
    /// - Parameters:
    ///   - value: A Boolean value that determines whether the ``contenteditable``
    ///   attribute should be added.
    func draggable(_ value: Bool) -> Link {
        var copy = self
        copy.attributes["draggable"] = "\(value)"
        return copy
    }

    /// Specifies whether an element is hidden.
    ///
    /// - Parameters:
    ///   - value: A Boolean value that determines whether the ``contenteditable``
    ///   attribute should be added.
    func hidden(_ value: Bool) -> Link {
        var copy = self

        if value {
            copy.attributes["hidden"] = ""
        }

        return copy
    }

    /// Sets a unique id for an element.
    ///
    /// - Parameters:
    ///   - id: The id to be used as the element's id.
    func id(_ id: String) -> Link {
        var copy = self
        copy.attributes["id"] = id
        return copy
    }

    /// Specifies the language of the element's content
    ///
    /// - Parameters:
    ///   - code: The code to use as the language code.
    ///   - country: The code to use as the country code.
    func language(_ code: LanguageCode, country: CountryCode? = nil) -> Link {
        var copy = self

        if let country = country {
            copy.attributes["lang"] = "\(code.rawValue)-\(country.rawValue)"
        } else {
            copy.attributes["lang"] = "\(code.rawValue)"
        }

        return copy
    }

    /// Adds margin to the element based on desired edges.
    ///
    /// - Parameters:
    ///   - edges: The edges in which to add margin.
    ///   - length: The amount and units of margin.
    func margin(_ edges: Edge.Margin..., length: Unit? = nil) -> Element {
        var copy = self

        edges.forEach {
            if let length = length, let value: CGFloat = length.associatedValue() {
                copy.styles[$0.rawValue] = "\(value)\(length.label)"
            }
        }

        return copy
    }

    /// Adds padding to the element based on desired edges.
    ///
    /// - Parameters:
    ///   - edges: The edges in which to add padding.
    ///   - length: The amount and units of padding.
    func padding(_ edges: Edge.Padding..., length: Unit? = nil) -> Element {
        var copy = self

        edges.forEach {
            if let length = length, let value: CGFloat = length.associatedValue() {
                copy.styles[$0.rawValue] = "\(value)\(length.label)"
            }
        }

        return copy
    }

    /// Adds one or more styles to the element.
    ///
    /// - Parameters:
    ///   - styles: The styles to be used as the element's styles.
    func styles(_ styles: CSSProperty...) -> Link {
        var copy = self

        styles
            .sorted()
            .forEach {
                switch $0 {
                case let .custom(key, value):
                    copy.styles[key] = "\(value)"
                default:
                    guard let value: String = $0.associatedValue() else { return }
                    copy.styles[$0.stringValue] = "\(value)"
                }
            }

        return copy
    }

    /// Specifies the tabbing order of an element.
    ///
    /// - Parameters:
    ///   - styles: The index to be used as the element's tab index.
    func tabIndex(_ index: Int) -> Link {
        var copy = self
        copy.attributes["tabindex"] = "\(index)"
        return copy
    }

    /// Specifies extra information about an element.
    ///
    /// - Parameters:
    ///   - styles: The title to be used as the element's title.
    func title(_ title: String) -> Link {
        var copy = self
        copy.attributes["title"] = title
        return copy
    }

    /// Specifies whether an element is translated.
    ///
    /// - Parameters:
    ///   - value: A Boolean value that determines whether the ``translate``
    ///   attribute should be added.
    func translated(_ value: Bool) -> Link {
        var copy = self
        copy.attributes["translate"] = value ? "yes" : "no"
        return copy
    }
}

extension Link: HTMLConvertible {
    public var description: String {
        html
    }

    public var debugDescription: String {
        html
    }

    private var html: String {
        "<\(tag)\(attributesString)>"
    }
}

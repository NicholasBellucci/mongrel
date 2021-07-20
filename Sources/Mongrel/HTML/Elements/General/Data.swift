/// The ``Data`` element is used to add a machine-readable
/// translation of a given content.
///
/// This element provides both a machine-readable value for
/// data processors and a human-readable value for rendering in a browser.
///
/// For more information, visit https://www.w3schools.com/tags/tag_data.asp
public struct Data: Attributable, EventListener {
    public var tag: String = "data"
    public var attributes: [String: String] = [:]
    public var styles: [String: String] = [:]

    private var innerHTML: String

    /// Creates a data element with a given value.
    ///
    /// - Parameters:
    ///   - value: The machine-readable translation of the content.
    ///   - content: The ``HTMLConvertible`` elements that will make up
    ///   the HTML inside of the `<data></data>` tags.
    public init(value: String, @HTMLBuilder _ content: () -> HTMLConvertible) {
        attributes["value"] = value
        innerHTML = content().stringValue
    }
}

extension Data: HTMLConvertible {
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

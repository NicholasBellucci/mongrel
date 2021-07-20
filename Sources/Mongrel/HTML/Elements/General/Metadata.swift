//
//  Metadata.swift
//  
//
//  Created by Nicholas Bellucci on 7/18/21.
//

public struct Metadata: Attributable, EventListener {
    public var tag: String = "meta"
    public var attributes: [String: String] = [:]
    public var styles: [String: String] = [:]

    public init(content: String) {
        attributes["content"] = content
    }
}

extension Metadata: HTMLConvertible {
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

public extension Metadata {
    func charset(_ charset: String) -> Metadata {
        var copy = self
        copy.attributes["charset"] = charset
        return copy
    }

    func httpEquiv(_ equiv: HTTPEquiv) -> Metadata {
        var copy = self
        copy.attributes["http-equiv"] = equiv.rawValue
        return copy
    }

    /// Sets the button's attribute: `name`.
    ///
    /// - Parameters:
    ///   - name: The name of the metadata.
    func name(_ name: MetadataName) -> Metadata {
        var copy = self
        copy.attributes["name"] = name.rawValue
        return copy
    }
}

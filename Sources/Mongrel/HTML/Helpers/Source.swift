//
//  Source.swift
//  
//
//  Created by Nicholas Bellucci on 7/18/21.
//

public struct Source: HTMLElement {
    public var attributes: [String: String] = [:]

    public init() { }
}

extension Source: HTML {
    public var description: String {
        html
    }

    public var debugDescription: String {
        html
    }

    private var html: String {
        "<source \(attributesString)>"
    }

    private var attributesString: String {
        attributes
            .map { attribute in "\(attribute.key)=\"\(attribute.value)\"" }
            .joined(separator: " ")
    }
}

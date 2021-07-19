//
//  Input.swift
//  
//
//  Created by Nicholas Bellucci on 7/18/21.
//

public struct Input: HTMLElement {
    public var attributes: [String: String] = [:]

    public init(type: InputType = .text) {
        attributes["type"] = type.rawValue
    }
}

extension Input: HTML {
    public var description: String {
        html
    }

    public var debugDescription: String {
        html
    }

    private var html: String {
        "<input \(attributesString)>"
    }

    private var attributesString: String {
        attributes
            .map { attribute in
                if attribute.value == "" {
                    return "\(attribute.key)"
                } else {
                    return "\(attribute.key)=\"\(attribute.value)\""
                }
            }
            .joined(separator: " ")
    }
}

//
//  Time.swift
//  
//
//  Created by Nicholas Bellucci on 7/19/21.
//

public struct Time: Element, Attributable,  EventListener {
    public var attributes: [String: String] = [:]

    public init(format: String? = nil) {
        if let format = format {
            attributes["datetime"] = format
        }
    }
}

extension Time: HTML {
    public var description: String {
        html
    }

    public var debugDescription: String {
        html
    }

    private var html: String {
        "<time \(attributesString)>"
    }
}

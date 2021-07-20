//
//  List.swift
//  
//
//  Created by Nicholas Bellucci on 7/18/21.
//

public struct List: Attributable, EventListener {
    public var tag: String
    public var attributes: [String: String] = [:]
    public var styles: [String: String] = [:]

    private var innerHTML: String

    public init(_ type: GenericListType, @HTMLBuilder _ content: () -> HTMLConvertible) {
        self.tag = type.rawValue
        innerHTML = content().stringValue
    }
}

extension List: HTMLConvertible {
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

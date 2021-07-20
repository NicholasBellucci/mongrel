//
//  Root.swift
//  
//
//  Created by Nicholas Bellucci on 7/19/21.
//

public struct Root: Attributable, EventListener {
    public var tag: String = "html"
    public var attributes: [String: String] = [:]
    public var styles: [String: String] = [:]

    private var innerHTML: String

    public init(language: LanguageCode = .en, country: CountryCode? = nil, @HTMLBuilder _ content: () -> HTMLConvertible) {
        if let country = country {
            attributes["lang"] = "\(language.rawValue)-\(country.rawValue)"
        } else {
            attributes["lang"] = "\(language.rawValue)"
        }

        innerHTML = content().stringValue
    }
}

extension Root: HTMLConvertible {
    public var description: String {
        html
    }

    public var debugDescription: String {
        html
    }

    private var html: String {
        """
        "<!-- This document has been autogenerated by Mongrel. -->"
        <!DOCTYPE html>
        <\(tag)\(attributesString)>\(innerHTML)</\(tag)>
        """
    }
}

//
//  main.swift
//  
//
//  Created by marko on 26.01.20.
//

import Foundation
import Publish
import PygmentsPublishPlugin

public extension Plugin {
    /// Fixing date formatter locale to `en_US` since all dates for posts are in `yyyy-MM-dd HH:mm`.
    static func usLocaleDateFormatter() -> Self {
        Plugin(name: "US Locale Date Formatter") { context in
            context.dateFormatter.locale = Locale(identifier: "en_US")
        }
    }
}

try HungryDev().publish(using: [
    .installPlugin(.usLocaleDateFormatter()),
    .installPlugin(.pygmentize()),
    .addMarkdownFiles(),
    .sortItems(by: \.date, order: .descending),
    .generateHTML(withTheme: .hungry),
    .generateSiteMap(),
    .copyFile(at: "Resources/CNAME")
])

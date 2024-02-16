//
//  Helpers.swift
//  MovieApp
//
//  Created by Thiago on 16/02/24.
//

import SwiftUI

struct ApiKey: EnvironmentKey {
    static var defaultValue: String = ""
}

extension EnvironmentValues {
    var apiKey: String {
        get {
            self[ApiKey.self]
        }
        set {
            self[ApiKey.self] = newValue
        }
    }
}

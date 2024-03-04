//
//  CaseIterable+DefaultFirst.swift
//  RecipeData
//
//  Created by Dominik Babic on 04.03.2024..
//

import Foundation

/// Conforming to this protocol will make the first enum case as default.
///
/// **Example**
/// ```
///  enum Direction: String {
///  case up
///  case down
///  case unknown
///  }
///  ```
///
///  If we receive a value not matched by an enum case (e.g. `left`), decoder will default to `.up`.
public protocol CaseIterableDefaultFirst: Decodable, CaseIterable, RawRepresentable
    where Self.RawValue: Decodable, Self.AllCases: BidirectionalCollection {}

extension CaseIterableDefaultFirst {
    public init(from decoder: Decoder) throws {
        self = try Self(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? Self.allCases.first!
    }
}

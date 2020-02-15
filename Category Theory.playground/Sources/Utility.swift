@_exported import Foundation

public func identity<A>(_ x: A) -> A {
  x
}

precedencegroup ForwardApplication {
  higherThan: ComparisonPrecedence
  associativity: left
}

infix operator |>: ForwardApplication

public func |> <A, B>(x: A, f: (A) -> B) -> B {
  return f(x)
}

precedencegroup ForwardComposition {
  higherThan: ForwardApplication
  associativity: right
}

infix operator ◦: ForwardComposition

public func ◦ <A, B, C>(_ f: @escaping (A) -> B, _ g: @escaping (B) -> C) -> ((A) -> C) {
  return { a in g(f(a)) }
}

public enum Bit: Comparable {
  public static func < (lhs: Bit, rhs: Bit) -> Bool {
    switch (lhs, rhs) {
    case (.zero, .one):
      return true
    default:
      return false
    }
  }
  
  case zero
  case one
}

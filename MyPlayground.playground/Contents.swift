//: ## Initial and Terminal objects
/*:
 Initial object in Category of Types: `Never`.
 
 Definition of unique morphism from `Never` to any other type:
 
 `Never -> A`
*/
func absurd<A>(_ never: Never) -> A {
  switch never {}
}
/*:
 Terminal object in Category of Types: `Void`.
 
 Definition of unique morphism from any other type to `Void`:
*/
func singleton<A>(_: A) -> Void {
  ()
}

//: Definition of morphisms `multiply` and `divide` in Category of `Double`s
func multiply(_ y: Double) -> (Double) -> Double {
  { x in  x * y }
}

func divide(_ y: Double) -> (Double) -> Double {
  { x in x / y }
}
//: Definition of two isomorphic morphisms
let multiplyByThree = multiply(3)
let divideByThree = divide(3)
/*:
 Requirement for two morphisms to be isomorphic:
 
 `g ◦ f == id`
 
 `f ◦ g == id`
 
 Proof that `multiplyByThree` and `divideByThree` are isomorphic
 */
let val: Double = 42
(val |> multiplyByThree ◦ divideByThree) == ( val |> identity)
(val |> divideByThree ◦ multiplyByThree) == ( val |> identity)
//: Definition of morphism `swap` for Category of Cartesian Products.
func swap<A, B>(_ x: (A, B)) -> (B, A) {
  (x.1, x.0)
}
//: Proof that `swap` is an Isomorphism

let pair: (Bool, Int) = (true, 42)
(pair |> swap ◦ swap) == (pair |> identity)

/*:
`Initial` object in a Category of Cartesian Products `(A 𝘅 B)` and `(B 𝘅 A)`.
*/
let initial1: (Bit, UInt8) = (.zero, 0)
let initial2: (UInt8, Bit) = (0, .zero)

//: Proof that `initial1` and `initial2` are unique up to unique isomorphism

let terminal1: (Bit, UInt8) = (.one, 255)
let terminal2: (UInt8, Bit) = (255, .one)


struct NonEmpty {
  var head: String
  var tail: [String]
  
  var arrayValue: [String] {
    [head] + tail
  }
  
  subscript(index: Int) -> String {
    get {
      index == 0 ? head : tail[index - 1]
    }
    
    set {
      if index == 0 {
        head = newValue
      }  else {
        tail[index - 1] = newValue
      }
    }
  }
}

let strings: [String] = []
var nonEmptyStrings = NonEmpty(head: "Hello", tail: ["World"])
nonEmptyStrings.arrayValue
nonEmptyStrings[0] = "Goodbye"
nonEmptyStrings.arrayValue

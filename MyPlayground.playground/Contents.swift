//: ## Category of Types
/*:
`Initial` object in a category of types - `Never`.
 
 Unique morphism from `Never` to any other type:
*/
func absurd<A>(_ never: Never) -> A {
  switch never {}
}

/*:
 `Terminal` object in a category of types - `Void`.
 
 Unique morphism from any other type to `Void`:
*/
func singleton<A>(_: A) -> Void {
  ()
}

//: ## Category of sets of `Bit` and `UInt8`


let initial1: (Bit, UInt8) = (.zero, 0)
let initial2: (UInt8, Bit) = (0, .zero)

let terminal1: (Bit, UInt8) = (.one, 255)
let terminal2: (UInt8, Bit) = (255, .one)

//: ## Isomorphism

func multiply(_ y: Double) -> (Double) -> Double {
  { x in  x * y }
}

func divide(_ y: Double) -> (Double) -> Double {
  { x in x / y }
}

//: Define two morphisms
let multiplyByThree = multiply(3)
let divideByThree = divide(3)

//: Prove that `multiplyByThree` and `divideByThree` are isomorphic
let val: Double = 42
(val |> multiplyByThree ◦ divideByThree) == ( val |> identity)
(val |> divideByThree ◦ multiplyByThree) == ( val |> identity)

//: Define morphism `swap` for Category of Cartesian Products.
func swap<A, B>(_ x: (A, B)) -> (B, A) {
  (x.1, x.0)
}

let pair: (Bit, UInt8) = (.zero, 42)

//: Prove that `swap` is an Isomorphism
(pair |> swap ◦ swap) == (pair |> identity)

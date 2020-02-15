//: ## Initial and Terminal Objects

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

//: Next Chapter: [Isomorphisms](@next)

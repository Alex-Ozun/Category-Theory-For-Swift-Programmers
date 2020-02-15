//: # Initial and Terminal Objects

//: ### Initial Objects
/*:
 * Callout(Definition):
 The **Initial Object** is the object that has one and only one morphism going to any object in the category.
 */

//: - Example: Initial object in the category of types is `Never`.

//: Let's define a morphism from `Never` to any other type: `(Never) -> A`

func fromInitial<A>(_ never: Never) -> A {
  switch never {}
}

/*: It is indeed a unique morphism `(Never) -> A`.
 
 We cannot come up with any other morphism of this shape. This proves that `Never` is the **Initial Object** in this category.
*/

//: ### Terminal Objects

/*:
* Callout(Definition):
 The **Terminal Object** is the object with one and only one morphism coming to it from any object in the category.
*/

//: - Example: Terminal object in the category of types is `Void`.
 
//: Let's define a morphism from any other type to `Void`: `(A) -> Void`

func toTerminal<A>(_: A) -> Void {
  ()
}

/*: It is indeed a unique morphism `(A) -> Void`.
 
 We cannot come up with any other morphism of this shape. This proves that `Void` is the **Terminal Object** in this category.
*/

/*:
 * Experiment:
 Let's try to prove that `Void` in not only **Terminal Object** in the category of types, but also it's **Initial Object**.
 Ultimately, we must to define a unique morphism `(Void) -> A`
*/

//: 1. We can define morphism `Void -> Int`:
func voidToInt(_: Void) -> Int {
  return 42
}
//: 2. We can also define morphism `(Void) -> Bool`:
func voidToBool(_: Void) -> Bool {
  return true
}
//: 3. But we can't define morphism `(Void) -> Never`:
func voidToNever(_: Void) -> Never {
  fatalError("can't create instance of Never")
}
//: 4. Subsequently, we can't define generic morphism `(Void) -> A`:
func voidToAny<A>(_: Void) -> A {
  fatalError("can't create instance of A")
}
/*:
 We can create morphism from `Void` to any other type, except for `Never`.
 
 This proves that `Void` is **not** a **Initial Object** in category of types.
*/

//: Next Chapter: [Isomorphisms](Isomorphisms)

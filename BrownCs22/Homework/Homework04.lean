import BrownCs22.Library.Tactics
import BrownCs22.Library.Defs
import Mathlib.Data.Real.Basic
import Mathlib.Tactic.Polyrith
import AutograderLib

-- don't change these lines
namespace HW4
open Dvd Function

/-

# Welcome to the Lean section of HW4!

Today we'll explore a little bit about functions and relations in Lean.

In particular, we'll think about the *logical form*
of some of the function and relation properties we saw,
like injectivity and surjectivity.


## Defining functions in Lean

Lean, believe it or not, is a programming language like Python, Pyret,
ReasonML, or whatever language you're familiar with.
(Of the Brown intro course languages, it's probably closest to ReasonML.)

This means we can define functions and evaluate them.
The below defines a function named `my_quadratic` that takes as input
an integer `x` and produces another integer.
-/

def my_quadratic (x : ℤ) : ℤ :=
  4*x^2 + 55*x - 10

#check my_quadratic

/-
We can evaluate it by using `#eval`.

Unlike many languages like Python, we don't need parentheses
if the argument is a single integer --
we *can* write `my_quadratic(12)`, but we don't need to.
If we want to evaluate it on a more complicated expression,
we do need parentheses around the argument.
-/

#eval my_quadratic 12
#eval my_quadratic (10 + 2)

/-

What makes Lean more exciting than these other languages?
Not only can we define functions, but we can state *properties*
of these functions, and *prove* that these properties hold.

How convenient: we just learned about a lot of function
and relation properties in class :)





A side note: in class, we said that functions and relations were
sets of ordered pairs, defined by their *graph*:
`f(x) = y` if and only if `(x, y) ∈ G(f)`.
But we also (in lecture 9) mentioned that it was a *choice* of ours
to take sets as the "primary" concept and to define functions and relations
in terms of sets. Lean, like most programming languages,
takes the opposite approach: functions are a "primary" concept, and
sets are defined in terms of functions.

Confusing? Don't worry about it too much: if we're interested in properties
of functions and relations, and in using these ideas, it doesn't really
matter how they're defined. It matters what they can do. And Lean functions
can do exactly the same things as our "sets of pairs" functions from class.




## Problems 1 and 2

We'll work with some pretty simple functions today.
Here's one, a *linear* function on the rational numbers, called `f`.

(We call `f` linear because its graph is a straight line, or equivalently,
because it doesn't multiply variables together.
`g x = x^2` would not be linear.)

-/

def f (x : ℚ) : ℚ := 11*x - 220

#eval f 50
#eval f (3/11)

/-

Let's prove that `f` is injective and surjective.

Some tactics to remember:

* `dsimp` unfolds definitions. You can `dsimp Injective`
  to expand what it means for `f` to be injective.
  (This is probably a good place to start!)
  You can `dsimp f` to change `f x` into `2*x + 6`.

* `linarith` will do basic arithmetic for you, using facts
  that appear in your hypotheses.
  In particular, `linarith` will reason about linear functions.
  It will often get confused, or fail to prove things,
  if it sees variables multiplied together.

-/

@[autograded 2]
theorem problem_1 : Injective f := by
  sorry
  done

@[autograded 2]
theorem problem_2 : Surjective f := by
  sorry
  done


/-

More idle thoughts. Are there any kinds of *programs* that we,
as computer scientists, might want to be injective or surjective?
Hash functions are a good example: which of these properties do we
want, in what contexts?

Imagine that you could *prove* your hash function didn't create collisions.
You (or your compiler) could use this fact to optimize other parts of your code.




## Problem 3

We can talk about relations in Lean as well.
Again, the relations we see will be mostly mathematical,
but there are lots of interesting relations on programming data types:
for instance, the relation `is_prefix_of` on strings or lists.

Here's a mathematical relation on `ℤ`: `R a b` holds when `a` divides `b`.
-/

def R (a b : ℤ) : Prop :=
  a ∣ b

/-

When we talked about relation properties in class, we described them
in terms of "arrows" going out of and into the domain and codomain.
But we also saw the logical form of these properties. Lean, unsurprisingly,
knows about these logical forms. To show that `R` is reflexive,
we'll need to prove `∀ x : ℤ, R x x`:
"every integer is related to itself by `R`."

Let's show that this relation is reflexive. Like before,
`dsimp Reflexive` and `dsimp R` might be useful!


-/

@[autograded 2]
theorem problem_3 : Reflexive R := by
  sorry
  done



end HW4

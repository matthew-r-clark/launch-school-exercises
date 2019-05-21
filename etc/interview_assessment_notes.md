# Notes from Nathan
* maybe explain more before I type, rather than as I type?
* speak with intent, not just whatever goes through your mind
* _*"what i'm going to try next is..."*_
* _*"take them along for the ride"*_ - Nathan Worden
* give the interviewer a good experience
* you are not in danger of overspeaking
* say what you're going to do before you do it <-- **emphasize this**


# Notes from Gelsey
* break out algorithm a little more
* always run your dang code, even if you're comfortable with it


# Notes from Self
* What is the most important problem to solve at the moment?
  * Or what's the next problem to solve?


# PEDAC
## Problem comprehension
* Is there anything you need to clarify?
* What edge cases do you need to be concerned about?

## Examples or test cases
* Were any test cases provided?
* What other cases do you need to test for?

## Data structure
* May need to think through algorithm first

## Algorithm
* Spend some time here!
* Work out **every** step.
* Don't code until you know exactly how it will work.

## Code **with intent**
* Code from your pseudocode!
* If the original plan won't work, go back to the pseudocode.

# Methods to Remember
## Enumerable
* #reduce/inject - uses a memo variable to perform an operation over every element in the collection and returns the resulting value.
  * (1..5).reduce {|memo, value| memo += value**2 } => 55
    - 1^2 + 2^2 + 3^2 + 4^2 + 5^2 => 55
  * (1..5).reduce {|memo, value| memo *= value } => 120 
    - 1 x 2 x 3 x 4 x 5 => 120 

* #group_by - creates new Hash with key/value pairs where the keys are comprised of the return value from the block and values are assigned based on which key it belongs.
  * (1..10).group_by {|item| item.odd?}
 => {true=>[1, 3, 5, 7, 9], false=>[2, 4, 6, 8, 10]}
  * (1..10).group_by {|item| item.odd? ? :odd : :even}
 => {:odd=>[1, 3, 5, 7, 9], :even=>[2, 4, 6, 8, 10]} 

* #any? - returns true if ANY element in collection evaluates to true.

* #none? - returns true if NONE of the elements in collection evaluates to true.

* #all? - returns true  if ALL elements in collection evaluate to true.

* #one? - returns true if ONLY ONE element in collection evaluates to true.

## Array

## Hash

## String
* #count
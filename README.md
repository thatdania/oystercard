# Oystercard challenge


## oystercard [![Build Status](https://travis-ci.org/thatdania/oystercard.svg?branch=master)](https://travis-ci.org/thatdania/oystercard) [![Coverage Status](https://coveralls.io/repos/github/thatdania/oystercard/badge.svg?branch=master)](https://coveralls.io/github/thatdania/oystercard?branch=master)

### Approach

In my journey of creating an Oyster-card, I had first designed and created Domain Models to specify what is the focus of each function the oyster card has. Whilst pairing with three amazing coders, we have split the methods using the Single Responsibility Principle along with the classes (The Journey, The Oystercard, the Station and the Journey Log). Each method
should have three lines of less as we used delegation, for different function.

The code should be clean and easy to read although it's a lot to intake.
Tribute to my great pair partners to help me finish my first challenge.
Although, we finished, I believe I would have to do this process multiple times for it to sink in.

### Domain Models

| Object           | Messages      | Tests                   |
|:----------------:|:-------------:|:-----------------------:|
| card             | want money    | balance is 0 by default |
| card             | add money     |  
| card             | max limit     |  £ 90                   |
| fare             | dedcuted      |  decducted from baalnce |
| entry station    | touch in      | log entry station       |
| exit station     | touch out     | log exit station        |
| journey          | amount        | has a minimum amount    |
| journey          | pay           | when its complete       |
| log              | travelled     | log of travel from      |
| trips            | see           | log of previous trips   |
| zone             | station       | see a zone for station  |
| penalty charge   | deduct        | if fail to touch in/out |
| fare             | have          | the correct fare        |


### Sample Issue Comments:

NameError : Uninitialized constant Oystercard
File path: ./spec/oystercard_spec.rb
Line number: 3
>>>>>>> 340bcf2f28cc9631bb32e24d265b4c780710e6a3

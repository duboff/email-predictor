Email Predictor
===============
The rules for email prediction are outlined in [RULES.md](RULES.md).
# Idea
The goal of the project was to write a simple system to predict email addresses from the name and domain of the company. While the task itself is relatively straightforward my approach was to write code as if for a real project with only minor simplifications. I tried to adhere to the following:
* Single purpose classes: separating functionality into separate objects that talk to each other. This would simplify changing the system later. For example adding another email pattern is trivial. It also wouldn't be to hard to generate physical mailing addresses using this system.
* Design patterns: in particular I used Strategy Pattern for the email encoder and something similar to it for decoder.
* Isolating dependencies: each class is created with minimum number of dependecies.
 
## Usage
To generate predictions for the predefined list set in the problem description run the following command in the Terminal (assuming ruby is installed and you are in the correct folder):
```
$ ruby main.rb
```
To generate custom new predictions first require the files in irb (the load file is shortcut for other system pieces):
```
require './load.rb'
```
Start a new predictor:
```
predictor = Predictor.new(AVAILABLE_PATTERNS)
```
Additional patterns can potentially be added at this point if required (e.g. first_name@domain.com)

Seed the database:
```
predictor.seed(SEED)
```
Database can be seeded with any hash containing names and emails. Also names and emails can be added in the constants.rb file.

Generate predictions:
```
predictor.predict('James Dean','alphasights.com')
```
Predictions will be generated in an array. Currently the code does not discriminate between available patterns. In some cases more than one pattern will be generated. If you require only correct predictions (eg. you don't want to send an email to the address that might be wrong) use
```
predictor.predict_correct_only('James Dean','alphasights.com')
```

These functions can also be put in main.rb.
## Installation
From the Terminal:
```
$ git clone git@github.com:duboff/email-predictor.git
$ cd email-predictor/
$ bundle
```
This assumes you have command line tools installed.
## Testing
To run the specs:
```
$ rspec
```

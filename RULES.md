# Predicting Email Addresses
At AlphaSights, we often want to contact advisors even when we don't know know their email address.

This presents us with the challenge of having to predict what their actual email address will be.

To help with this process, we have the following information available:

1. The advisor's name.
2. The domain name of the company he works for.
3. The names and emails of other advisors in our database that work for the same company (and domain name).

The last bit of information is particularly helpful as we can use it to figure out what pattern a company uses when assigning its email addresses.

Once we understand their pattern, we can then make a prediction on what the advisor's email will be.

As an example, let's say we have an advisor named "John Ferguson" who we know works for "alphasights.com"

For this exercise, there are four potential patterns this advisor's email could come in (or none at all):

1. `first_name_dot_last_name`: "john.ferguson@alphasights.com"
2. `first_name_dot_last_initial`: "john.f@alphasights.com"
3. `first_initial_dot_last_name`: "j.ferguson@alphasights.com"
4. `first_initial_dot_last_initial`: "j.f@alphasights.com"

So, if we have several other people in our database that work for "alphasights.com", we can use their info to predict John Ferguson's email address.

## The Challenge
Given the following sample dataset:

```
{
  "John Ferguson" => "john.ferguson@alphasights.com",
  "Damon Aw" => "damon.aw@alphasights.com",
  "Linda Li" => "linda.li@alphasights.com",
  "Larry Page" => "larry.p@google.com",
  "Sergey Brin" => "s.brin@google.com",
  "Steve Jobs" => "s.j@apple.com"
}
```

Predict the email addresses for the following advisors:

1. "Peter Wong", "alphasights.com"
2. "Craig Silverstein", "google.com"
3. "Steve Wozniak", "apple.com"
4. "Barack Obama", "whitehouse.gov"

## Things to Consider

* Remember that you only have to address four potential patterns:

    1. first_name_dot_last_name
    2. first_name_dot_last_initial
    3. first_initial_dot_last_name
    4. first_initial_dot_last_initial

* It is possible that no prediction can accurately be made. The code should be able
to respond appropriately to such a situation.

* You can write the solution in whatever language you like. Keep in mind that we
use Ruby as the primary language for all of our projects. This does not mean that
you have to write the solution in Ruby. However, if you have several potential languages you could
use to solve the problem, it would be best to select one that is most similar
to Ruby. As said before, the solution does not have to be in Ruby. It's best to write
the solution well in a language you know than to do so poorly in Ruby.

* Organize and structure the code however you like. How well designed the code is
will be relevant for us when evaluating your work.

* We value code that is simple and clear. Oftentimes, the less complex solution is preferred, as long as it doesn't compromise on clarity.

* It is best to have tests that check the expected behavior against the code's
actual output. Much of the test cases can be inferred from the emails you expect
the prediction to return.

* Please provide us with instructions on how to get the code to run.

* If you have any questions or need anything clarified, please don't hesitate to ask.


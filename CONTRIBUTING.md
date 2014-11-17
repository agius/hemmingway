# Contributing

Thanks for considering contributing to Hemmingway! Here's how to get set up locally:

1. fork the repo

2. run the specs with rspec - we won't take any pull requests if specs are failing :)

3. to run a local server, use `rake server`
   
   this will use the dummy application in the `/spec/dummy` folder. 
   
   Alternative, use your own app and your local fork of Hemmingway. 
   
   `gem 'hemmingway', path: '/path/to/local/hemmingway'`

4. add a spec for your changes. Refactoring and documentation changes do not require new specs, but bugfixes and new features definitely do

5. make all specs pass

6. push your fork and open a pull request. please be sure to let us know what changes you made

7. we will try to accept or comment on your pull request within three business days. we may suggest changes or improvements - we hate to dump more work on someone after they've gone through all this trouble, but defensive and clean code are a top priority

## Suggestions

  * use Rails idioms and helpers
  * include tests that fail without your code, and pass with it
  * update the documentation, the surrounding one, examples elsewhere, guides, whatever is affected by your contribution

## Style

In general, follow the syntax used in the existing code. 2 spaces, no tabs. Sane whitespace, no trailing whitespace. Any big questions, check out the [AirBnB Ruby Style Guide](https://github.com/airbnb/ruby) -- we don't adhere strictly, but you won't go wrong abiding by it.

## Specs specs specs!

We're pretty serious about specs. :sparkling_heart:
# BankOCR Kata

This repository provides a solution for BankOCR kata.

[![Build status](https://travis-ci.org/solojavier/BankOCR.svg)](https://travis-ci.org/solojavier/BankOCR)

## What is it about?

* Description of the problem can be found here: http://code.joejag.com/coding-dojo-bank-ocr/
* Current implementation covers the first 3 use cases.

## How to run?

Use the following commands:

```
gem install backocr
bankocr ./bin/input.in ./bin/output
```

* It will generate a file under /bin directory with results
* If you want to modify input edit file /bin/input.in

## Tests

To run test use the following commands:

```
gem install bundler
bundle install
bundle exec rspec spec
```

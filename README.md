# BankOCR Kata

This repository provides a solution for BankOCR kata.

[![Build status](https://travis-ci.org/solojavier/BankOCR.svg)](https://travis-ci.org/solojavier/BankOCR)

## What is it about?

* Description of the problem can be found here: http://code.joejag.com/coding-dojo-bank-ocr/
* Current implementation covers the first 3 use cases.

## How to install

```
gem install backocr
```

## How to run?

* You can download a sample input file from here: https://github.com/solojavier/BankOCR/raw/master/bin/input.in
* To process input file and generate a report use the following command:

```
bankocr process input_path output_path
```

## Tests

To run test use the following commands:

```
gem install bundler
bundle install
bundle exec rspec spec
```

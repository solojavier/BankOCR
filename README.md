# BankOCR Kata

This repository provides a solution for BankOCR kata.

[![Build status](https://travis-ci.org/solojavier/BankOCR.svg)](https://travis-ci.org/solojavier/BankOCR)

## What is it about?

Description of the problem can be found here: http://code.joejag.com/coding-dojo-bank-ocr/

## How to run?

Use the following command:

```
ruby bin/bank_ocr_kata.rb
```

* It will generate a file under /bin/output directory with results
* If you want to modify input edit file /bin/ocr_input.in

## Why?

This is an programming kata, not meant to be used in production.

## How is it solved?

This program solves the kata using a functional approach.

The following methods are provided:

* **parse_file**: Reads a text file with account numbers in OCR format, it returns an array of account numbers
* **validate_accounts**: Receives an array of account numbers and returns a map with validation info
* **generate_report**: Receives an output path and a map with accounts information and generates a file report

# BankOCR Kata

This repository provides a solution for BankOCR kata.

# What is it about?

Description of the problem can be found here: http://code.joejag.com/coding-dojo-bank-ocr/

# Why?

This is an programming kata, not meant to be used in production.

# How is it solved?

This program solves the kata using a functional approach.

The following methods are provided:

* **parse_file**: Reads a text file with account numbers in OCR format, it returns an array of account numbers
* **validate_accounts**: Receives an array of account numbers and returns a map with validation info
* **generate_report**: Receives an output path and a map with accounts information and generates a file report

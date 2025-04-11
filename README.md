# Steep bug report

Bug: When running `steep` from within a directory that contains curly braces in its name, it fails to find files to type check.

Reproduction Steps:
In this repo, there are two identical directories named `foo` and `{{foo}}`, each containing a `lib` folder with an example `hello.rb` file that has a single type error, which was taken from the [Getting started with Steep in 5 minutes](https://github.com/soutaro/steep/blob/master/guides/src/getting-started/getting-started.md) page. Running `steep check` from within the `foo` directory successfully finds the type error, while running it from within the `{{foo}}` directory fails to find any files to type check.

```bash
➜ cd foo && bundle exec steep check
# Type checking files:

F

lib/hello.rb:4:39: [error] Cannot pass a value of type `::String` as an argument of type `::Symbol`
│   ::String <: ::Symbol
│     ::Object <: ::Symbol
│       ::BasicObject <: ::Symbol
│
│ Diagnostic ID: Ruby::ArgumentTypeMismatch
│
└ puts "Hello! The price is #{currencies[country]}100. 💸"
                                         ~~~~~~~

Detected 1 problem from 1 file
```

```bash
➜ cd \{\{foo\}\} && bundle exec steep check

# Type checking files:



No type error detected. 🧉
```

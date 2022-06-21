# Assignment: Modern C++ Programming

In this assignment, you will develop a modern C++ project to merge two JSON files (DOC and PATCH). This assignment gives you a glimpse of the development environment hence these are the skills we want to see.

## Environment
Below is the C++ development environment we use:

* A Debian-based Linux distro (Ubuntu)
* `C++17` compiler (g++)
* `CMake` for build automation
* `gtest` for unit testing
* `git` for the version control

In this assignment, we want you to use Boost::JSON library to parse JSON documents. Find more information [here](https://github.com/boostorg/json) about the library.

We also use Docker containers to standardize our development environment. A `Dockerfile` that set up the environment above is provided in the repository. It is very much recommended to develop inside the container using `vscode`. You can use [remote containers](https://code.visualstudio.com/docs/remote/containers-tutorial) extension.

## Task

You will implement a `C++` library that implements functions to read and merge two JSON files according to the specification given in the following. Your library shall have a function to write as a file. In order to be succesful, you need to show a proper `C++` development workflow that includes automatic builds, testing, and version control.

### JSON Merge Operation

A JSON merge patch document (shortly Patch) describes changes to be made to a target JSON document (shortly Target) using a syntax that closely mimics the document being modified. Recipients of a merge patch document determine the exact set of changes being requested by comparing the content of the provided patch against the current content of the target document. Check the standard documentation [here](https://www.rfc-editor.org/rfc/rfc7396.html).

If the provided merge patch contains members that do not appear within the Target, those members are added.  If the Target does contain the member, the value is replaced. Null values in the merge patch are given special meaning to indicate the removal of existing values in the Target.

Here is an example of merging operation. Given the following target JSON document:
```json
{
  "title": "Goodbye!",
  "author" : {
    "givenName" : "John",
    "familyName" : "Doe"
  },
  "tags":[ "example", "sample" ],
  "content": "This will be unchanged"
}
```

A user wishing to change the value of the "title" member from "Goodbye!" to the value "Hello!", add a new "phoneNumber" member, remove the "familyName" member from the "author" object, and replace the "tags" array so that it doesn't include the word "sample" would send the patch document:
```json
{
  "title": "Hello!",
  "phoneNumber": "+01-123-456-7890",
  "author": {
    "familyName": null 
  },
  "tags": [ "example" ]
}
```

The resulting JSON document would be:
```json
{
  "title": "Hello!",
  "author" : {
    "givenName" : "John"
  },
  "tags": [ "example" ],
  "content": "This will be unchanged",
  "phoneNumber": "+01-123-456-7890"
}
```

### Steps

* Clone this repository 
* Run `make` in the project directory. You would see one (dummy) test passes, the other fails as you didn't implement the desired functionality yet.
* Implement the desired functionality in `include/bouncmpe/jsonmerge.hpp` and `src/jsonmerge.cpp` to:
    1. Read JSON files from the filesystem
    2. Merge JSON documents as explained
    3. Write the result as a JSON file
* Write more unit tests in `tests/jsonmerge.test.cpp` using `gtest`.
* Show us that you can develop high-quality C++ software.
* Write what can be done for a better quality development in `TODO.md`. This is an open ended question.
* Push your code back to your repo frquently as you develop.

### Evaluation Criteria

0. Correctness
1. Source code quality
2. Test code quality

## General Suggestions

Here is a few tips: 
* Clean code and apply industry-best practices consistently. This is very important for us who develop safety-critical applications.
* Do not try to optimize early or aggressively. Readable and maintainable code is much more important than 1% of speed improvements.
* Use STL functions whenever appropriate before re-inventing the wheel. Think twice before adding a new function. More code is not necessarily better.
* Commit your code in meaningful units. Use concise yet descriptive messages. Hence we can read your commit history easily.
* You may not have used some aformentioned tools and libraries (doctest and Boost.JSON) before. This is normal and won't jeopardize your application. Browse in their documentation and find corresponding info.
* There is a example set of JSON documents in `data` directory. You can write more if you use them in your tests.



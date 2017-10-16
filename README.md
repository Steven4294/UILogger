# UILogger

UILogger will log all elements that are added to the screen to the console. 

# Installation

Simply drag `UILogger/` into your project. Import `UILogger+UIViewController.h` into your `ViewController.h`

# How to use

`UILogger` is a category on `ViewController`, so simply call in `viewDidLoad:` 
```
 [myViewController logElementsThatWillAppear];
```

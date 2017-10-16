# UILogger

UILogger will log all elements that are added to the screen to the console. 

# Installation

Simply drag `UILogger/` into your project. Import `UILogger+UIViewController.h` into your `ViewController.h`

# How to use

`UILogger` is a category on `ViewController`, so simply call in `viewDidLoad:` and let `UILogger` log all the elements 
```
 [myViewController logElementsThatWillAppear];
```

Included is an example application using `UILogger`

# output

> added subview:
>   class: UIView
>   frame: {{0, 0}, {375, 667}}
>   id: 0x7fde13c014d0
>   bg-color:   #FFFFFF

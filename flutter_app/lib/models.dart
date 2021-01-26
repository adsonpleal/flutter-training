class Animal {}

class Mammal extends Animal {}

mixin Walker {
  var steps = 0;

  int walk() => ++steps;
}

class Lion extends Mammal with Walker {}

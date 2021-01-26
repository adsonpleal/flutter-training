class Animal {
  var position = 0;
}

class Mammal extends Animal {}

mixin Walker on Animal {
  int walk() => ++position;
}

class Fish extends Animal {}

mixin Swimmer on Animal {
  int swim() => position += 2;
}

class Lion extends Mammal with Walker {}

class Shark extends Fish with Swimmer {}

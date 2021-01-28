class Animal {
  var position = 0;
  var speed = 1;
}

class Mammal extends Animal {}

mixin Walker on Animal {
  int walk() => position += speed;
}

class Fish extends Animal {}

mixin Swimmer on Animal {
  int swim() => position += 2;
}

class Lion extends Mammal with Walker {
  Lion({speed = 1}) {
    this.speed = speed;
  }
}

class Shark extends Fish with Swimmer {}

class Dog extends Mammal with Walker {}

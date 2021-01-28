abstract class Animal {
  var position = 0;
  final int speed;

  Animal(this.speed);
}

class Bird extends Animal {
  Bird(int speed) : super(speed);
}

class Mammal extends Animal {
  Mammal(int speed) : super(speed);
}

mixin Walker on Animal {
  int walk() => position += speed;
}

class Fish extends Animal {
  Fish(int speed) : super(speed);
}

mixin Swimmer on Animal {
  int swim() => position += speed;
}

class Lion extends Mammal with Walker {
  Lion({speed = 1}) : super(speed);
}

class Shark extends Fish with Swimmer {
  Shark({int speed = 2}) : super(speed);
}

class Duck extends Bird with Walker, Swimmer {
  Duck({int speed}) : super(speed);
}

class Dog extends Mammal with Walker {
  Dog({int speed = 1}) : super(speed);
}

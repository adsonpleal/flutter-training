import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/models.dart';

void main() {
  test('Lion should be mammal and should walk', () {
    final lion = Lion();

    expect(lion.walk(), 1);
    expect(lion.walk(), 2);
    expect(lion.walk(), 3);
    expect(lion, isA<Mammal>());
    expect(lion, isA<Animal>());
  });

  test('Dog should be mammal and should walk', () {
    final dog = Dog();

    expect(dog.walk(), 1);
    expect(dog.walk(), 2);
    expect(dog.walk(), 3);
    expect(dog, isA<Mammal>());
    expect(dog, isA<Animal>());
  });

  test('Lion can have a different speed', () {
    final lion = Lion(speed: 3);

    expect(lion.walk(), 3);
    expect(lion.walk(), 6);
    expect(lion.walk(), 9);
  });

  test('Shark should be fish and should swim', () {
    final shark = Shark();

    expect(shark.swim(), 2);
    expect(shark.swim(), 4);
    expect(shark.swim(), 6);
    expect(shark, isA<Fish>());
    expect(shark, isA<Animal>());
  });

  test('Shark can have a different speed', () {
    final shark = Shark(speed: 3);

    expect(shark.swim(), 3);
    expect(shark.swim(), 6);
    expect(shark.swim(), 9);
  });

  test('Duck can swim and walk', () {
    final duck = Duck(speed: 3);

    expect(duck.swim(), 3);
    expect(duck.walk(), 6);
    expect(duck, isA<Bird>());
    expect(duck, isA<Animal>());
  });

    test('Duck can swim and walk', () {
    final duck = Duck(speedWalk: 3, speedSwim: 6);

    expect(duck.swim(), 6);
    expect(duck.walk(), 9);
    expect(duck, isA<Bird>());
    expect(duck, isA<Animal>());
  });
}



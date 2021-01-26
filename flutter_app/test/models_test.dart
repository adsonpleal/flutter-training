

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

  test('Shark should be fish and should swim', () {
    final shark = Shark();

    expect(shark.swim(), 1);
    expect(shark.swim(), 2);
    expect(shark.swim(), 3);
    expect(shark, isA<Fish>());
    expect(shark, isA<Animal>());
  });
}

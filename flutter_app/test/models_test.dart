

import 'package:flutter_test/flutter_test.dart';

void main() {

  test('Lion should be mammal and should walk', () {
    final lion = Lion();

    expect(lion.walk(), 1);
    expect(lion, isA<Mammal>());
    expect(lion, isA<Animal>());
  });
}


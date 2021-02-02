import 'package:flutter_test/flutter_test.dart';

void main() {
  test('processOrders should return a stream of', () {
    final Stream<Order> orders = Stream.fromIterable([Order()]);
    final Stream<Burger> burguer = processOrders(orders);

    expectLater(burguer, emitsInOrder([isA<Burger>()]));
  });
}

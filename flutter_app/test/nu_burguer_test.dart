import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/nu_burguer.dart';

void main() {
  test('processOrders should return a stream of burgers', () {
    final Stream<Order> orders = Stream.fromIterable([Order()]);
    final Stream<Burger> burguer = processOrders(orders);

    expectLater(burguer, emitsInOrder([isA<Burger>()]));
  });

  test('processOrders should return a stream of burgers with one burger per order', () {
    final Stream<Order> orders = Stream.fromIterable([Order(), Order()]);
    final Stream<Burger> burguer = processOrders(orders);

    expectLater(burguer, emitsInOrder([isA<Burger>(), isA<Burger>()]));
  });

}

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/nu_burguer.dart';

void main() {
  test('processOrders should return a stream of burgers', () {
    final Stream<Order> orders = Stream.fromIterable([Order()]);
    final Stream<Burger> burguer = processOrders(orders);

    expectLater(burguer, emitsInOrder([isA<Burger>()]));
  });

  test(
      'processOrders should return a stream of burgers with one burger per order',
      () {
    final Stream<Order> orders = Stream.fromIterable([Order(), Order()]);
    final Stream<Burger> burguer = processOrders(orders);

    expectLater(burguer, emitsInOrder([isA<Burger>(), isA<Burger>()]));
  });

  test('processOrders should return a stream of burgers with different types',
      () {
    final Stream<Order> orders = Stream.fromIterable([
      Order(burgerType: BurgerType.future),
      Order(burgerType: BurgerType.meat),
    ]);

    final Stream<Burger> burgers = processOrders(orders);

    expectLater(
        burgers,
        emitsInOrder([
          Burger(type: BurgerType.future),
          Burger(type: BurgerType.meat),
        ]));
  });
}

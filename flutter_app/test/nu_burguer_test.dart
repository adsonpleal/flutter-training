import 'package:fake_async/fake_async.dart';
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
      Order(
          burgerMeatType: MeatType.future, burgerBreadType: BreadType.italian),
      Order(burgerMeatType: MeatType.meat, burgerBreadType: BreadType.brioche),
    ]);

    final Stream<Burger> burgers = processOrders(orders);

    expectLater(
        burgers,
        emitsInOrder([
          Burger(meatType: MeatType.future, breadType: BreadType.italian),
          Burger(meatType: MeatType.meat, breadType: BreadType.brioche),
        ]));
  });

  test('italian bread should take 2 seconds', () {
    fakeAsync((async) {
      cutBread(burgerBreadType: BreadType.italian)
          .then(expectAsync1((_) {}, count: 1));
      async.elapse(Duration(seconds: 2));
    });
  });
}

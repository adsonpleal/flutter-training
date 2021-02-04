import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/nu_burguer.dart';

void main() {
  test('process time should take meat time', () {
    fakeAsync((async) {
      final Stream<Order> orders = Stream.fromIterable([
        Order(
          burgerMeatType: MeatType.meat,
          burgerBreadType: BreadType.italian,
        )
      ]);
      final Stream<Burger> burguer = processOrders(orders);

      burguer.listen(expectAsync1((burguer) {
        expect(
          burguer,
          equals(Burger(
            meatType: MeatType.meat,
            breadType: BreadType.italian,
          )),
        );
      }, count: 1));

      async.elapse(Duration(seconds: MeatType.meat.cookTime));
    });
  });
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

  test('brioche bread should take 4 seconds', () {
    fakeAsync((async) {
      cutBread(burgerBreadType: BreadType.brioche)
          .then(expectAsync1((_) {}, count: 0));
      async.elapse(Duration(seconds: 3));
    });

    fakeAsync((async) {
      cutBread(burgerBreadType: BreadType.brioche)
          .then(expectAsync1((_) {}, count: 1));
      async.elapse(Duration(seconds: 4));
    });
  });

  test('future meat should take 60 seconds', () {
    fakeAsync((async) {
      cookMeat(MeatType.future).then(expectAsync1((_) {}, count: 0));
      async.elapse(Duration(seconds: 20));
    });

    fakeAsync((async) {
      cookMeat(MeatType.future).then(expectAsync1((_) {}, count: 1));
      async.elapse(Duration(seconds: 60));
    });
  });

  test('meat meat should take 90 seconds', () {
    fakeAsync((async) {
      cookMeat(MeatType.meat).then(expectAsync1((_) {}, count: 0));
      async.elapse(Duration(seconds: 60));
    });

    fakeAsync((async) {
      cookMeat(MeatType.meat).then(expectAsync1((_) {}, count: 1));
      async.elapse(Duration(seconds: 90));
    });
  });
}

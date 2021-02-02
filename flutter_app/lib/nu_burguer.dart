import 'package:equatable/equatable.dart';

class Order {
  final BurgerType burgerType;

  Order({this.burgerType});
}

class Burger extends Equatable {
  BurgerType type;

  Burger({this.type});

  @override
  List<Object> get props => [type];
}

enum BurgerType { future, meat }

Stream<Burger> processOrders(Stream<Order> orders) async* {
  await for (final order in orders) {
    yield Burger(type: order.burgerType);
  }
}

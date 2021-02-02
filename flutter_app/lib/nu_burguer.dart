import 'package:equatable/equatable.dart';

class Order {
  final MeatType burgerMeatType;
  final BreadType burgerBreadType;

  Order({this.burgerMeatType, this.burgerBreadType});
}

class Burger extends Equatable {
  final MeatType meatType;
  final BreadType breadType;

  Burger({this.meatType, this.breadType});

  @override
  List<Object> get props => [meatType, breadType];
}

enum MeatType { future, meat }

enum BreadType { brioche, italian }

Stream<Burger> processOrders(Stream<Order> orders) async* {
  await for (final order in orders) {
    yield Burger(meatType: order.burgerMeatType, breadType: order.burgerBreadType);
  }
}

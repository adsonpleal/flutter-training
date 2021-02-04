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

extension MeatTypeCookTime on MeatType {
  int get cookTime {
    final time = {
      MeatType.future: 60,
      MeatType.meat: 90,
    }[this];
    if (time == null) throw 'Invalid type: $this';
    return time;
  }
}

extension on BreadType {
  int get cutTime {
    switch (this) {
      case BreadType.italian:
        return 2;
      case BreadType.brioche:
        return 4;
      default:
        throw 'Invalid type: $this';
    }
  }
}

Stream<Burger> processOrders(Stream<Order> orders) async* {
  await for (final order in orders) {
    final cookedMeat = cookMeat(order.burgerMeatType);
    final cuttedBread = cutBread(burgerBreadType: order.burgerBreadType);
    yield Burger(
      meatType: await cookedMeat,
      breadType: await cuttedBread,
    );
  }
}

Future<BreadType> cutBread({BreadType burgerBreadType}) async {
  await Future.delayed(Duration(seconds: burgerBreadType.cutTime));
  return burgerBreadType;
}

Future<MeatType> cookMeat(MeatType type) async {
  await Future.delayed(Duration(seconds: type.cookTime));
  return type;
}

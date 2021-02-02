class Order {}

class Burger {}

Stream<Burger> processOrders(Stream<Order> orders) async* {
  await for (final _ in orders) {
    yield Burger();
  }
}

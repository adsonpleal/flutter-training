class Order {}
class Burger {}

Stream<Burger> processOrders(Stream<Order> orders) {
  return Stream.value(Burger());
}

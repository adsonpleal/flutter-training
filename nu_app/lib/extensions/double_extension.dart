extension DoubleAsDisplayString on double {
  String get asDisplayString =>
      truncateToDouble() == this ? toStringAsFixed(0) : this.toString();
}

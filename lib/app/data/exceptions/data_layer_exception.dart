class DataLayerException implements Exception {
  String cause;

  DataLayerException({required this.cause});

  @override
  String toString() {
    return cause;
  }
}

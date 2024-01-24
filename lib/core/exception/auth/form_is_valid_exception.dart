class FormIsValidException implements Exception {
  final String message;

  FormIsValidException(
    this.message
  );

  @override
  String toString() {
    // TODO: implement toString
    return message;
  }
}
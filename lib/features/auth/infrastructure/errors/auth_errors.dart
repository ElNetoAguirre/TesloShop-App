class ConnectionTimeout implements Exception {}

class InvalidToken implements Exception {}

class WrongCredentials implements Exception {}

class CustomeError implements Exception {
  final String message;
  // final int errorCode;

  CustomeError(this.message);
}

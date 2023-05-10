class UnauthorizedException implements Exception {
  final String message;

  UnauthorizedException({required this.message});
}

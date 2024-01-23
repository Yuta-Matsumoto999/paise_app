class AuthResponseModel {
  final bool isAuth;
  final String? message;

  AuthResponseModel({
    required this.isAuth,
    this.message
  });

  factory AuthResponseModel.fromResponse(bool isAuth, String? message) {
    return AuthResponseModel(
      isAuth: isAuth,
      message: message
    );
  }
}
abstract class AuthLocalDataSource {
  DateTime? getLastActivity();

  String getLoginEmail();
  Future<dynamic> getUser();
  Future<bool> hasUser();
}

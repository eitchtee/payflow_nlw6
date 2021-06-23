class AuthController {
  bool _isAuthenticated = false;
  var _user;

  get user => _user;

  void setUser(var user) {
    if (user != null) {
      _isAuthenticated = true;
      _user = user;
    } else {
      _isAuthenticated = false;
    }
  }
}

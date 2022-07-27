class Endpoints {
  late AuthEndpoint auth;

  Endpoints() {
    auth = AuthEndpoint();
  }
}

class AuthEndpoint {
  final String signin;
  final String signup;
  final String forgotPassword;
  final String logout;

  AuthEndpoint({
    this.signin = '/login',
    this.signup = '/register',
    this.forgotPassword = '/forgot',
    this.logout = '/logout',
  });
}

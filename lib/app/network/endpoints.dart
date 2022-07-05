class Endpoints {
  late AuthEndpoint auth;

  Endpoints() {
    auth = AuthEndpoint();
  }
}

class AuthEndpoint {
  final String signin;
  final String signup;

  AuthEndpoint({
    this.signin = '/login',
    this.signup = '/register',
  });
}

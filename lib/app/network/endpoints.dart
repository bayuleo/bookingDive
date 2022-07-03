class Endpoints {
  late AuthEndpoint auth;

  Endpoints() {
    auth = AuthEndpoint();
  }
}

class AuthEndpoint {
  final String signin;

  AuthEndpoint({
    this.signin = '/login',
  });
}

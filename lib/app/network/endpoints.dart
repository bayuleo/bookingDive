class Endpoints {
  late AuthEndpoint auth;
  late LocationEndpoint location;

  Endpoints() {
    auth = AuthEndpoint();
    location = LocationEndpoint();
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

class LocationEndpoint {
  final String popularDiving;
  final String listLocation;

  LocationEndpoint({
    this.popularDiving = '/listing-popular',
    this.listLocation = '/listing',
  });
}

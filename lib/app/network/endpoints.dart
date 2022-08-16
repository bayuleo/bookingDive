class Endpoints {
  late AuthEndpoint auth;
  late LocationEndpoint location;
  late PaymentEndpoint payment;

  Endpoints() {
    auth = AuthEndpoint();
    location = LocationEndpoint();
    payment = PaymentEndpoint();
  }
}

class AuthEndpoint {
  final String signin;
  final String signup;
  final String forgotPassword;
  final String logout;
  final String profile;

  AuthEndpoint({
    this.signin = '/login',
    this.signup = '/register',
    this.forgotPassword = '/forgot',
    this.logout = '/logout',
    this.profile = '/profile',
  });
}

class LocationEndpoint {
  final String popularLocation;
  final String listLocation;
  final String nearbyLocation;
  final String listCity;
  final String review;

  LocationEndpoint(
      {this.popularLocation = '/listing-popular',
      this.listLocation = '/listing',
      this.nearbyLocation = '/listing-nearby',
      this.listCity = '/cities-list',
      this.review = '/review'});
}

class PaymentEndpoint {
  final String profilePayment;

  PaymentEndpoint({
    this.profilePayment = '/profile-payment',
  });
}

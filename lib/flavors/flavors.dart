enum Flavor {
  DEV,
  UAT,
  PROD,
}

class FlavorConfigs {
  static String appName = 'Booking Dive';
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.UAT:
        return '$appName UAT';
      case Flavor.PROD:
        return appName;
      default:
        return '$appName DEV';
    }
  }

  static bool get isDEV => FlavorConfigs.appFlavor == Flavor.DEV;
  static bool get isUAT => FlavorConfigs.appFlavor == Flavor.UAT;
  static bool get isPROD => FlavorConfigs.appFlavor == Flavor.PROD;

  static String get DEV_URL {
    return 'https://bookingdive-27iu7.ondigitalocean.app/api/v1';
  }

  static String get UAT_URL {
    return 'https://example.id';
  }

  static String get PRODUCTION_URL {
    return 'https://example.id';
  }

  static String get mockURL {
    return 'https://62c6cd342b03e73a58d762cd.mockapi.io/v1';
  }

  static String get baseURL {
    switch (appFlavor) {
      case Flavor.UAT:
        return UAT_URL;
      case Flavor.PROD:
        return PRODUCTION_URL;
      default:
        return DEV_URL;
    }
  }
}

enum Flavor { BIG_FAMILY_STAGING, BIG_FAMILY_PRODUCTION }

class Constants {
  static Map<String, dynamic> _configuration;

  static void setDimension(Flavor flavor) {
    switch (flavor) {
      case Flavor.BIG_FAMILY_STAGING:
        _configuration = Configuration._bigFamilyStaging;
        break;
      case Flavor.BIG_FAMILY_PRODUCTION:
        _configuration = Configuration._bigFamilyProduction;
        break;
    }
  }

  static get APP_ID => _configuration[Configuration.APP_ID];

  static get HOST_URL => _configuration[Configuration.HOST_URL];
}

class Configuration {
  static const APP_ID = "APP_ID";
  static const HOST_URL = "HOST_URL";

  static Map<String, dynamic> _bigFamilyStaging = {
    APP_ID: "",
    HOST_URL: "https://disloy.com/"
  };

  static Map<String, dynamic> _bigFamilyProduction = {
    APP_ID: "",
    HOST_URL: "https://uployal.io/"
  };
}

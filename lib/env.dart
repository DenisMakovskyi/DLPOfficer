enum Flavor { BIG_FAMILY_STAGING, BIG_FAMILY_PRODUCTION }

class Constants {
  static Map<String, dynamic> configuration;

  static void setFlavor(Flavor flavor) {
    switch (flavor) {
      case Flavor.BIG_FAMILY_STAGING:
        configuration = Configuration.bigFamilyStaging;
        break;

      case Flavor.BIG_FAMILY_PRODUCTION:
        configuration = Configuration.bigFamilyProduction;
        break;
    }
  }

  static get NAME => configuration[Configuration.NAME];

  static get APP_ID => configuration[Configuration.APP_ID];

  static get HOST_URL => configuration[Configuration.HOST_URL];
}

class Configuration {
  static const NAME = "NAME";
  static const APP_ID = "APP_ID";
  static const HOST_URL = "HOST_URL";

  static Map<String, dynamic> bigFamilyStaging = {
    NAME: "Big Family Staging",
    APP_ID: "",
    HOST_URL: "https://disloy.com/"
  };

  static Map<String, dynamic> bigFamilyProduction = {
    NAME: "Big Family Production",
    APP_ID: "",
    HOST_URL: "https://uployal.io/"
  };
}

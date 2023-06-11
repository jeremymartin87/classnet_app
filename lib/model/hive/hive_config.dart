
class HiveConfig {
  static String getHiveBoxes() {
    if (const String.fromEnvironment('FLAVOR') == 'dev') {
      // Flavor "dev"
      return 'devHiveBoxes';
    } else {
      // Flavor "prod"
      return 'prodHiveBoxes';
    }
  }
}

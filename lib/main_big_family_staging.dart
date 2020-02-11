import 'package:dlp_officer/env.dart';
import 'package:dlp_officer/main.dart';

void main() {
  Constants.setFlavor(Flavor.BIG_FAMILY_STAGING);
  mainDelegate();
}
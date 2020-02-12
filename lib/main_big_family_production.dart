import 'package:dlp_officer/env.dart';
import 'package:dlp_officer/main.dart';

void main() async {
  Constants.setFlavor(Flavor.BIG_FAMILY_PRODUCTION);
  mainDelegate();
}
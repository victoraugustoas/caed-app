import 'package:caed_app/utils/extensions/uri_ext.dart';

class Endpoints {
  // base url
  static const String productionUrl = "somehost.com";

  static Uri url = Uri.https(productionUrl).make(pathJoin: ["api"]);

  static Duration generalTimeout = const Duration(seconds: 5);
}

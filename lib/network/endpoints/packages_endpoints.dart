import 'package:caed_app/global/http/endpoints.dart';
import 'package:caed_app/utils/extensions/uri_ext.dart';

class PackagesEndpoints {
  static final Uri packages = Endpoints.url.make(pathJoin: ["packages"]);
}

import 'package:caed_app/global/http/endpoints.dart';
import 'package:caed_app/utils/extensions/uri_ext.dart';

class AuthEndpoints {
  static final Uri signin = Endpoints.url.make(pathJoin: ["signin"]);
}

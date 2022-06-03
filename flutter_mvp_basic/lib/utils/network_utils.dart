import 'package:http/http.dart' as http;

class NetworkUtils {
  static isReqSuccess(http.Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      return false;
    } else {
      return true;
    }
  }
}

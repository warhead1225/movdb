import 'package:movdb/core/app_export.dart';

class ApiHeaders {
  static String imageBase() => dotenv.env['IMAGE_BASE'] ?? '';
  static String apiBase() => dotenv.env['API_BASE'] ?? '';

  static Map<String, String> authHeader() {
    var apiAuth = dotenv.env['API_AUTH'];

    return {
      'Authorization': 'Bearer $apiAuth',
      'Accept': 'application/json',
    };
  }
}

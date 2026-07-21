import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
 static const String baseUrl = "https://nutribuddy-backend-kkc1.onrender.com/";

  static Future<String> askAI(String message) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/chat"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "message": message,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data["response"];
      }

      return "Server Error";
    } catch (e) {
      return "Unable to connect to AI server.";
    }
  }
}
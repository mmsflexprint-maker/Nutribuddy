import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      "https://nutribuddy-backend.onrender.com";

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
        return data["reply"].toString();
      } else {
        return "Server error: ${response.statusCode}";
      }
    } catch (e) {
      return "Connection error: $e";
    }
  }
}
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<Map<String, dynamic>> getCardDetails(String cardType) async {
    final response = await http.get(Uri.parse('$baseUrl/cards/$cardType'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load card details');
    }
  }

  // Other API methods can be added here
}

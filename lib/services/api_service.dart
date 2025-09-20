import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  // For physical device testing, use your computer's IP address
  // Example: http://192.168.1.100:5001/api
  //static const String baseUrl = 'http://192.168.1.255:5001/api'; // Your computer's IP
  //static const String baseUrl = 'http://10.0.2.2:5001/api'; // Android emulator
  static const String baseUrl = 'http://localhost:5001/api'; // iOS simulator
 // static const String baseUrl = 'http://192.168.12.5001/api'; // Physical device (replace with your IP)

  static Future<Map<String, String>> getHeaders() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  static Future<http.Response> get(String endpoint) async {
    final headers = await getHeaders();
    return await http.get(
      Uri.parse('$baseUrl/$endpoint'),
      headers: headers,
    );
  }

  static Future<http.Response> post(String endpoint, dynamic data) async {
    final headers = await getHeaders();
    return await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      headers: headers,
      body: json.encode(data),
    );
  }

  static Future<http.Response> put(String endpoint, dynamic data) async {
    final headers = await getHeaders();
    return await http.put(
      Uri.parse('$baseUrl/$endpoint'),
      headers: headers,
      body: json.encode(data),
    );
  }

  static Future<http.Response> patch(String endpoint, dynamic data) async {
    final headers = await getHeaders();
    return await http.patch(
      Uri.parse('$baseUrl/$endpoint'),
      headers: headers,
      body: json.encode(data),
    );
  }

  static Future<http.Response> delete(String endpoint) async {
    final headers = await getHeaders();
    return await http.delete(
      Uri.parse('$baseUrl/$endpoint'),
      headers: headers,
    );
  }
}

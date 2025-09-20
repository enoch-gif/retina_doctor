import 'dart:convert';
import 'api_service.dart';

class DoctorService {
  static Future<List<dynamic>> getDoctors() async {
    final response = await ApiService.get('doctors');
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load doctors');
    }
  }

  static Future<List<dynamic>> getPendingDoctors() async {
    final response = await ApiService.get('doctors/pending');
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load pending doctors');
    }
  }

  static Future<dynamic> approveDoctor(String doctorId) async {
    final response = await ApiService.patch('doctors/$doctorId/approve', {});
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to approve doctor');
    }
  }
}

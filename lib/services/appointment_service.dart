import 'dart:convert';
import 'api_service.dart';

class AppointmentService {
  static Future<List<dynamic>> getUserAppointments() async {
    final response = await ApiService.get('appointments/my-appointments');
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load appointments');
    }
  }

  static Future<dynamic> createAppointment(Map<String, dynamic> appointmentData) async {
    final response = await ApiService.post('appointments', appointmentData);
    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to create appointment');
    }
  }

  static Future<dynamic> updateAppointmentStatus(
      String appointmentId, String status) async {
    final response = await ApiService.patch(
      'appointments/$appointmentId',
      {'status': status},
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to update appointment');
    }
  }
}

class AppointmentModel {
  final String id;
  final String patientId;
  final String doctorId;
  final String patientName;
  final String doctorName;
  final DateTime dateTime;
  final String status;
  final String? notes;

  AppointmentModel({
    required this.id,
    required this.patientId,
    required this doctorId,
    required this.patientName,
    required this.doctorName,
    required this.dateTime,
    this.status = 'pending',
    this.notes,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'patientId': patientId,
      'doctorId': doctorId,
      'patientName': patientName,
      'doctorName': doctorName,
      'dateTime': dateTime.toIso8601String(),
      'status': status,
      'notes': notes,
    };
  }

  factory AppointmentModel.fromMap(Map<String, dynamic> map) {
    return AppointmentModel(
      id: map['id'] ?? '',
      patientId: map['patientId'] ?? '',
      doctorId: map['doctorId'] ?? '',
      patientName: map['patientName'] ?? '',
      doctorName: map['doctorName'] ?? '',
      dateTime: DateTime.parse(map['dateTime']),
      status: map['status'] ?? 'pending',
      notes: map['notes'],
    );
  }
}

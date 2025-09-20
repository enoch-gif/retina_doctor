import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppointmentCard extends StatelessWidget {
  final String doctorName;
  final DateTime dateTime;
  final String status;
  final VoidCallback onTap;

  const AppointmentCard({
    required this.doctorName,
    required this.dateTime,
    required this.status,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(Icons.calendar_today),
        ),
        title: Text(doctorName),
        subtitle: Text(DateFormat('MMM d, y - h:mm a').format(dateTime)),
        trailing: Chip(
          label: Text(status.toUpperCase()),
          backgroundColor: _getStatusColor(status),
        ),
        onTap: onTap,
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'confirmed':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'completed':
        return Colors.blue;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}

import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final VoidCallback onTap;

  const DoctorCard({
    required this.name,
    required this.specialty,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(Icons.medical_services),
        ),
        title: Text(name),
        subtitle: Text(specialty),
        trailing: Icon(Icons.arrow_forward),
        onTap: onTap,
      ),
    );
  }
}

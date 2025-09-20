import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retina_doctor/services/auth_service.dart';
import 'package:retina_doctor/services/appointment_service.dart';
import 'package:retina_doctor/services/doctor_service.dart';
import 'package:retina_doctor/screens/auth/login_screen.dart';
import 'package:retina_doctor/screens/home/patient_home.dart';
import 'package:retina_doctor/screens/home/doctor_home.dart';
import 'package:retina_doctor/screens/home/admin_home.dart';

void main() {
  runApp(RetinaDoctorApp());
}

class RetinaDoctorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        Provider(create: (_) => AppointmentService()),
        Provider(create: (_) => DoctorService()),
      ],
      child: MaterialApp(
        title: 'RetinaDoctor',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AuthWrapper(),
        routes: {
          '/login': (context) => LoginScreen(),
          '/patient': (context) => PatientHome(),
          '/doctor': (context) => DoctorHome(),
          '/admin': (context) => AdminHome(),
        },
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    
    if (authService.currentUser == null) {
      return LoginScreen();
    }
    
    // Check user role and redirect accordingly
    switch (authService.currentUser!.role) {
      case 'patient':
        return PatientHome();
      case 'doctor':
        return DoctorHome();
      case 'admin':
        return AdminHome();
      default:
        return LoginScreen();
    }
  }
}

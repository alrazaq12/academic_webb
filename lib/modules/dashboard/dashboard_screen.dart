import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  final String role;

  const DashboardScreen({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard for $role')),
      body: Center(child: Text('Welcome, $role')),
    );
  }
}

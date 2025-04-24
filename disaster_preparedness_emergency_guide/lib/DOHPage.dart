import 'package:flutter/material.dart';

class DOHPage extends StatelessWidget {
  const DOHPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Department of Health'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Department of Health (DOH)',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'The Department of Health is the principal health agency in the Philippines. It is responsible for ensuring access to basic public health services to all Filipinos.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            const ListTile(
              leading: Icon(Icons.phone),
              title: Text('DOH Hotline'),
              subtitle: Text('(02) 8651-7800'),
            ),
            const ListTile(
              leading: Icon(Icons.language),
              title: Text('Website'),
              subtitle: Text('www.doh.gov.ph'),
            ),
            const ListTile(
              leading: Icon(Icons.facebook),
              title: Text('Facebook Page'),
              subtitle: Text('Department of Health (Philippines)'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Services:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _buildServiceCard(
              'Emergency Medical Services',
              'Immediate medical response and assistance',
              Icons.medical_services,
            ),
            _buildServiceCard(
              'Health Information',
              'Public health advisories and guidelines',
              Icons.info_outline,
            ),
            _buildServiceCard(
              'Hospital Referral',
              'Assistance in finding available hospitals',
              Icons.local_hospital,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(String title, String description, IconData icon) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 32),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

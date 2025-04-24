import 'package:flutter/material.dart';

class BFPPage extends StatelessWidget {
  const BFPPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BFP'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bureau of Fire Protection',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'The Bureau of Fire Protection (BFP) is a government agency responsible for implementing policies, protecting lives and properties from fire.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            const ListTile(
              leading: Icon(Icons.phone),
              title: Text('Emergency Hotline'),
              subtitle: Text('(02) 426-0219, (02) 426-3812'),
            ),
            const ListTile(
              leading: Icon(Icons.language),
              title: Text('Website'),
              subtitle: Text('bfp.gov.ph'),
            ),
            const ListTile(
              leading: Icon(Icons.facebook),
              title: Text('Facebook Page'),
              subtitle: Text('Bureau of Fire Protection'),
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
              'Fire Prevention',
              'Inspection and enforcement of fire safety regulations',
              Icons.local_fire_department,
            ),
            _buildServiceCard(
              'Emergency Response',
              'Fire suppression and rescue operations',
              Icons.emergency,
            ),
            _buildServiceCard(
              'Public Safety Education',
              'Fire safety awareness and training programs',
              Icons.school,
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

import 'package:flutter/material.dart';

class PNPPage extends StatelessWidget {
  const PNPPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Philippine National Police'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Philippine National Police (PNP)',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'The PNP is the national police force of the Philippines, responsible for law enforcement and maintaining peace and order.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            const ListTile(
              leading: Icon(Icons.phone),
              title: Text('Emergency Hotline'),
              subtitle: Text('911'),
            ),
            const ListTile(
              leading: Icon(Icons.phone_in_talk),
              title: Text('PNP Hotline'),
              subtitle: Text('117'),
            ),
            const ListTile(
              leading: Icon(Icons.language),
              title: Text('Website'),
              subtitle: Text('www.pnp.gov.ph'),
            ),
            const ListTile(
              leading: Icon(Icons.facebook),
              title: Text('Facebook Page'),
              subtitle: Text('Philippine National Police'),
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
              'Emergency Response',
              'Quick response to emergency situations and crimes',
              Icons.emergency,
            ),
            _buildServiceCard(
              'Crime Prevention',
              'Proactive measures to prevent criminal activities',
              Icons.security,
            ),
            _buildServiceCard(
              'Community Service',
              'Assistance and support to local communities',
              Icons.people,
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

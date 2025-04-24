import 'package:flutter/material.dart';

class NDRRMCPage extends StatelessWidget {
  const NDRRMCPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NDRRMC'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'National Disaster Risk Reduction and Management Council',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'The NDRRMC is the Philippine government agency responsible for ensuring the protection and welfare of people during disasters or emergencies.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            const ListTile(
              leading: Icon(Icons.phone),
              title: Text('Emergency Hotline'),
              subtitle: Text('(02) 911-1406, (02) 912-2665'),
            ),
            const ListTile(
              leading: Icon(Icons.language),
              title: Text('Website'),
              subtitle: Text('www.ndrrmc.gov.ph'),
            ),
            const ListTile(
              leading: Icon(Icons.facebook),
              title: Text('Facebook Page'),
              subtitle: Text('Civil Defense PH'),
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
              'Disaster Monitoring',
              'Real-time monitoring and warning systems for natural disasters',
              Icons.monitor,
            ),
            _buildServiceCard(
              'Emergency Response',
              'Coordination of emergency response operations',
              Icons.emergency,
            ),
            _buildServiceCard(
              'Public Information',
              'Dissemination of disaster-related information and advisories',
              Icons.info,
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

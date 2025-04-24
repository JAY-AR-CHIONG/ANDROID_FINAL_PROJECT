import 'package:flutter/material.dart';

class PHIVOLCSPage extends StatelessWidget {
  const PHIVOLCSPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PHIVOLCS'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Philippine Institute of Volcanology and Seismology',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            _buildServiceCard(
              'Earthquake Monitoring',
              'Real-time monitoring and reporting of seismic activities',
              Icons.vibration,
            ),
            _buildServiceCard(
              'Volcanic Activity',
              'Monitoring and alerts for volcanic activities across the Philippines',
              Icons.landscape,
            ),
            _buildServiceCard(
              'Tsunami Warning',
              'Early warning system for potential tsunami threats',
              Icons.waves,
            ),
            _buildServiceCard(
              'Hazard Assessment',
              'Geological hazard assessment and mapping',
              Icons.assessment,
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

import 'package:flutter/material.dart';

class PAGASAPage extends StatelessWidget {
  const PAGASAPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PAGASA'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Philippine Atmospheric, Geophysical and Astronomical Services Administration',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            _buildServiceCard(
              'Weather Forecasting',
              'Daily weather updates and forecasts across the Philippines',
              Icons.cloud,
            ),
            _buildServiceCard(
              'Typhoon Tracking',
              'Real-time monitoring and tracking of tropical cyclones',
              Icons.track_changes,
            ),
            _buildServiceCard(
              'Climate Information',
              'Climate data, trends and seasonal outlooks',
              Icons.thermostat,
            ),
            _buildServiceCard(
              'Astronomical Services',
              'Astronomical data and celestial event information',
              Icons.star,
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

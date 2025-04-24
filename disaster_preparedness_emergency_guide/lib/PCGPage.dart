import 'package:flutter/material.dart';

class PCGPage extends StatelessWidget {
  const PCGPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Philippine Coast Guard'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Philippine Coast Guard',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            _buildServiceCard(
              'Maritime Safety',
              'Ensuring safety of life and property at sea through search and rescue operations',
              Icons.sailing,
            ),
            _buildServiceCard(
              'Maritime Security', 
              'Law enforcement and security operations in Philippine waters',
              Icons.security,
            ),
            _buildServiceCard(
              'Marine Environmental Protection',
              'Protection of marine resources and prevention of maritime pollution',
              Icons.water,
            ),
            _buildServiceCard(
              'Maritime Emergency Response',
              'Quick response to maritime accidents and disasters',
              Icons.emergency,
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

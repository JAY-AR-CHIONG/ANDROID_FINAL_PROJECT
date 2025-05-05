import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Required for launching URLs (e.g., phone, website, Facebook)

class PNPPage extends StatelessWidget {
  const PNPPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                color: Color(0xFF0074D9), // Blue title
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'The PNP is the national police force of the Philippines, responsible for law enforcement and maintaining peace and order.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            // Tappable links with blue color and action
            GestureDetector(
              onTap: () => _launchURL('tel:911'), // Phone link
              child: const ListTile(
                leading: Icon(Icons.phone, color: Color(0xFF0074D9)),
                title: Text('Emergency Hotline', style: TextStyle(color: Color(0xFF0074D9))),
                subtitle: Text('911'),
              ),
            ),
            GestureDetector(
              onTap: () => _launchURL('tel:117'), // Phone link
              child: const ListTile(
                leading: Icon(Icons.phone_in_talk, color: Color(0xFF0074D9)),
                title: Text('PNP Hotline', style: TextStyle(color: Color(0xFF0074D9))),
                subtitle: Text('117'),
              ),
            ),
            GestureDetector(
              onTap: () => _launchURL('https://www.pnp.gov.ph'), // Website link
              child: const ListTile(
                leading: Icon(Icons.language, color: Color(0xFF0074D9)),
                title: Text('Website', style: TextStyle(color: Color(0xFF0074D9))),
                subtitle: Text('www.pnp.gov.ph'),
              ),
            ),
            GestureDetector(
              onTap: () => _launchURL('https://web.facebook.com/pnp.pio'), // Facebook link
              child: const ListTile(
                leading: Icon(Icons.facebook, color: Color(0xFF0074D9)),
                title: Text('Facebook Page', style: TextStyle(color: Color(0xFF0074D9))),
                subtitle: Text('Philippine National Police'),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Services:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0074D9), // Blue title
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

static Widget _buildServiceCard(String title, String description, IconData icon) {
  return Container(
    height: 140, // same size for all cards
    margin: const EdgeInsets.symmetric(vertical: 8.0),
    decoration: BoxDecoration(
      color: Colors.white, // white background
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.blue.withOpacity(0.3), // blue shadow with opacity
          spreadRadius: 2,
          blurRadius: 6,
          offset: const Offset(0, 4), // shadow offset
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 40, color: Colors.blue), // blue icon
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue, // blue title
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54, // black text for readability
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}


Future<void> _launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  try {
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      await launchUrl(uri, mode: LaunchMode.inAppWebView);
    }
  } catch (e) {
    debugPrint('Error launching $url: $e');
  }
}
}

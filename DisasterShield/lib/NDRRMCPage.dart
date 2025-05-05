import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Required for launching URLs (e.g., phone, website, Facebook)

class NDRRMCPage extends StatelessWidget {
  const NDRRMCPage({super.key});

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
              'National Disaster Risk Reduction and Management Council',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0074D9), // Blue title
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'The NDRRMC is the Philippine government agency responsible for ensuring the protection and welfare of people during disasters or emergencies.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            // Tappable links with blue color and action
            GestureDetector(
              onTap: () => _launchURL('tel:(02)9111406'), // Phone link
              child: const ListTile(
                leading: Icon(Icons.phone, color: Color(0xFF0074D9)),
                title: Text('Emergency Hotline', style: TextStyle(color: Color(0xFF0074D9))),
                subtitle: Text('(02) 911-1406, (02) 912-2665'),
              ),
            ),
            GestureDetector(
              onTap: () => _launchURL('https://www.ndrrmc.gov.ph'), // Website link
              child: const ListTile(
                leading: Icon(Icons.language, color: Color(0xFF0074D9)),
                title: Text('Website', style: TextStyle(color: Color(0xFF0074D9))),
                subtitle: Text('www.ndrrmc.gov.ph'),
              ),
            ),
            GestureDetector(
              onTap: () => _launchURL('https://www.facebook.com/CivilDefensePH'), // Facebook link
              child: const ListTile(
                leading: Icon(Icons.facebook, color: Color(0xFF0074D9)),
                title: Text('Facebook Page', style: TextStyle(color: Color(0xFF0074D9))),
                subtitle: Text('Civil Defense PH'),
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

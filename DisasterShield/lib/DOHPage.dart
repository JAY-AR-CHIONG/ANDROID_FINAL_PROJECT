import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Required for launching URLs (e.g., phone, website, Facebook)

class DOHPage extends StatelessWidget {
  const DOHPage({super.key});

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
              'Department of Health (DOH)',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0074D9), // Blue title
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'The Department of Health is the principal health agency in the Philippines. It is responsible for ensuring access to basic public health services to all Filipinos.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            // Tappable links with blue color and action
            GestureDetector(
              onTap: () => _launchURL('tel:(02)86517800'), // Phone link
              child: const ListTile(
                leading: Icon(Icons.phone, color: Color(0xFF0074D9)),
                title: Text('DOH Hotline', style: TextStyle(color: Color(0xFF0074D9))),
                subtitle: Text('(02) 8651-7800'),
              ),
            ),
            GestureDetector(
              onTap: () => _launchURL('https://www.doh.gov.ph'), // Website link
              child: const ListTile(
                leading: Icon(Icons.language, color: Color(0xFF0074D9)),
                title: Text('Website', style: TextStyle(color: Color(0xFF0074D9))),
                subtitle: Text('www.doh.gov.ph'),
              ),
            ),
            GestureDetector(
              onTap: () => _launchURL('https://www.facebook.com/DOHgovph'), // Facebook link
              child: const ListTile(
                leading: Icon(Icons.facebook, color: Color(0xFF0074D9)),
                title: Text('Facebook Page', style: TextStyle(color: Color(0xFF0074D9))),
                subtitle: Text('Department of Health (Philippines)'),
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

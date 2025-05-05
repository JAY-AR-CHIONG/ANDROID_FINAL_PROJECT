import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PAGASAPage extends StatelessWidget {
  const PAGASAPage({super.key});

  static const Color primaryBlue = Color(0xFF0074D9);

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
              'Philippine Atmospheric, Geophysical and Astronomical Services Administration (PAGASA)',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: primaryBlue,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'PAGASA is the national meteorological and hydrological services agency of the Philippines. It provides timely weather forecasts, typhoon warnings, climate information, and astronomical data to help safeguard lives and support decision-making in agriculture, disaster risk reduction, and national development.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),

            ListTile(
              leading: const Icon(Icons.phone, color: primaryBlue),
              title: const Text('Weather Hotline', style: TextStyle(color: primaryBlue)),
              subtitle: const Text('8284-0800 local 4801 to 4802'),
              onTap: () => _launchURL('tel:0282840800'),
            ),
            ListTile(
              leading: const Icon(Icons.language, color: primaryBlue),
              title: const Text('Website', style: TextStyle(color: primaryBlue)),
              subtitle: const Text('www.pagasa.dost.gov.ph'),
              onTap: () => _launchURL('https://www.pagasa.dost.gov.ph'),
            ),
            ListTile(
              leading: const Icon(Icons.facebook, color: primaryBlue),
              title: const Text('Facebook Page', style: TextStyle(color: primaryBlue)),
              subtitle: const Text('PAGASA-DOST'),
              onTap: () => _launchURL('https://www.facebook.com/PAGASA.DOST.GOV.PH'),
            ),

            const SizedBox(height: 20),
            const Text(
              'Services:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryBlue,
              ),
            ),
            const SizedBox(height: 10),
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

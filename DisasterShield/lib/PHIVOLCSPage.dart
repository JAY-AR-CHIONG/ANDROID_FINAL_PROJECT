import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PHIVOLCSPage extends StatelessWidget {
  const PHIVOLCSPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('PHIVOLCS Info'),
        backgroundColor: const Color(0xFF0074D9),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Philippine Institute of Volcanology and Seismology (PHIVOLCS)',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0074D9),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'PHIVOLCS is a government agency under the Department of Science and Technology (DOST) tasked with monitoring and studying volcanoes, earthquakes, and tsunamis in the Philippines.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),

            // Tappable links using onTap
            ListTile(
              onTap: () => _launchURL('tel:(02)8926-2611'),
              leading: const Icon(Icons.phone, color: Color(0xFF0074D9)),
              title: const Text('Trunkline', style: TextStyle(color: Color(0xFF0074D9))),
              subtitle: const Text('(02) 8926-2611'),
            ),
            ListTile(
              onTap: () => _launchURL('tel:(02)8426-1468'),
              leading: const Icon(Icons.phone_in_talk, color: Color(0xFF0074D9)),
              title: const Text('Direct Line', style: TextStyle(color: Color(0xFF0074D9))),
              subtitle: const Text('(02) 8426-1468 to 79'),
            ),
            ListTile(
              onTap: () => _launchURL('https://www.phivolcs.dost.gov.ph'),
              leading: const Icon(Icons.language, color: Color(0xFF0074D9)),
              title: const Text('Website', style: TextStyle(color: Color(0xFF0074D9))),
              subtitle: const Text('www.phivolcs.dost.gov.ph'),
            ),
            ListTile(
              onTap: () => _launchURL('https://web.facebook.com/PHIVOLCS'),
              leading: const Icon(Icons.facebook, color: Color(0xFF0074D9)),
              title: const Text('Facebook Page', style: TextStyle(color: Color(0xFF0074D9))),
              subtitle: const Text('PHIVOLCS-DOST'),
            ),

            const SizedBox(height: 20),
            const Text(
              'Services:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0074D9),
              ),
            ),
            const SizedBox(height: 10),
            _buildServiceCard(
              'Volcano Monitoring',
              'Real-time monitoring and reporting of volcanic activity',
              Icons.terrain,
            ),
            _buildServiceCard(
              'Earthquake Monitoring',
              'Detection and analysis of seismic activity in the Philippines',
              Icons.vibration,
            ),
            _buildServiceCard(
              'Tsunami Warning',
              'Issuing alerts and warnings for tsunami threats',
              Icons.warning,
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildServiceCard(String title, String description, IconData icon) {
    return Container(
      height: 140,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 40, color: Colors.blue),
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
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
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


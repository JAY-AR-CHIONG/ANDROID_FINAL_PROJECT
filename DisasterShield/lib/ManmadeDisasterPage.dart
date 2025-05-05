import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


const Color primaryColor = Color(0xFF2196F3);
const Color secondaryColor = Color(0xFF64B5F6);
const Color backgroundColor = Color(0xFFF5F5F5);
const Color textColor = Color(0xFF212121);
const Color subtitleColor = Color(0xFF757575);

// Modern theme data
final ThemeData customTheme = ThemeData(
  primaryColor: primaryColor,
  scaffoldBackgroundColor: backgroundColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: primaryColor,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle.light,
  ),
  expansionTileTheme: const ExpansionTileThemeData(
    backgroundColor: Colors.white,
    collapsedBackgroundColor: Colors.white,
    tilePadding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  ),
  listTileTheme: const ListTileThemeData(
    contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  ),
  cardTheme: CardTheme(
    elevation: 4,
    shadowColor: Colors.black26,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: textColor,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      color: textColor,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(color: subtitleColor, fontSize: 16, height: 1.5),
  ),
);

class DisasterInfo {
  final String name;
  final String description;
  final List<String> beforeSteps;
  final List<String> duringSteps;
  final List<String> afterSteps;
  final List<String> safetyKit;
  final List<String> evacuationPlaces;
  final IconData icon;
  final String learnMoreUrl;

  

  DisasterInfo(
    this.name,
    this.description, {
    required this.beforeSteps,
    required this.duringSteps,
    required this.afterSteps,
    required this.safetyKit,
    required this.evacuationPlaces,
    required this.icon,
    required this.learnMoreUrl,

  });
}

class ManmadeDisasterPage extends StatelessWidget {
  const ManmadeDisasterPage({super.key});

  Widget _buildCategoryTile(
    BuildContext context,
    String title,
    List<DisasterInfo> disasters,
    IconData categoryIcon,
  ) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              categoryIcon,
              size: 28,
              color: Color(0xFF0074D9),
            ),
            title: Text(title, style: Theme.of(context).textTheme.titleMedium),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: disasters.length,
            itemBuilder: (context, index) {
              final disaster = disasters[index];
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 8,
                ),
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFF0074D9).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    disaster.icon,
                    color: Color(0xFF0074D9),
                  ),
                ),
                title: Text(
                  disaster.name,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => DisasterDetailPage(disaster: disaster),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Man-Made Disasters'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
             
              Color(0xFF0074D9).withOpacity(0.1),
               Color(0xFF0074D9),
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Card(
                  color:  Color(0xFF0074D9),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.warning_amber_rounded,
                          color: Colors.white,
                          size: 40,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Be Prepared',
                          style: Theme.of(
                            context,
                          ).textTheme.titleLarge?.copyWith(color: Colors.white),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Learn about different types of disasters and how to stay safe',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
               _buildCategoryTile(context, 'Technological Hazards', [
        DisasterInfo(
          'Fire (urban or industrial)',
          'Uncontrolled burning in urban areas or industrial sites.',
          icon: Icons.local_fire_department,
          beforeSteps: [
            'Identify safe spots in each room',
            'Secure heavy furniture',
            'Keep emergency kit ready',
            'Know evacuation routes',
            'Have a family emergency plan',
          ],
          duringSteps: [
            'Drop, Cover and Hold',
            'Stay away from windows',
            'If outdoors, move to open area',
            'If driving, pull over safely',
            'Stay calm and alert',
          ],
          afterSteps: [
            'Check for injuries',
            'Listen to authorities',
            'Be prepared for aftershocks',
            'Check utilities for damage',
            'Help others if possible',
          ],
          safetyKit: [
            'Flashlight and batteries',
            'First aid supplies',
            'Portable radio',
            'Water and food',
            'Important documents',
            'Cash',
            'Blankets',
          ],
          evacuationPlaces: [
            'Open fields',
            'Designated evacuation centers',
            'Emergency shelters',
            'School gymnasiums',
            'Community centers',
          ],    
          learnMoreUrl: 'https://en.wikipedia.org/wiki/List_of_fires',

        ),
        DisasterInfo(
          'Industrial accidents (e.g., chemical spills, gas leaks)',
          'Incidents like chemical leaks or gas explosions.',
          icon: FontAwesomeIcons.biohazard,
          beforeSteps: [
            'Monitor for alerts',
            'Prepare evacuation plan',
            'Stock emergency supplies',
            'Keep goggles and masks ready',
            'Have a communication plan',
          ],
          duringSteps: [
            'Evacuate if ordered',
            'Avoid downwind areas',
            'Wear protective gear',
            'Stay indoors if possible',
            'Listen to authorities',
          ],
          afterSteps: [
            'Avoid affected areas',
            'Clear roof of ash',
            'Protect machinery',
            'Wear mask when cleaning',
            'Follow health advisories',
          ],
          safetyKit: [
            'N95 masks',
            'Goggles',
            'Water supply',
            'First aid kit',
            'Battery-powered radio',
            'Flashlights',
            'Emergency food',
          ],
          evacuationPlaces: [
            'Evacuation centers',
            'Safe zones',
            'Relief centers',
            'Medical facilities',
            'Emergency shelters',
          ],
          learnMoreUrl: 'https://en.wikipedia.org/wiki/List_of_industrial_disasters',

        ),
        
        DisasterInfo(
          'Transportation Accidents',
          'Crashes involving land, air, or sea transport.',
          icon: Icons.directions_car,
          beforeSteps: [
            'Know warning signs',
            'Plan evacuation route',
            'Keep emergency kit ready',
            'Identify safe zones',
            'Learn community alerts',
          ],
          duringSteps: [
            'Move to higher ground',
            'Stay away from coast',
            'Follow evacuation orders',
            'Stay alert',
            'Assist others',
          ],
          afterSteps: [
            'Avoid flooded areas',
            'Check for injuries',
            'Listen to authorities',
            'Document damage',
            'Wait for all-clear',
          ],
          safetyKit: [
            'Water and food',
            'First aid supplies',
            'Radio',
            'Flashlights',
            'Documents',
            'Warm clothes',
            'Medications',
          ],
          evacuationPlaces: [
            'High ground areas',
            'Inland centers',
            'Relief centers',
            'Medical facilities',
            'Emergency shelters',
          ],
          learnMoreUrl: 'https://en.wikipedia.org/wiki/Transport_accident',

        ),
        DisasterInfo(
          'Power Outages',
          'Sudden loss of electricity.',
          icon: FontAwesomeIcons.bolt,
          beforeSteps: [
            'Monitor conditions',
            'Have an evacuation plan',
            'Stock emergency kit',
            'Know safe routes',
            'Charge devices',
          ],
          duringSteps: [
            'Use flashlight',
            'Avoid electrical appliances',
            'Stay calm',
            'Keep food cold',
            'Listen to news',
          ],
          afterSteps: [
            'Check for updates',
            'Inspect appliances',
            'Dispose spoiled food',
            'Reset devices safely',
            'Report outages',
          ],
          safetyKit: [
            'Food and water',
            'Radio',
            'Flashlights',
            'First aid kit',
            'Batteries',
            'Warm clothes',
            'Documents',
          ],
          evacuationPlaces: [
            'Emergency shelters',
            'Community centers',
            'Relief stations',
            'Medical facilities',
            'Safe zones',
          ],
          learnMoreUrl: 'https://en.wikipedia.org/wiki/Power_outage',

        ),
      ], Icons.landscape),

      _buildCategoryTile(context, 'Conflict-related Hazards', [
        DisasterInfo(
          'Armed Conflict / War / Insurgency',
          'Violent clashes between groups or armed forces.',
          icon: FontAwesomeIcons.gun,
          beforeSteps: [
            'Secure windows',
            'Stock supplies',
            'Charge phones',
            'Prepare evacuation bag',
            'Know escape routes',
          ],
          duringSteps: [
            'Stay indoors',
            'Avoid windows',
            'Use safe rooms',
            'Conserve food and water',
            'Listen to updates',
          ],
          afterSteps: [
            'Stay inside until safe',
            'Assess damage',
            'Document events',
            'Avoid dangerous areas',
            'Help neighbors',
          ],
          safetyKit: [
            'Water supply',
            'Food',
            'First aid',
            'Flashlights',
            'Radio',
            'Documents',
            'Power bank',
          ],
          evacuationPlaces: [
            'Evacuation centers',
            'Schools',
            'Government buildings',
            'Community halls',
            'Safe zones',
          ],
          learnMoreUrl: 'https://en.wikipedia.org/wiki/War',

        ),
        DisasterInfo(
          'Terrorism',
          'Use of violence for political/ideological aims.',
          icon: FontAwesomeIcons.bomb,
          beforeSteps: [
            'Emergency plan ready',
            'Secure essentials',
            'Fill water containers',
            'Charge communication devices',
            'Know emergency contacts',
          ],
          duringSteps: [
            'Stay calm',
            'Avoid crowded places',
            'Follow authorities',
            'Use emergency exits',
            'Help others if safe',
          ],
          afterSteps: [
            'Wait for official clearance',
            'Document the scene',
            'Check for injuries',
            'Avoid affected areas',
            'Support others',
          ],
          safetyKit: [
            'Water',
            'Food',
            'Radio',
            'Boots',
            'First aid',
            'Documents',
            'Flashlight',
          ],
          evacuationPlaces: [
            'Safe zones',
            'Evacuation centers',
            'Schools',
            'Shelters',
            'Community facilities',
          ],
          learnMoreUrl: 'https://en.wikipedia.org/wiki/Terrorism',

        ),
        DisasterInfo(
          'Bombings / Explosions',
          'Explosions causing destruction.',
          icon: FontAwesomeIcons.explosion,
          beforeSteps: [
            'Plan routes',
            'Prepare emergency kit',
            'Monitor local updates',
            'Secure home',
            'Fuel up vehicles',
          ],
          duringSteps: [
            'Evacuate',
            'Avoid fire and smoke',
            'Stay low',
            'Cover nose and mouth',
            'Help evacuate others',
          ],
          afterSteps: [
            'Wait for clearance',
            'Report hazards',
            'Document damage',
            'Check injuries',
            'Avoid unstable areas',
          ],
          safetyKit: [
            'Water',
            'Emergency food',
            'First aid',
            'Flashlights',
            'Radio',
            'Documents',
            'Clothes',
          ],
          evacuationPlaces: [
            'Shelters',
            'High ground',
            'Medical facilities',
            'Community halls',
            'Safe locations',
          ],
          learnMoreUrl: 'https://en.wiktionary.org/wiki/bombing',

        ),
        DisasterInfo(
          'Riots / Civil Disturbances',
          'Mass disorder due to tensions.',
          icon: FontAwesomeIcons.peopleGroup,
          beforeSteps: [
            'Store water',
            'Secure entry points',
            'Stay informed',
            'Avoid protest zones',
            'Have communication tools',
          ],
          duringSteps: [
            'Shelter indoors',
            'Avoid main roads',
            'Stay quiet and alert',
            'Use communication devices',
            'Wait for safe moment',
          ],
          afterSteps: [
            'Evaluate property',
            'Help others if needed',
            'Document events',
            'Stay updated',
            'Be cautious in public',
          ],
          safetyKit: [
            'Water containers',
            'Purification tablets',
            'First aid',
            'Emergency food',
            'Communication tools',
            'Documents',
            'Flashlights',
          ],
          evacuationPlaces: [
            'Community shelters',
            'Aid centers',
            'Relief stations',
            'Gov’t facilities',
            'Evacuation zones',
          ],
          learnMoreUrl: 'https://en.wikipedia.org/wiki/Civil_disorder',

        ),
      ], Icons.wb_cloudy),

      _buildCategoryTile(context, 'Structural Hazards', [
        DisasterInfo(
          'Building Collapse',
          'Failure of a building’s structure.',
          icon: FontAwesomeIcons.buildingCircleXmark,
          beforeSteps: [
            'Check structural integrity',
            'Avoid old/unsafe buildings',
            'Know emergency exits',
            'Have first aid ready',
            'Plan evacuation',
          ],
          duringSteps: [
            'Drop, cover, and hold',
            'Stay near structural walls',
            'Avoid elevators',
            'Cover mouth',
            'Exit safely if possible',
          ],
          afterSteps: [
            'Check for injuries',
            'Call emergency services',
            'Avoid reentry',
            'Help others',
            'Wait for instructions',
          ],
          safetyKit: [
            'Face mask',
            'Medical kit',
            'Flashlight',
            'Whistle',
            'Water',
            'Helmet',
            'Important docs',
          ],
          evacuationPlaces: [
            'Safe open areas',
            'Community shelters',
            'Medical tents',
            'Evacuation centers',
            'Gov’t buildings',
          ],
          learnMoreUrl: 'https://en.wikipedia.org/wiki/List_of_building_and_structure_collapses',

        ),
        DisasterInfo(
          'Dam Failure',
          'Collapse of a dam causing flooding.',
          icon: FontAwesomeIcons.water,
          beforeSteps: [
            'Know dam locations nearby',
            'Plan evacuation route',
            'Keep emergency kit',
            'Learn warning signals',
            'Stay informed',
          ],
          duringSteps: [
            'Evacuate to high ground',
            'Avoid floodwaters',
            'Follow orders',
            'Stay alert',
            'Help others evacuate',
          ],
          afterSteps: [
            'Avoid contaminated water',
            'Wait for clearance',
            'Check structure damage',
            'Report missing persons',
            'Stay informed',
          ],
          safetyKit: [
            'Food and water',
            'Radio',
            'Raincoat',
            'Medical kit',
            'Flashlight',
            'Warm clothing',
            'Documents',
          ],
          evacuationPlaces: [
            'High ground',
            'Emergency shelters',
            'Medical centers',
            'Community halls',
            'Relief centers',
          ],
          learnMoreUrl: 'https://en.wikipedia.org/wiki/Dam_failure',

        ),
      ], Icons.apartment),
            ],
          ),
        ),
      ),
    );
  }
}

class DisasterDetailPage extends StatelessWidget {
  final DisasterInfo disaster;

  const DisasterDetailPage({super.key, required this.disaster});

  Widget _buildSection(
    BuildContext context,
    String title,
    List<String> items,
    IconData sectionIcon,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ExpansionTile(
        leading: Icon(sectionIcon, color:  Color(0xFF0074D9)),
        title: Text(title, style: Theme.of(context).textTheme.titleMedium),
        children:
            items
                .map(
                  (item) => ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xFF0074D9).withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check_circle_outline,
                        color: Color(0xFF0074D9),
                      ),
                    ),
                    title: Text(
                      item,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(disaster.name), elevation: 0),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              
              Color(0xFF0074D9).withOpacity(0.1),
               Color(0xFF0074D9),
            ],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Icon(
                        disaster.icon,
                        size: 48,
                        color: Color(0xFF0074D9),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        disaster.description,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ), const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () {
                          launchURL(disaster.learnMoreUrl);
                        },
                        child: Text(
                          'Learn More',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                    
                  ),
                ),
              ),
            ),
            _buildSection(
              context,
              'Before ${disaster.name}',
              disaster.beforeSteps,
              Icons.warning_rounded,
            ),
            _buildSection(
              context,
              'During ${disaster.name}',
              disaster.duringSteps,
              Icons.directions_run,
            ),
            _buildSection(
              context,
              'After ${disaster.name}',
              disaster.afterSteps,
              Icons.healing,
            ),
            _buildSection(
              context,
              'Safety Kit',
              disaster.safetyKit,
              Icons.medical_services,
            ),
            _buildSection(
              context,
              'Where to Go',
              disaster.evacuationPlaces,
              Icons.location_on,
            ),
          ],
        ),
      ),
    );
  }
   Future<void> launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  print("Attempting to launch: $url");
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    print("Failed to launch: $url");
    throw 'Could not launch $url';
  }
}
}

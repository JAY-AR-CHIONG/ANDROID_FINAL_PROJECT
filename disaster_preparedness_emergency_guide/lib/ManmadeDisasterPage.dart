import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  DisasterInfo(
    this.name,
    this.description, {
    required this.beforeSteps,
    required this.duringSteps,
    required this.afterSteps,
    required this.safetyKit,
    required this.evacuationPlaces,
    required this.icon,
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
              color: Theme.of(context).primaryColor,
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
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    disaster.icon,
                    color: Theme.of(context).primaryColor,
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
              Theme.of(context).primaryColor.withOpacity(0.1),
              Colors.white,
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
                  color: Theme.of(context).primaryColor,
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
                ),
                DisasterInfo(
                  'Industrial accidents (e.g., chemical spills, gas leaks)',
                  'Incidents like chemical leaks or gas explosions.',
                  icon: FontAwesomeIcons.biohazard,
                  beforeSteps: [
                    'Monitor volcanic activity alerts',
                    'Prepare evacuation plan',
                    'Stock emergency supplies',
                    'Keep goggles and masks ready',
                    'Have a communication plan',
                  ],
                  duringSteps: [
                    'Evacuate immediately if ordered',
                    'Avoid areas downwind from volcano',
                    'Wear protective gear',
                    'Stay indoors if possible',
                    'Listen to official instructions',
                  ],
                  afterSteps: [
                    'Avoid affected areas',
                    'Clear roof of ash',
                    'Protect machinery from ash',
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
                    'Designated evacuation centers',
                    'Safe zones outside danger area',
                    'Emergency shelters',
                    'Relief centers',
                    'Medical facilities',
                  ],
                ),
                DisasterInfo(
                  'Transportation Accidents',
                  'Crashes involving land, air, or sea transport.',
                  icon: Icons.directions_car,
                  beforeSteps: [
                    'Know tsunami warning signs',
                    'Identify high ground locations',
                    'Plan evacuation route',
                    'Keep emergency kit ready',
                    'Learn community warning systems',
                  ],
                  duringSteps: [
                    'Move to higher ground immediately',
                    'Stay away from coast',
                    'Follow evacuation orders',
                    'Stay alert for multiple waves',
                    'Help others if possible',
                  ],
                  afterSteps: [
                    'Stay away until all-clear',
                    'Avoid flooded areas',
                    'Check for injuries',
                    'Listen to authorities',
                    'Document damage',
                  ],
                  safetyKit: [
                    'Water and food',
                    'First aid supplies',
                    'Battery-powered radio',
                    'Flashlights',
                    'Important documents',
                    'Warm clothing',
                    'Medications',
                  ],
                  evacuationPlaces: [
                    'High ground areas',
                    'Inland evacuation centers',
                    'Emergency shelters',
                    'Relief centers',
                    'Medical facilities',
                  ],
                ),
                DisasterInfo(
                  'Power Outages',
                  'Sudden loss of electrical power over an area.',
                  icon: FontAwesomeIcons.bolt,
                  beforeSteps: [
                    'Monitor weather conditions',
                    'Watch for warning signs',
                    'Have evacuation plan ready',
                    'Prepare emergency kit',
                    'Know safe routes',
                  ],
                  duringSteps: [
                    'Evacuate immediately',
                    'Listen for unusual sounds',
                    'Move away from path',
                    'Stay alert and awake',
                    'Help others if safe',
                  ],
                  afterSteps: [
                    'Stay away from slide area',
                    'Check for injured people',
                    'Report broken utilities',
                    'Watch for flooding',
                    'Follow official instructions',
                  ],
                  safetyKit: [
                    'Emergency food and water',
                    'First aid kit',
                    'Battery-powered radio',
                    'Flashlights',
                    'Warm clothing',
                    'Important documents',
                    'Basic tools',
                  ],
                  evacuationPlaces: [
                    'Safe high ground',
                    'Emergency shelters',
                    'Community centers',
                    'Relief stations',
                    'Medical facilities',
                  ],
                ),
              ], Icons.landscape),
              _buildCategoryTile(context, ' Conflict-related Hazards', [
                DisasterInfo(
                  'Armed Conflict / War / Insurgency',
                  'Violent clashes between groups or armed forces.',
                  icon: FontAwesomeIcons.gun,
                  beforeSteps: [
                    'Secure loose objects',
                    'Board up windows',
                    'Stock up supplies',
                    'Charge communication devices',
                    'Review evacuation plan',
                  ],
                  duringSteps: [
                    'Stay indoors',
                    'Keep away from windows',
                    'Monitor weather updates',
                    'Conserve food and water',
                    'Stay in safe room',
                  ],
                  afterSteps: [
                    'Stay inside until all-clear',
                    'Check for damage',
                    'Document destruction',
                    'Avoid floodwaters',
                    'Help neighbors if safe',
                  ],
                  safetyKit: [
                    'Water supply',
                    'Non-perishable food',
                    'Flashlights',
                    'Batteries',
                    'First aid kit',
                    'Important documents',
                    'Battery bank',
                  ],
                  evacuationPlaces: [
                    'Evacuation centers',
                    'School buildings',
                    'Community centers',
                    'Government facilities',
                    'Relief stations',
                  ],
                ),
                DisasterInfo(
                  'Terrorism',
                  'Use of violence for political or ideological purposes.',
                  icon: FontAwesomeIcons.bomb,
                  beforeSteps: [
                    'Move to higher ground',
                    'Prepare emergency kit',
                    'Secure important items',
                    'Fill clean containers with water',
                    'Charge devices',
                  ],
                  duringSteps: [
                    'Avoid floodwaters',
                    'Turn off utilities',
                    'Move to higher floors',
                    'Listen to updates',
                    'Help others if safe',
                  ],
                  afterSteps: [
                    'Wait for all-clear',
                    'Document damage',
                    'Clean and disinfect',
                    'Watch for mold',
                    'Check structural safety',
                  ],
                  safetyKit: [
                    'Drinking water',
                    'Non-perishable food',
                    'First aid supplies',
                    'Flashlights',
                    'Radio',
                    'Rubber boots',
                    'Important documents',
                  ],
                  evacuationPlaces: [
                    'High ground areas',
                    'Evacuation centers',
                    'School buildings',
                    'Relief centers',
                    'Emergency shelters',
                  ],
                ),
                DisasterInfo(
                  'Bombings / Explosions',
                  'Detonations causing destruction and casualties.',
                  icon: FontAwesomeIcons.explosion,
                  beforeSteps: [
                    'Know evacuation routes',
                    'Prepare emergency kit',
                    'Monitor weather updates',
                    'Secure property',
                    'Fill vehicles with fuel',
                  ],
                  duringSteps: [
                    'Evacuate immediately',
                    'Move to higher ground',
                    'Stay away from water',
                    'Follow official orders',
                    'Help others evacuate',
                  ],
                  afterSteps: [
                    'Wait for all-clear',
                    'Avoid floodwaters',
                    'Document damage',
                    'Check for hazards',
                    'Listen to authorities',
                  ],
                  safetyKit: [
                    'Water supply',
                    'Emergency food',
                    'First aid kit',
                    'Flashlights',
                    'Battery radio',
                    'Important papers',
                    'Warm clothing',
                  ],
                  evacuationPlaces: [
                    'Inland shelters',
                    'High ground areas',
                    'Emergency centers',
                    'Relief stations',
                    'Safe zones',
                  ],
                ),
                DisasterInfo(
                  'Riots / Civil Disturbances',
                  'Disorderly behavior by groups, often due to political or social tensions.',
                  icon: FontAwesomeIcons.peopleGroup,
                  beforeSteps: [
                    'Conserve water',
                    'Fix leaks',
                    'Install water-efficient devices',
                    'Create water storage',
                    'Plant drought-resistant species',
                  ],
                  duringSteps: [
                    'Follow water restrictions',
                    'Minimize water usage',
                    'Collect and reuse water',
                    'Monitor crop conditions',
                    'Protect vulnerable plants',
                  ],
                  afterSteps: [
                    'Maintain conservation',
                    'Assess damage',
                    'Replant if needed',
                    'Review water plans',
                    'Prepare for future',
                  ],
                  safetyKit: [
                    'Water storage containers',
                    'Water purification methods',
                    'First aid kit',
                    'Emergency food',
                    'Basic tools',
                    'Important documents',
                    'Communication devices',
                  ],
                  evacuationPlaces: [
                    'Water distribution centers',
                    'Community centers',
                    'Relief stations',
                    'Government facilities',
                    'Aid centers',
                  ],
                ),
              ], Icons.wb_cloudy),
              _buildCategoryTile(context, 'Structural Hazards', [
                DisasterInfo(
                  'Building Collapse ',
                  'Failure of a building’s structure, often due to poor construction.',
                  icon: FontAwesomeIcons.buildingCircleXmark,
                  beforeSteps: [
                    'Practice good hygiene',
                    'Get vaccinated if available',
                    'Stock medical supplies',
                    'Learn prevention measures',
                    'Plan for isolation',
                  ],
                  duringSteps: [
                    'Follow health guidelines',
                    'Wear protective equipment',
                    'Practice social distancing',
                    'Isolate if exposed',
                    'Seek medical care if needed',
                  ],
                  afterSteps: [
                    'Continue precautions',
                    'Monitor health',
                    'Support recovery efforts',
                    'Stay informed',
                    'Help community heal',
                  ],
                  safetyKit: [
                    'Face masks',
                    'Hand sanitizer',
                    'Disinfectants',
                    'Medical supplies',
                    'Prescription medications',
                    'Thermometer',
                    'Emergency contacts',
                  ],
                  evacuationPlaces: [
                    'Medical facilities',
                    'Testing centers',
                    'Isolation facilities',
                    'Treatment centers',
                    'Emergency clinics',
                  ],
                ),
                DisasterInfo(
                  'Dam Failure',
                  'Collapse or malfunction of a dam, leading to uncontrolled water release.',
                  icon: FontAwesomeIcons.water,
                  beforeSteps: [
                    'Practice good hygiene',
                    'Get vaccinated if available',
                    'Stock medical supplies',
                    'Learn prevention measures',
                    'Plan for isolation',
                  ],
                  duringSteps: [
                    'Follow health guidelines',
                    'Wear protective equipment',
                    'Practice social distancing',
                    'Isolate if exposed',
                    'Seek medical care if needed',
                  ],
                  afterSteps: [
                    'Continue precautions',
                    'Monitor health',
                    'Support recovery efforts',
                    'Stay informed',
                    'Help community heal',
                  ],
                  safetyKit: [
                    'Face masks',
                    'Hand sanitizer',
                    'Disinfectants',
                    'Medical supplies',
                    'Prescription medications',
                    'Thermometer',
                    'Emergency contacts',
                  ],
                  evacuationPlaces: [
                    'Medical facilities',
                    'Testing centers',
                    'Isolation facilities',
                    'Treatment centers',
                    'Emergency clinics',
                  ],
                ),
              ], Icons.medical_services),
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
        leading: Icon(sectionIcon, color: Theme.of(context).primaryColor),
        title: Text(title, style: Theme.of(context).textTheme.titleMedium),
        children:
            items
                .map(
                  (item) => ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check_circle_outline,
                        color: Theme.of(context).primaryColor,
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
              Theme.of(context).primaryColor.withOpacity(0.1),
              Colors.white,
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
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        disaster.description,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
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
}

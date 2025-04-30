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

class EnvironmentalDisasterPage extends StatelessWidget {
  const EnvironmentalDisasterPage({super.key});

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
        title: const Text('Environtment Disasters'),
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
                  'Oil Spill',
                  'Uncontrolled burning in urban areas or industrial sites.',
                  icon: FontAwesomeIcons.oilWell,
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
                  'Deforestation',
                  'Incidents like chemical leaks or gas explosions.',
                  icon: FontAwesomeIcons.tree,
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
                  'Mining-induced landslide',
                  'Crashes involving land, air, or sea transport.',
                  icon: FontAwesomeIcons.hillAvalanche,
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
                  'Coastal erosion',
                  'Sudden loss of electrical power over an area.',
                  icon: FontAwesomeIcons.water,
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
                 DisasterInfo(
                  'Coral reef destruction ',
                  'Sudden loss of electrical power over an area.',
                  icon: FontAwesomeIcons.fishFins,
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
                 DisasterInfo(
                  'Water pollution',
                  'Sudden loss of electrical power over an area.',
                  icon: FontAwesomeIcons.faucetDrip,
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
                 DisasterInfo(
                  'Air pollution',
                  'Sudden loss of electrical power over an area.',
                  icon: FontAwesomeIcons.smog,
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
                 DisasterInfo(
                  'Garbage landslides',
                  'Sudden loss of electrical power over an area.',
                  icon: FontAwesomeIcons.dumpsterFire,
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
              ],Icons.wb_cloudy),
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

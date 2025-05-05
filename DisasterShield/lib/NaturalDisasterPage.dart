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

class NaturalDisasterPage extends StatelessWidget {
  const NaturalDisasterPage({super.key});

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
        title: const Text('Natural Disasters'),
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
                color: Color(0xFF0074D9),
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
              _buildCategoryTile(context, 'Geological Hazards', [
  DisasterInfo(
    'Earthquake',
    'A sudden and violent shaking of the ground, caused by movement of tectonic plates.',
    icon: FontAwesomeIcons.houseCrack,
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
    learnMoreUrl: 'https://en.wikipedia.org/wiki/Earthquake',
  ),
  DisasterInfo(
    'Volcanic Eruption',
    'The expulsion of molten rock, ash and gases from a volcano.',
    icon: FontAwesomeIcons.volcano,
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
    learnMoreUrl: 'https://en.wikipedia.org/wiki/Volcanic_eruption',
  ),
  DisasterInfo(
    'Tsunami',
    'A series of large ocean waves caused by earthquakes or underwater landslides.',
    icon: FontAwesomeIcons.water,
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
    learnMoreUrl: 'https://en.wikipedia.org/wiki/Tsunami',
  ),
  DisasterInfo(
    'Landslide',
    'The movement of rock, earth, or debris down a slope.',
    icon: FontAwesomeIcons.mountain,
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
    learnMoreUrl: 'https://en.wikipedia.org/wiki/Landslide',
  ),
], Icons.landscape),

_buildCategoryTile(context, 'Meteorological/Climatological Hazards', [
  DisasterInfo(
    'Typhoon/Tropical Cyclone',
    'A large rotating storm with high winds and heavy rainfall.',
    icon: Icons.cyclone,
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
    learnMoreUrl: 'https://en.wikipedia.org/wiki/Tropical_cyclone',
  ),
  DisasterInfo(
    'Flood',
    'An overflow of water onto normally dry land.',
    icon: Icons.water_damage,
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
    learnMoreUrl: 'https://en.wikipedia.org/wiki/Flood',
  ),
], Icons.cloud),

_buildCategoryTile(context, 'Other Hazards', [
  DisasterInfo(
    'Drought',
    'A prolonged period of abnormally low rainfall, leading to water shortages.',
    icon: Icons.wb_sunny,
    beforeSteps: [
      'Conserve water',
      'Store drinking water',
      'Use drought-tolerant crops',
      'Monitor local advisories',
      'Plan for water needs',
    ],
    duringSteps: [
      'Limit water use',
      'Avoid outdoor watering',
      'Follow water restrictions',
      'Stay cool and hydrated',
      'Use water-efficient devices',
    ],
    afterSteps: [
      'Continue conserving water',
      'Check for crop damage',
      'Clean tanks and filters',
      'Assist affected communities',
      'Assess long-term needs',
    ],
    safetyKit: [
      'Stored drinking water',
      'Non-perishable food',
      'Cooling supplies',
      'Face masks for dust',
      'Health essentials',
      'Water filters',
    ],
    evacuationPlaces: [
      'Community centers',
      'Government supply stations',
      'Relief centers',
      'Medical clinics',
      'Public shelters',
    ],
    learnMoreUrl: 'https://en.wikipedia.org/wiki/Drought',
  ),
  DisasterInfo(
    'Extreme Heat',
    'Prolonged periods of excessively hot weather that may pose health risks.',
    icon: Icons.thermostat,
    beforeSteps: [
      'Check weather reports',
      'Prepare cool shelter',
      'Stock up on fluids',
      'Avoid outdoor work',
      'Plan for vulnerable individuals',
    ],
    duringSteps: [
      'Stay indoors',
      'Use fans or AC',
      'Drink plenty of water',
      'Avoid strenuous activity',
      'Monitor health symptoms',
    ],
    afterSteps: [
      'Check on at-risk groups',
      'Treat heat-related illnesses',
      'Cool living spaces',
      'Document impact',
      'Prepare for future waves',
    ],
    safetyKit: [
      'Water bottles',
      'Cooling towels',
      'Fans or coolers',
      'Oral rehydration salts',
      'Light clothing',
      'First aid kit',
    ],
    evacuationPlaces: [
      'Cooling centers',
      'Community buildings',
      'Shaded public areas',
      'Medical centers',
      'Relief stations',
    ],
    learnMoreUrl: 'https://en.wikipedia.org/wiki/Heat_wave',
  ),
  DisasterInfo(
    'Wildfire',
    'An uncontrolled fire spreading in vegetation areas, often due to dry conditions.',
    icon: Icons.local_fire_department,
    beforeSteps: [
      'Clear flammable debris',
      'Create defensible space',
      'Pack emergency kit',
      'Monitor fire warnings',
      'Prepare evacuation plan',
    ],
    duringSteps: [
      'Evacuate if advised',
      'Shut off utilities',
      'Keep away from smoke',
      'Follow fire updates',
      'Use masks or cloths',
    ],
    afterSteps: [
      'Avoid burned areas',
      'Beware of ash or debris',
      'Check air quality',
      'Report hazards',
      'Help neighbors if safe',
    ],
    safetyKit: [
      'N95 masks',
      'Water and food',
      'First aid kit',
      'Goggles',
      'Flashlights',
      'Important documents',
    ],
    evacuationPlaces: [
      'Designated fire shelters',
      'Community halls',
      'Evacuation zones',
      'Medical stations',
      'Emergency centers',
    ],
    learnMoreUrl: 'https://en.wikipedia.org/wiki/Wildfire',
  ),
  DisasterInfo(
    'Tornado',
    'A violently rotating column of air extending from a thunderstorm to the ground.',
    icon: Icons.toys,
    beforeSteps: [
      'Know shelter locations',
      'Secure loose objects',
      'Prepare emergency kit',
      'Monitor tornado alerts',
      'Have a communication plan',
    ],
    duringSteps: [
      'Take cover immediately',
      'Go to a basement or interior room',
      'Avoid windows',
      'Protect your head',
      'Stay informed',
    ],
    afterSteps: [
      'Avoid damaged areas',
      'Check for injured people',
      'Listen to updates',
      'Avoid downed power lines',
      'Document damage',
    ],
    safetyKit: [
      'Battery radio',
      'Flashlights',
      'Water and food',
      'Helmet or head protection',
      'First aid kit',
      'Blankets',
    ],
    evacuationPlaces: [
      'Storm shelters',
      'Basement areas',
      'Designated tornado shelters',
      'School shelters',
      'Community centers',
    ],
    learnMoreUrl: 'https://en.wikipedia.org/wiki/Tornado',
  ),
], Icons.warning),

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
        leading: Icon(sectionIcon, color: Color(0xFF0074D9),),
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
                      ),
                      const SizedBox(height: 8),
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

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'PNPPage.dart';
import 'BFPPage.dart';
import 'DOHPage.dart';
import 'NDRRMCPage.dart';
import 'PAGASAPage.dart';
import 'PCGPage.dart';
import 'PHIVOLCSPage.dart';
import 'NaturalDisasterPage.dart';
import 'ManmadeDisasterPage.dart';
import 'EnvironmentalDisasterPage.dart';

void main() {
  runApp(const MyApp());
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      );
    });

    return Scaffold(body: Center(child: Image.asset('assets/logo.png')));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DisasterShield',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int currentPage = 0;

  final List<Map<String, String>> pages = [
    {
      'title': 'Welcome to DisasterShield',
      'description':
          'Your ultimate guide for emergency preparedness and survival.',
      'image': '🛡️',
    },
    {
      'title': 'Be Prepared',
      'description': 'Learn how to prepare before disasters strike.',
      'image': '📦',
    },
    {
      'title': 'Stay Safe',
      'description': 'Get step-by-step guidance during emergencies.',
      'image': '🚨',
    },
  ];

  @override
  void initState() {
    super.initState();
    _checkOnboardingStatus();
  }

  // This function checks whether onboarding was already completed
  _checkOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isOnboardingCompleted =
        prefs.getBool('isOnboardingCompleted') ?? false;

    if (isOnboardingCompleted) {
      // If completed, go directly to HomeScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    }
  }

  // This function should be called AFTER onboarding is done
  // To always show onboarding: set to false
  // To show only once: change false -> true here
  _setOnboardingCompleted() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
      'isOnboardingCompleted',
      true,
    ); //  Change this to true to show onboarding only once
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: pages.length,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (_, index) {
                return Container(
                  padding: const EdgeInsets.all(32.0),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        pages[index]['image']!,
                        style: const TextStyle(fontSize: 80),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        pages[index]['title']!,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        pages[index]['description']!,
                        style: const TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          AnimatedSlide(
            offset:
                currentPage == pages.length - 1
                    ? Offset.zero
                    : const Offset(0, 1),
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut,
            child: AnimatedOpacity(
              opacity: currentPage == pages.length - 1 ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: ElevatedButton(
                  onPressed: () {
                    _setOnboardingCompleted();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    backgroundColor: const Color.fromARGB(255, 198, 231, 250),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              pages.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 20),
                width: currentPage == index ? 16 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: currentPage == index ? Colors.black : Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class EmergencyContactsCarousel extends StatefulWidget {
  const EmergencyContactsCarousel({super.key});

  @override
  State<EmergencyContactsCarousel> createState() =>
      _EmergencyContactsCarouselState();
}

class _EmergencyContactsCarouselState extends State<EmergencyContactsCarousel> {
  int _currentIndex = 0;

  final List<Map<String, dynamic>> contacts = [
    {'asset': 'assets/pnp.png', 'label': 'PNP', 'page': PNPPage()},
    {'asset': 'assets/bfp.png', 'label': 'BFP', 'page': BFPPage()},
    {'asset': 'assets/doh.png', 'label': 'DOH', 'page': DOHPage()},
    {'asset': 'assets/ndrrmc.png', 'label': 'NDRRMC', 'page': NDRRMCPage()},
    {'asset': 'assets/pagasa.png', 'label': 'PAGASA', 'page': PAGASAPage()},
    {'asset': 'assets/pcg.png', 'label': 'PCG', 'page': PCGPage()},
    {
      'asset': 'assets/phivolcs.png',
      'label': 'PHIVOLCS',
      'page': PHIVOLCSPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            'Emergency Contacts',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 30),
        CarouselSlider.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index, realIndex) {
            final data = contacts[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => data['page'] as Widget,
                  ),
                );
              },
              child: Column(
                children: [
                  Container(
                    width: 120,
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(0, 238, 238, 238),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      data['asset'] as String,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    data['label'] as String,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          },
          options: CarouselOptions(
            height: 140,
            viewportFraction: 0.33,
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        const SizedBox(height: 0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              contacts.asMap().entries.map((entry) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        _currentIndex == entry.key
                            ?Color(0xFF0074D9)
                            : Colors.black26,
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DisasterShield',
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'DisasterShield',
            style: TextStyle(
              fontWeight: FontWeight.w900, // Makes it bolder than regular 'bold'
              fontSize: 30,
              color:Color(0xFF0074D9),
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Select Category',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 30),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  {
                    'icon': Icons.public,
                    'label': 'Natural\nDisasters',
                    'page': NaturalDisasterPage(),
                  },
                  {
                    'icon': Icons.warning_amber_rounded,
                    'label': 'Man-Made\nDisasters',
                    'page': ManmadeDisasterPage(),
                  },
                  {
                    'icon': Icons.eco_rounded,
                    'label': 'Environmental\nDisasters',
                    'page': EnvironmentalDisasterPage(),
                  },
                ].map<Widget>((data) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => data['page'] as Widget,
                          ),
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 110,
                            height: 80,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.white, Colors.grey[200]!],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 6,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Icon(
                              data['icon'] as IconData,
                              size: 35,
                              color: const Color(0xFF0074D9),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            data['label'] as String,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),


              const EmergencyContactsCarousel(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 20.0,
                ),
                child: Text(
                  '#Prepare yourself for the disaster',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              CarouselSlider(
                items:
                    [
                      'assets/image1.png',
                      'assets/image2.png',
                      'assets/image3.png',
                    ].map((imgPath) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(imgPath, fit: BoxFit.cover),
                        ),
                      );
                    }).toList(),
                options: CarouselOptions(height: 190),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

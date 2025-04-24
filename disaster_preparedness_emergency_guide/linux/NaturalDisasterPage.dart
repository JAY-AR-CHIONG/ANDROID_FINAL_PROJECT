import 'package:flutter/material.dart';

class NaturalDisasterPage extends StatelessWidget {
  const NaturalDisasterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Natural Disaster Info')),
      body: Center(child: Text('Details about Natural Disaster')),
    );
  }
}

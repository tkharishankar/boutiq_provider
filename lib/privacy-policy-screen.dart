import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: FutureBuilder(
        future: rootBundle.loadString('privacy-policy.html'),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Text(snapshot.data ?? ""),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

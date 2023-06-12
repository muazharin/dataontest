import 'package:dataontest/app/data/models/university_model.dart';
import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({super.key, required this.e});
  final UniversityModel? e;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Name",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text("${e!.name}"),
            const SizedBox(height: 16),
            const Text(
              "Country",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text("${e!.country}"),
            const SizedBox(height: 16),
            const Text(
              "Domains",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text("${e!.domains![0]}"),
            const SizedBox(height: 16),
            const Text(
              "Web Page",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text("${e!.webPages![0]}"),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

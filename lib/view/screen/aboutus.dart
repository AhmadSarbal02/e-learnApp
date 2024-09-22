import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Our Team',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            _buildTeamMemberCard(
              name: 'Ahmad Sarbal',
              image: 'assets/images/ahmad1.jpeg',
              description:
                  'A computer science student in his final semester at Al Al-Bayt University with a very good grade.',
              phoneNumber: '+962 7 8866 4341',
            ),
            const SizedBox(height: 20.0),
            _buildTeamMemberCard(
              name: 'Ahmad Gharaibeh',
              image: 'assets/images/ahmad2.jpeg',
              description:
                  'A computer science student in his final semester at Al Al-Bayt University with a very good grade.',
              phoneNumber: '+962 7 8866 4341',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamMemberCard({
    required String name,
    required String image,
    required String description,
    required String phoneNumber,
  }) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(image),
              radius: 40.0,
            ),
            const SizedBox(height: 10.0),
            Text(
              name,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14.0,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Phone: $phoneNumber',
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

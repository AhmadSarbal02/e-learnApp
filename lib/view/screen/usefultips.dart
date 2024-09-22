import 'package:flutter/material.dart';

class UsefulTips extends StatelessWidget {
  const UsefulTips({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Useful Tips'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Useful Tips for Students',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            _buildTipCard(
              title: 'Stay Organized',
              detail:
                  'Keep your study materials organized and create a schedule to manage your time effectively.',
            ),
            _buildTipCard(
              title: 'Set Realistic Goals',
              detail:
                  'Set achievable goals for your studies and break them down into smaller tasks to stay motivated.',
            ),
            _buildTipCard(
              title: 'Take Regular Breaks',
              detail:
                  'Take short breaks during study sessions to rest your mind and maintain focus.',
            ),
            _buildTipCard(
              title: 'Focus on Active Learning',
              detail:
                  'Engage actively with the material by summarizing, questioning, and teaching the concepts to others.',
            ),
            _buildTipCard(
              title: 'Seek Help When Needed',
              detail:
                  'Don\'t hesitate to ask questions or seek clarification from your teachers or peers when you encounter difficulties.',
            ),
            _buildTipCard(
              title: 'Stay Healthy',
              detail:
                  'Maintain a balanced diet, exercise regularly, and get enough sleep to support your overall well-being and cognitive function.',
            ),
            _buildTipCard(
              title: 'Stay Motivated',
              detail:
                  'Stay inspired and motivated by setting rewards for yourself and focusing on the long-term benefits of your education.',
            ),
            _buildTipCard(
              title: 'Review Regularly',
              detail:
                  'Regularly review your notes and course materials to reinforce your learning and identify areas that need further attention.',
            ),
            _buildTipCard(
              title: 'Stay Positive',
              detail:
                  'Maintain a positive attitude towards your studies and believe in your ability to overcome challenges and succeed.',
            ),
            _buildTipCard(
              title: 'Take Care of Yourself',
              detail:
                  'Prioritize self-care and mental health by practicing relaxation techniques and seeking support when needed.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTipCard({
    required String title,
    required String detail,
  }) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              detail,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

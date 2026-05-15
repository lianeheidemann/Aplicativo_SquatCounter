import 'package:flutter/material.dart';

/// Card que exibe progresso do treino
class ProgressCard extends StatelessWidget {

  final String title;
  final String value;

  const ProgressCard({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              value,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
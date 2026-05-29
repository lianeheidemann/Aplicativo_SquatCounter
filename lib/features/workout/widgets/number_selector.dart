import 'package:flutter/material.dart';

/// Widget reutilizável para seleção numérica
class NumberSelector extends StatelessWidget {

  final String title;
  final int value;

  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const NumberSelector({
    super.key,
    required this.title,
    required this.value,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                IconButton(
                  onPressed: onDecrease,
                  icon: const Icon(Icons.remove),
                ),

                Text(
                  value.toString(),
                  style: const TextStyle(fontSize: 24),
                ),

                IconButton(
                  onPressed: onIncrease,
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
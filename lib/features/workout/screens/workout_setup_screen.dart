import 'package:flutter/material.dart';

import '../controllers/workout_controller.dart';
import '../widgets/number_selector.dart';
import 'workout_session_screen.dart';

/// Tela de configuração do treino
class WorkoutSetupScreen extends StatefulWidget {

  const WorkoutSetupScreen({super.key});

  @override
  State<WorkoutSetupScreen> createState() =>
      _WorkoutSetupScreenState();
}

class _WorkoutSetupScreenState
    extends State<WorkoutSetupScreen> {

  final WorkoutController controller =
      WorkoutController();

  int reps = 10;
  int sets = 3;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Squat Counter'),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            children: [

              const SizedBox(height: 20),

              NumberSelector(
                title: 'Repetições por Série',
                value: reps,

                onIncrease: () {
                  setState(() {
                    reps++;
                  });
                },

                onDecrease: () {
                  if (reps > 1) {
                    setState(() {
                      reps--;
                    });
                  }
                },
              ),

              const SizedBox(height: 20),

              NumberSelector(
                title: 'Quantidade de Séries',
                value: sets,

                onIncrease: () {
                  setState(() {
                    sets++;
                  });
                },

                onDecrease: () {
                  if (sets > 1) {
                    setState(() {
                      sets--;
                    });
                  }
                },
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(

                  onPressed: () {

                    controller.updateWorkout(
                      reps: reps,
                      sets: sets,
                    );

                    Navigator.push(
                      context,

                      MaterialPageRoute(
                        builder: (_) =>
                            WorkoutSessionScreen(
                              controller: controller,
                            ),
                      ),
                    );
                  },

                  child: const Padding(
                    padding: EdgeInsets.all(16),

                    child: Text(
                      'Iniciar Treino',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../../../../core/services/sensor_service.dart';

import '../controllers/workout_controller.dart';
import '../widgets/progress_card.dart';

/// Tela principal do treino
class WorkoutSessionScreen extends StatefulWidget {

  final WorkoutController controller;

  const WorkoutSessionScreen({
    super.key,
    required this.controller,
  });

  @override
  State<WorkoutSessionScreen> createState() =>
      _WorkoutSessionScreenState();
}

class _WorkoutSessionScreenState
    extends State<WorkoutSessionScreen> {

  final SensorService sensorService =
      SensorService();

  bool trainingStarted = false;

  double x = 0;
  double y = 0;
  double z = 0;

  @override
  void dispose() {

    sensorService.stopListening();

    super.dispose();
  }

  /// Inicia sensores
  void startTraining() {

    sensorService.startListening(

      onSquatDetected: () {

        setState(() {

          widget.controller.incrementRep();

          // Verifica se treino terminou
          if (widget.controller.workoutFinished) {

            sensorService.stopListening();

            trainingStarted = false;

            Future.delayed(
              const Duration(milliseconds: 300),
              () {
                showFinishedDialog();
              },
            );
          }
        });
      },

      onSensorChanged: (
        sensorX,
        sensorY,
        sensorZ,
      ) {

        setState(() {
          x = sensorX;
          y = sensorY;
          z = sensorZ;
        });
      },
    );

    setState(() {
      trainingStarted = true;
    });
  }

  /// Reinicia treino
  void resetTraining() {

    sensorService.stopListening();

    widget.controller.resetWorkout();

    setState(() {

      trainingStarted = false;

      x = 0;
      y = 0;
      z = 0;
    });
  }

  /// Exibe mensagem de treino concluído
  void showFinishedDialog() {

    showDialog(

      context: context,

      builder: (_) {

        return AlertDialog(

          title: const Text(
            'Treino Concluído 🎉',
          ),

          content: const Text(
            'Parabéns! Você finalizou todas as séries do treino.',
          ),

          actions: [

            TextButton(

              onPressed: () {

                Navigator.pop(context);

                resetTraining();
              },

              child: const Text(
                'Reiniciar',
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Treino'),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            children: [

              ProgressCard(
                title: 'Série Atual',

                value:
                    '${widget.controller.currentSet}'
                    '/${widget.controller.config.totalSets}',
              ),

              const SizedBox(height: 20),

              ProgressCard(
                title: 'Repetições',

                value:
                    '${widget.controller.currentRep}'
                    '/${widget.controller.config.repsPerSet}',
              ),

              const SizedBox(height: 30),

              Text(
                trainingStarted
                    ? 'Sensores ativos'
                    : 'Treino parado',

                style: const TextStyle(
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 20),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),

                  child: Column(
                    children: [

                      const Text(
                        'Valores do Acelerômetro',

                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),

                      const SizedBox(height: 12),

                      Text(
                        'X: ${x.toStringAsFixed(2)}',
                      ),

                      Text(
                        'Y: ${y.toStringAsFixed(2)}',
                      ),

                      Text(
                        'Z: ${z.toStringAsFixed(2)}',
                      ),
                    ],
                  ),
                ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(

                  onPressed: trainingStarted
                      ? null
                      : startTraining,

                  child: const Padding(
                    padding: EdgeInsets.all(16),

                    child: Text(
                      'Iniciar Sensores',

                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(

                  onPressed: resetTraining,

                  child: const Padding(
                    padding: EdgeInsets.all(16),

                    child: Text(
                      'Resetar Treino',

                      style: TextStyle(
                        fontSize: 18,
                      ),
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
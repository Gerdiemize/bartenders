import 'package:flutter/material.dart';


class StepProgressBar extends StatelessWidget {
  final int totalSteps;
  final int currentStep;
  final String title; // Add a title for the left side text

  StepProgressBar({
    required this.totalSteps,
    required this.currentStep,
    required this.title, // Require title to be passed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0), // Padding for internal content
      width: double.infinity,
      height: 50, // Increased height for text
      child: Stack(
        children: <Widget>[
          // Background container
          Container(
            width: double.infinity,
            height: 20, // Static height for the progress bar itself
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          // Progress bar fill
          Align(
            alignment: Alignment.topLeft,
            child: FractionallySizedBox(
              widthFactor: currentStep / totalSteps, // Adjust width factor as per current step
              child: Container(
                height: 20, // Static height for the progress bar fill
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
                ),
              ),
            ),
          ),
          // Text at the bottom left
          Positioned(
            left: 0,
            bottom: 0,
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          ),
          // Step text at the bottom right
          Positioned(
            right: 0,
            bottom: 0,
            child: Text(
              '${currentStep.toString().padLeft(2, '0')}/$totalSteps',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
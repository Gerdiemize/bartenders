import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:bartenders_and_more/widgets/progressbar.dart';

class TermsConditionsStaffScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Terms and Conditions', style: TextStyle(color: Colors.white),),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            StepProgressBar(
              totalSteps: 8,
              currentStep: 6,
              title: 'Looking for job', // Add the title text
              ),
            SizedBox(height: 30,),
            Text(
              'Last updated December 2023',
              style: TextStyle(color: Colors.white, fontSize: 14),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Text(
                      '1. Terms',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '2. User License',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    // Repeat the pattern for other sections
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4.0), // Half of the desired space between buttons
                    child: Container(
                      height: 48, // Fixed height
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30), // Adjust for rounded corners
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/termsClient');
                        },
                        child: Text(
                          'Decline',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent, // Make the button background transparent
                          onSurface: Colors.transparent, // Ensure overlay colors are transparent too
                          shadowColor: Colors.transparent, // No shadow for transparent background
                          elevation: 0, // Remove elevation
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30), // Match the container's border radius
                            side: BorderSide(color: Colors.grey), // Add grey border
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8), // The space between the buttons
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0), // Half of the desired space between buttons
                    child: Container(
                      height: 48, // Fixed height
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30), // Adjust for rounded corners
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color.fromRGBO(130, 91, 51, 1), // Start color
                            Color.fromRGBO(232, 218, 191, 1), // Middle color
                            Color.fromRGBO(130, 91, 51, 1), // End color, same as start color
                          ],
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/membershipStaff');
                        },
                        child: Text(
                          'Accept',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent, // Make the button background transparent
                          onSurface: Colors.transparent, // Ensure overlay colors are transparent too
                          shadowColor: Colors.transparent, // No shadow for transparent background
                          elevation: 0, // Remove elevation
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30), // Match the container's border radius
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20), // Add some spacing at the bottom
          ],
        ),
      ),
    );
  }
}
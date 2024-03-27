import 'package:flutter/material.dart';
import 'package:bartenders_and_more/widgets/progressbar.dart';

class LocationScreenStaff extends StatelessWidget {
  final TextEditingController locationController = TextEditingController();

  void continueButtonPressed(BuildContext context) {
    // Get user input from controllers

    String location = locationController.text;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
      content: Text(location,),
      ),
    );

    // Navigate to the email verification screen
    Navigator.pushNamed(context, '/signupStaff'); 
  }
  @override
  void dispose() {
    locationController.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 50,),
              StepProgressBar(
              totalSteps: 8,
              currentStep: 1,
              title: 'Looking for job', // Add the title text
              ),
              SizedBox(height: 120),
              Text(
                'Your Location',
                style: TextStyle(color: Colors.white, fontSize: 28),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                "Tell us where you're available to work to connect you with nearby events.",
                style: TextStyle(color: Colors.grey, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Text(
                'Location',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(height: 10),
              TextField(
                controller: locationController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter your location here',
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Type in the cities or zip codes you can travel to for work',
                style: TextStyle(color: Colors.grey, fontSize: 14),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity, // Full-width button
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
                    continueButtonPressed(context);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min, // Use only the minimum space needed
                    children: <Widget>[
                      Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.black, // Set the text color to black
                          fontSize: 16,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward, // Add arrow forward icon
                        color: Colors.black, // Set the icon color to black
                      ),
                    ],
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
              SizedBox(height: 20),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/signin'); // Replace '/signin' with your route's name to sign-in screen
                  },
                  child: Text(
                    'Log in',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            ),
            ],
          ),
        ),
      ),
    );
  }
}

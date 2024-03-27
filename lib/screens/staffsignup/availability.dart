import 'package:flutter/material.dart';
import 'package:bartenders_and_more/widgets/progressbar.dart';

class AvailabilityScreen extends StatelessWidget {
  @override
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
              currentStep: 4,
              title: 'Looking for job', // Add the title text
              ),
              SizedBox(height: 30),
              Text(
                'Your Availability',
                style: TextStyle(color: Colors.white, fontSize: 28),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Please enter your availability',
                style: TextStyle(color: Colors.grey, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Text(
                'What days of the week are you available?',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(height: 10),
              buildDropdownField(),
              SizedBox(height: 30),
              Text(
                'What hours are you available to work?',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(height: 10),
              TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: '8:00 AM - 9:00 PM',
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
                'What is Your Hourly Rate',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(height: 10),
              TextField(
                obscureText: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "20/Hr",
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
                'Service Area',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(height: 10),
              TextField(
                obscureText: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Miami,Fl',
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
                'Unavailable Dates',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(height: 10),
              TextField(
                obscureText: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Date selector',
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
                    Navigator.pushNamed(context, '/backgroundCheck');
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min, // Use only the minimum space needed
                    children: <Widget>[
                      Text(
                        'Next',
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
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDropdownField() {
  List<String> items = ['Monday', 'Tuesday', 'Wednesday' , 'Thursday' , 'Friday' , 'Saturday' , 'Sunday']; // Define gender options
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
    decoration: BoxDecoration(
      color: Colors.grey[850],
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(5),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        isExpanded: true,
        value: items.first,
        style: TextStyle(color: Colors.white),
        dropdownColor: Colors.black,
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (newValue) {
          // Handle change, you might need to set state if inside a StatefulWidget
        },
      ),
    ),
  );
}

}

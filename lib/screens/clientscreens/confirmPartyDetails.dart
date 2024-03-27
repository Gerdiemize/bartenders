import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // For iOS-style icons
import 'package:bartenders_and_more/widgets/progressbar.dart';

class PreviewPartyDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Preview Party Details', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),// For the menu icon
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 80.0), // Increased bottom padding to account for the fixed button
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align titles to the left
              children: [
                StepProgressBar(
                  totalSteps: 8,
                  currentStep: 7,
                  title: 'Looking to hire', // Add the title text
                ),
                SizedBox(height: 10,),
                Text(
                  'Event date & Start time',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                _buildEditableDetailRow(
                  iconData: CupertinoIcons.calendar,
                  detail: '21/12/2023',
                  onTap: () {
                    // TODO: Navigate to the edit screen for the event date
                  },
                ),
                _buildEditableDetailRow(
                  iconData: CupertinoIcons.time,
                  detail: '10:00 AM',
                  onTap: () {
                    // TODO: Navigate to the edit screen for the start time
                  },
                ),
                SizedBox(height: 8),
                Text(
                  'Guest arrival & entry and Number of guest',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                _buildEditableDetailRow(
                  iconData: CupertinoIcons.clock,
                  detail: '09:00 AM',
                  onTap: () {
                    // TODO: Navigate to the edit screen for guest arrival time
                  },
                ),
                _buildEditableDetailRow(
                  iconData: CupertinoIcons.clock,
                  detail: '10:00 AM',
                  onTap: () {
                    // TODO: Navigate to the edit screen for guest entry time
                  },
                ),
                _buildEditableDetailRow(
                  iconData: CupertinoIcons.person,
                  detail: '120',
                  onTap: () {
                    // TODO: Navigate to the edit screen for number of guests
                  },
                ),
                SizedBox(height: 8),
                Text(
                  'Venue name & location',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                _buildEditableDetailRow(
                  iconData: CupertinoIcons.building_2_fill,
                  detail: 'Park View',
                  onTap: () {
                    // TODO: Navigate to the edit screen for venue name
                  },
                ),
                _buildEditableDetailRow(
                  iconData: CupertinoIcons.map,
                  detail: 'Los Angeles',
                  onTap: () {
                    // TODO: Navigate to the edit screen for location
                  },
                ),
                SizedBox(height: 8),
                Text(
                  'Multitasker, Equipment’s, Serving & Liquor',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                _buildEditableDetailRow(
                  iconData: CupertinoIcons.person_2_square_stack,
                  detail: '5+',
                  onTap: () {
                    // TODO: Navigate to the edit screen for multitaskers
                  },
                ),
                _buildEditableDetailRow(
                  iconData: CupertinoIcons.person_2_square_stack,
                  detail: 'Decanter’s, Mixology, Spoon',
                  onTap: () {
                    // TODO: Navigate to the edit screen for equipment
                  },
                ),
                _buildEditableDetailRow(
                  iconData: CupertinoIcons.square_favorites_alt,
                  detail: 'Sit-down',
                  onTap: () {
                    // TODO: Navigate to the edit screen for serving style
                  },
                ),
                SizedBox(height: 16), // Added for spacing before the fixed button
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
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
                    Navigator.pushNamed(context, '/dashboardClient');
                     /* if (_formKey.currentState!.validate()) {
                        // Process data
                      }*/
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min, // Use only the minimum space needed
                    children: <Widget>[
                      Text(
                        'Post my event',
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
          ),
        ],
      ),
    );
  }

  Widget _buildEditableDetailRow({
    required IconData iconData,
    required String detail,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 4.0),
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
        decoration: BoxDecoration(
          color: Colors.black, // Set the color to black
          //border: Border.all(color: Colors.grey), // Add border color similar to the design
          //borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(iconData, color: Colors.grey),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                detail,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            Icon(Icons.edit, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _buildPostEventButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      margin: EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFFD2B48C), // Button color
          onPrimary: Colors.black, // Text and icon color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {
          // TODO: Add post event logic
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Post My Event'),
            Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}

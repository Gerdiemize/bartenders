import 'package:flutter/material.dart';

class NewEventsCard extends StatelessWidget {
  final String title;
  final String date;
  final String postTime;
  final String location;
  final String description;
  final bool isVerified;

  const NewEventsCard({
    Key? key,
    required this.title,
    required this.date,
    required this.postTime,
    required this.location,
    required this.description,
    this.isVerified = false, // Default to false if not provided
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black, // Adjust the color to match the card's background
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Adjust for rounded corners
        side: BorderSide(color: Colors.grey, width: 1.0), // Grey border
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Adjust the padding as needed
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16, // Adjust the font size as needed
                  ),
                ),
                Icon(Icons.more_vert, color: Colors.white),
              ],
            ),
            SizedBox(height: 8), // Provides space between the title and the date
            Row(
              children: [
                Icon(Icons.calendar_today, color: Colors.grey, size: 14), // Adjust size as needed
                SizedBox(width: 4), // Provides space between the icon and the text
                Text(
                  date,
                  style: TextStyle(color: Colors.grey, fontSize: 12), // Adjust the font size as needed
                ),
                SizedBox(width: 16), // Flexible space between elements
                Icon(Icons.access_time, color: Colors.grey, size: 14), // Adjust size as needed
                SizedBox(width: 4), // Space between the icon and the text
                Text(
                  'Post: $postTime',
                  style: TextStyle(color: Colors.grey, fontSize: 12), // Adjust the font size as needed
                ),
              ],
            ),
            SizedBox(height: 8), // Provides space between the date and the location
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.grey, size: 14), // Adjust size as needed
                SizedBox(width: 4), // Space between the icon and the text
                Text(
                  location,
                  style: TextStyle(color: Colors.grey, fontSize: 12), // Adjust the font size as needed
                ),
                if (isVerified) ...[
                  SizedBox(width: 8), // Space between location and verified badge
                  Icon(Icons.check_circle, color: Colors.green, size: 14), // Adjust size as needed
                  SizedBox(width: 4), // Space between the badge and the label
                  Text(
                    'Verified',
                    style: TextStyle(color: Colors.green, fontSize: 12), // Adjust the font size as needed
                  ),
                ],
              ],
            ),
            SizedBox(height: 16), // Provides space between the location and the body text
            Text(
              description,
              style: TextStyle(color: Colors.white, fontSize: 12), // Adjust the font size as needed
            ),
          ],
        ),
      ),
    );
  }
}

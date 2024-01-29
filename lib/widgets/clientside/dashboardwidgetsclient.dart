import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class EventCard extends StatelessWidget {
  final String eventName;
  final String eventDate;
  final String eventLocation;

  EventCard({
    required this.eventName,
    required this.eventDate,
    required this.eventLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black, // Adjust the color to match your design
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: Colors.grey, width: 1.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              eventName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis, // Show ellipsis when text overflows
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6.0),
            Row(
              children: <Widget>[
                Icon(Icons.calendar_today, color: Colors.grey, size: 16.0),
                SizedBox(width: 4.0),
                Expanded(
                  child: Text(
                    eventDate,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis, // Show ellipsis when text overflows
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 6.0),
            Row(
              children: <Widget>[
                Icon(Icons.location_on, color: Colors.grey, size: 16.0),
                SizedBox(width: 4.0),
                Expanded(
                  child: Text(
                    eventLocation,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis, // Show ellipsis when text overflows
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            TextButton(
              onPressed: () {
                // TODO: Handle details button tap
              },
              child: Text(
                'Details',
                style: TextStyle(color: Colors.white),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey[850], // Use a darker shade for the button
                primary: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class TeamCard extends StatelessWidget {
  final String imagePath;
  final String teamName;
  final double rating;
  final String location;
  final String experience;

  TeamCard({
    required this.imagePath,
    required this.teamName,
    required this.rating,
    required this.location,
    required this.experience,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160, // Fixed width for the card
      child: Card(
        color: Colors.grey[850], // Dark card background
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text(
                    teamName,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: <Widget>[
                      // Use Icon or Image.asset for star icon
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Text(
                        ' $rating',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  ],),
                  SizedBox(height: 4),
                  Row(children: [
                    Icon(Icons.location_pin,color: Colors.white,size: 20),
                    SizedBox(width: 4),
                    Text(
                      location,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                  ],),
                  SizedBox(height: 4),
                  Row(children: [
                    Icon(Icons.calendar_today,color: Colors.white, size: 20),
                    SizedBox(width: 4),
                    Text(
                      experience,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],)               
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchResultCard extends StatelessWidget {
  final String imagePath;
  final String vendorName;
  final double rating;
  final String experience;
  final String location;
  final String price;

  SearchResultCard({
    required this.imagePath,
    required this.vendorName,
    required this.rating,
    required this.experience,
    required this.location,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade800),
      ),
      margin: EdgeInsets.all(8.0),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  height: 180, // Reduced height for the card
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            vendorName,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18, // Adjusted font size
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(Icons.star, color: Colors.amber, size: 18),
                        SizedBox(width: 4),
                        Text(
                          '$rating',
                          style: TextStyle(color: Colors.white, fontSize: 16), // Adjusted font size
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    infoRow(Icons.school, experience),
                    infoRow(Icons.location_on, location),
                    infoRow(Icons.attach_money, price),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget infoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey, size: 16),
        SizedBox(width: 4),
        Expanded(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 14),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class ProfileHireCard extends StatelessWidget {
  final String imagePath;
  final String vendorName;
  final double rating;
  final String experience;
  final String location;
  final String price;

  ProfileHireCard({
    required this.imagePath,
    required this.vendorName,
    required this.rating,
    required this.experience,
    required this.location,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black),
      ),
      margin: EdgeInsets.all(8.0),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  height: 130, // Reduced height for the card
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // This will create even spacing between all children
                  children: [
                    Text(
                      vendorName,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18, // Adjusted font size
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 18),
                        SizedBox(width: 4),
                        Text(
                          '$rating',
                          style: TextStyle(color: Colors.white, fontSize: 16), // Adjusted font size
                        ),
                      ],
                    ),
                    infoRow(Icons.school, experience),
                    infoRow(Icons.location_on, location),
                    infoRow(Icons.attach_money, price),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget infoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey, size: 16),
        SizedBox(width: 4),
        Expanded(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 14),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}


class EventPlannerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: Colors.grey.shade700),
      ),
      color: Colors.black,
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
              'House Party',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.normal,
                ),
              ),
              Spacer(), // Add a spacer to push everything to the edges
              Icon(Icons.more_vert, color: Colors.grey),
            ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.calendar_today, color: Colors.grey),
                SizedBox(width: 8),
                Text(
                  'Jan 17, 2024',
                  style: TextStyle(color: Colors.grey),
                ),
                Spacer(),
                Text(
                  'Hired',
                  style: TextStyle(color: Colors.grey[400]),
                ),
                SizedBox(width: 8),
                // Avatars next to 'Hired' text
                CircleAvatar(
                  backgroundImage: AssetImage('path/to/your/first/image.png'), // Replace with your image path
                  radius: 12,
                ),
                SizedBox(width: 4),
                CircleAvatar(
                  backgroundImage: AssetImage('path/to/your/second/image.png'), // Replace with your image path
                  radius: 12,
                ),
                SizedBox(width: 4),
                CircleAvatar(
                  backgroundImage: AssetImage('path/to/your/third/image.png'), // Replace with your image path
                  radius: 12,
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.grey),
                SizedBox(width: 8),
                Text(
                  'Park View',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            //Divider(color: Colors.grey, height: 20), // Divider line
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Details at the bottom of the card
                TextButton(
                  onPressed: () {
                    // Handle Details tap
                  },
                  child: Row(
                    children: [
                      Text(
                        'Details',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(Icons.chevron_right, color: Colors.white),
                    ],
                  ),
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}








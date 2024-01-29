import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bartenders_and_more/widgets/clientside/dashboardwidgetsclient.dart';

class CurrentEventDetails extends StatefulWidget {
  @override
  _CurrentEventDetails createState() => _CurrentEventDetails();
}

class _CurrentEventDetails extends State<CurrentEventDetails> {

  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Current Events'),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Handle edit profile action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0), // Adjust padding as needed
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'House Party',
                    style: TextStyle(
                      color: Colors.grey[200],
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 16), // Adjust space as needed
                  Row(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.grey[500], size: 16), // Adjust size as needed
                      SizedBox(width: 8), // Adjust space as needed
                      Text(
                        'Jan 17, 2024',
                        style: TextStyle(
                          color: Colors.grey[200],
                          fontSize: 16, // Adjust font size as needed
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8), // Adjust space as needed
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.grey[500], size: 16), // Adjust size as needed
                      SizedBox(width: 8), // Adjust space as needed
                      Text(
                        'Park View',
                        style: TextStyle(
                          color: Colors.grey[200],
                          fontSize: 16, // Adjust font size as needed
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16), // Adjust space as needed
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Applicant\'s (11)',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20, // Adjust font size as needed
                          fontWeight: FontWeight.bold, // Adjust font weight as needed
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle view all applicants action
                        },
                        child: Text(
                          'View All',
                          style: TextStyle(
                            color: Colors.blue, // Adjust color as needed
                            fontSize: 16, // Adjust font size as needed
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 150,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/profileHire');
                },
                child: SearchResultCard(
                  imagePath: 'assets/images/girlSearchResult.png',
                  vendorName: 'Miriane Piers',
                  rating: 4.9,
                  experience: '10 yrs of experience',
                  location: 'Brookline, MA',
                  price: 'From 25/hr',
                ),
              ),
            ),
            Container(
              height: 150,
              child: SearchResultCard(
                imagePath: 'assets/images/girlSearchResult.png',
                vendorName: 'Miriane Piers',
                rating: 4.9,
                experience: '10 yrs of experience',
                location: 'Brookline, MA',
                price: 'From 25/hr',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0), // Adjust padding as needed
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Party Details',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Event date & Start time',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.grey[700], size: 20), // Adjust size as needed
                      SizedBox(width: 8), // Adjust space as needed
                      Text(
                        '21/12/2023',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16, // Adjust font size as needed
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8), // Adjust space as needed
                  Row(
                    children: [
                      Icon(Icons.lock_clock, color: Colors.grey[700], size: 20), // Adjust size as needed
                      SizedBox(width: 8), // Adjust space as needed
                      Text(
                        '10:00 PM',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16, // Adjust font size as needed
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16), // Adjust space as needed
                  Text(
                    'Guests Arrival & Entry and Number of Guests',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.lock_clock, color: Colors.grey[700], size: 20), // Adjust size as needed
                      SizedBox(width: 8), // Adjust space as needed
                      Text(
                        '09:00 PM',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16, // Adjust font size as needed
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12), // Adjust space as needed
                  Row(
                    children: [
                      Icon(Icons.lock_clock, color: Colors.grey[700], size: 20), // Adjust size as needed
                      SizedBox(width: 8), // Adjust space as needed
                      Text(
                        '10:00 PM',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16, // Adjust font size as needed
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.people, color: Colors.grey[700], size: 20), // Adjust size as needed
                      SizedBox(width: 8), // Adjust space as needed
                      Text(
                        '120',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16, // Adjust font size as needed
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Venue Name & Location',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.place, color: Colors.grey[700], size: 20), // Adjust size as needed
                      SizedBox(width: 8), // Adjust space as needed
                      Text(
                        'Park View',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16, // Adjust font size as needed
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8), // Adjust space as needed
                  Row(
                    children: [
                      Icon(Icons.location_city, color: Colors.grey[700], size: 20), // Adjust size as needed
                      SizedBox(width: 8), // Adjust space as needed
                      Text(
                        'Los Angeles',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16, // Adjust font size as needed
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Multitasker, Serving & Liquor',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.people, color: Colors.grey[700], size: 20), // Adjust size as needed
                      SizedBox(width: 8), // Adjust space as needed
                      Text(
                        '5+',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16, // Adjust font size as needed
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8), // Adjust space as needed
                  Row(
                    children: [
                      Icon(Icons.local_drink, color: Colors.grey[700], size: 20), // Adjust size as needed
                      SizedBox(width: 8), // Adjust space as needed
                      Text(
                        'Decanter’s, Mixology, Spoon',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16, // Adjust font size as needed
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.room_service_rounded, color: Colors.grey[700], size: 20), // Adjust size as needed
                      SizedBox(width: 8), // Adjust space as needed
                      Text(
                        'Sit-down',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16, // Adjust font size as needed
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8), // Adjust space as needed
                  Row(
                    children: [
                      Icon(Icons.numbers, color: Colors.grey[700], size: 20), // Adjust size as needed
                      SizedBox(width: 8), // Adjust space as needed
                      Text(
                        'NA',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16, // Adjust font size as needed
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Message/Special instructions',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.message, color: Colors.grey[700], size: 20), // Adjust size as needed
                      SizedBox(width: 8), // Adjust space as needed
                      Flexible( // Wrap Text with Flexible
                        child: Text(
                          'Booking is easy with our online booking form or by calling 303-733-6996 to speak with one of our Event Managers.',
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 16, // Adjust font size as needed
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Add more widgets as needed
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
                items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.square_list),
            label: 'Planner',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}


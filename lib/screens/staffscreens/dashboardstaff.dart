import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bartenders_and_more/widgets/clientside/dashboardwidgetsclient.dart';
import 'package:bartenders_and_more/widgets/staffside/staffCards.dart';

class DashboardStaff extends StatefulWidget {
  @override
  _DashboardStaffState createState() => _DashboardStaffState();
}

class _DashboardStaffState extends State<DashboardStaff> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, String>> currentEvents = [
    {
      'name': 'House Party',
      'date': 'Jan 17, 2024',
      'location': 'Park View',
    },
    {
      'name': 'Wedding',
      'date': 'Jan 20, 2024',
      'location': 'Park View',
    },
    {
      'name': 'Pool party',
      'date': 'Jan 26, 2024',
      'location': 'Park View',
    },
    {
      'name': 'House Party',
      'date': 'Jan 17, 2024',
      'location': 'Park View',
    },
    // Add more events as needed
  ];

  final List<Map<String, dynamic>> teams = [
    {
      'imagePath': 'assets/images/teamImage.png',
      'teamName': 'Pink Team',
      'rating': 4.9,
      'location': 'Brookline, MA',
      'experience': '10 yrs of experience',
    },
    {
      'imagePath': 'assets/images/teamImage.png',
      'teamName': 'Blue Team',
      'rating': 4.7,
      'location': 'Cambridge, MA',
      'experience': '8 yrs of experience',
    },
    {
      'imagePath': 'assets/images/teamImage.png',
      'teamName': 'Blue Team',
      'rating': 4.7,
      'location': 'Cambridge, MA',
      'experience': '8 yrs of experience',
    },
    // Add more team maps as needed
  ];

  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void dispose() {
    // Make sure to dispose the controller when the widget is removed from the widget tree
    _searchController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Welcome, Jonathan', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: Icon(CupertinoIcons.line_horizontal_3, color: Colors.white,), // For the menu icon
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 80.0), // Bottom padding for the fixed button
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search here for new events',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.black, // Slightly transparent white
                  suffixIcon: IconButton(icon: Icon(Icons.search, color: Colors.grey),onPressed: () {}),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none, // No border when the TextField is not focused
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.grey, width: 1.0), // Grey border when the TextField is enabled (not focused)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0), // Blue border when the TextField is focused
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text('New Event(s)', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            NewEventsCard(
              title: 'House Party',
              date: 'Jan 17, 2024',
              postTime: '6 min ago',
              location: 'Park View',
              description: 'Im looking for a really simple minimal ecommerce shopify website custom coded...'
                          'Not looking for a typical usual theme you see everywhere, my inspir...',
              isVerified: true,
            ),
            NewEventsCard(
              title: 'House Party',
              date: 'Jan 17, 2024',
              postTime: '6 min ago',
              location: 'Park View',
              description: 'Im looking for a really simple minimal ecommerce shopify website custom coded...'
                          'Not looking for a typical usual theme you see everywhere, my inspir...',
              isVerified: true,
            ),
            SizedBox(height: 16),
           Container(
              color: Color.fromARGB(255, 23, 23, 23), // Slightly lighter black color
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
              margin: EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Current Event(s)', style: TextStyle(color: Colors.white, fontSize: 16)),
                      TextButton(
                        onPressed: () {
                          // TODO: Navigate to view all events
                        },
                        child: Text('View All', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                  Container(
                    height: 175, // Adjust the height to fit the event card
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: currentEvents.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: 180, // Fixed width for each card
                          padding: EdgeInsets.only(right: index == currentEvents.length - 1 ? 16.0 : 0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/profileHire');
                            },
                            child: EventCard(
                            eventName: currentEvents[index]['name']!,
                            eventDate: currentEvents[index]['date']!,
                            eventLocation: currentEvents[index]['location']!,
                          ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            
            // ... Add other widgets ...
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
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

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bartenders_and_more/widgets/clientside/dashboardwidgetsclient.dart';

class DashboardClient extends StatefulWidget {
  @override
  _DashboardClientState createState() => _DashboardClientState();
}

class _DashboardClientState extends State<DashboardClient> {
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
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/dashboardHomeImage.png', // Replace with your image asset or network image
                    width: double.infinity,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 140,
                  left: 10,
                  child: Text(
                    'Post A New Event',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(0, 1),
                          blurRadius: 3.0,
                          color: Color.fromARGB(150, 0, 0, 0),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 80,
                  left: 10,
                  right: 10,
                  child: Text(
                    'It is a long established fact that a reader will be distracted by the readable content.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(0, 1),
                          blurRadius: 3.0,
                          color: Color.fromARGB(150, 0, 0, 0),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 16,
                  right: 16,
                  child: Container(
                    width: double.infinity, // Full-width button
                    height: 36, // Fixed height
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
                        Navigator.pushNamed(context, '/searchResults');
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search here for bartenders',
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
           Container(
              color: Colors.grey[900], // Slightly lighter black color
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
              margin: EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Current Event(s)', style: TextStyle(color: Colors.white, fontSize: 18)),
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
                          width: 200, // Fixed width for each card
                          padding: EdgeInsets.only(right: index == currentEvents.length - 1 ? 16.0 : 0),
                          child: EventCard(
                            eventName: currentEvents[index]['name']!,
                            eventDate: currentEvents[index]['date']!,
                            eventLocation: currentEvents[index]['location']!,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.grey[900], // Slightly lighter black color
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
              margin: EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Explore Dream Teams', style: TextStyle(color: Colors.white, fontSize: 18)),
                      TextButton(
                        onPressed: () {
                          // TODO: Navigate to view all events
                        },
                        child: Text('View All', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                  Container(
                    height: 170, // Adjust the height to fit the event card
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: teams.length,
                      itemBuilder: (BuildContext context, int index) {
                        final team = teams[index];
                        return Container(
                          width: 200, // Fixed width for each card
                          padding: EdgeInsets.only(right: index == teams.length - 1 ? 16.0 : 0),
                          child: TeamCard(
                            imagePath: team['imagePath'],
                            teamName: team['teamName'],
                            rating: team['rating'],
                            location: team['location'],
                            experience: team['experience'],
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

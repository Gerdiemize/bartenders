import 'package:bartenders_and_more/widgets/staffside/staffCards.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bartenders_and_more/widgets/clientside/dashboardwidgetsclient.dart';

class EventSearchResults extends StatefulWidget {
  @override
  _EventSearchResultsState createState() => _EventSearchResultsState();
}

class _EventSearchResultsState extends State<EventSearchResults> {
  final TextEditingController _searchController = TextEditingController();

  final List<Event> events = [
    Event(
      imagePath: 'assets/images/girlSearchResult.png',
      vendorName: 'Miriane Piers',
      rating: 4.9,
      experience: '10 yrs of experience',
      location: 'Brookline, MA',
      price: 'From 25/hr',
    ),
    // Add other events here...
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
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 32.0, bottom: 16.0),
              child: TextField(
                controller: _searchController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search here for events',
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
            Expanded(
              child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                // Get the event data for the current index
                //final event = events[index];
                return Container(
                  height: 200,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/eventApplyDetails');
                    },
                    child: NewEventsCard(
                      title: "House Party",// event.imagePath,
                      date: "Jan 17, 2024",// event.vendorName,
                      postTime: "4 min ago",// event.rating,
                      location: "Syrus",// event.experience,
                      description:"Im looking for a really simple minimal ecommerce shopify website custom coded...'Not looking for a typical usual theme you see everywhere, my inspir...",// event.location,
                      isVerified: true,// event.price,
                    ),
                  ),
                );
              },
            ),
            )
          ],
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


class Event {
  final String imagePath;
  final String vendorName;
  final double rating;
  final String experience;
  final String location;
  final String price;

  Event({
    required this.imagePath,
    required this.vendorName,
    required this.rating,
    required this.experience,
    required this.location,
    required this.price,
  });
}


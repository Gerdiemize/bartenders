import 'package:flutter/material.dart';

class EventDetailsStaff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('House party', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Party Details',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  detailRow(icon: Icons.access_time, text: 'Post: 6 min ago', iconColor: Colors.grey),
                  detailRow(icon: Icons.check_circle, text: 'Verified', iconColor: Colors.green),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                    child: Text(
                      'Event date & Start time',
                      style: TextStyle(color: Color(0xFFCCDFD3), fontWeight: FontWeight.normal, fontSize: 16),
                    ),
                  ),
                  detailRow(icon: Icons.calendar_today, text: '21/12/2023', iconColor: Colors.grey),
                  detailRow(icon: Icons.watch_later, text: '10:00 AM', iconColor: Colors.grey),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                    child: Text(
                      'Message/Special instructions',
                      style: TextStyle(color: Color(0xFFCCDFD3), fontWeight: FontWeight.normal, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'I’m looking for a really simple minimal ecommerce shopify website custom coded'
                      'Not looking for a typical usual theme you see everywhere, my inspiration for my'
                      'website are the links below.\n\n'
                      'Please have a look and if it’s something you can do please apply if not don’t bother'
                      'please I want to develop and create something special',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                    child: Text(
                      'Guest arrival & entry and Number of guest',
                      style: TextStyle(color: Color(0xFFCCDFD3), fontWeight: FontWeight.normal, fontSize: 16),
                    ),
                  ),
                  detailRow(icon: Icons.access_time, text: '10:00 AM', iconColor: Colors.grey),
                  detailRow(icon: Icons.access_time, text: '11:00 AM', iconColor: Colors.grey),
                  detailRow(icon: Icons.people, text: '21/12/2023', iconColor: Colors.grey),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                    child: Text(
                      'Venue name & location',
                      style: TextStyle(color: Colors.grey[200], fontWeight: FontWeight.normal, fontSize: 16),
                    ),
                  ),
                  detailRow(icon: Icons.calendar_today, text: 'Park View', iconColor: Colors.grey),
                  detailRow(icon: Icons.location_city, text: 'Los Angeles', iconColor: Colors.grey),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                    child: Text(
                      'Multitasker, Serving & Liquor',
                      style: TextStyle(color: Colors.grey[200], fontWeight: FontWeight.normal, fontSize: 16),
                    ),
                  ),
                  detailRow(icon: Icons.people, text: '5+', iconColor: Colors.grey),
                  detailRow(icon: Icons.wine_bar, text: 'Decanter’s, Mixology, Spoon', iconColor: Colors.grey),
                  detailRow(icon: Icons.chair, text: 'Sit Down', iconColor: Colors.grey),
                  detailRow(icon: Icons.timer, text: 'NA', iconColor: Colors.grey),
                  // Add more widgets for additional content
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 48, // Fixed height for the button
              width: double.infinity, // The button will expand to fill the width of the Container
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), // Rounded corners
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFF85603F), Color(0xFFE8DABF), Color(0xFF85603F)], // Gradient colors
                ),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/applyStaff'); // Update the navigation if needed
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Apply Now',
                      style: TextStyle(
                        color: Colors.black, // Text color
                        fontSize: 16, // Font size
                      ),
                    ),
                    SizedBox(width: 8), // Spacing between text and icon
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.black, // Icon color
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  onSurface: Colors.transparent,
                  shadowColor: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0), // Padding
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black, // Adjust the color to match your design
    );
  }

  Widget detailRow({required IconData icon, required String text, required Color iconColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 20.0), // Adjust the icon size as needed
          SizedBox(width: 8.0), // Space between the icon and the text
          Text(text, style: TextStyle(color: Color(0xF1F1F1F1), fontSize: 14.0)), // Adjust text style as needed
        ],
      ),
    );
  }
}

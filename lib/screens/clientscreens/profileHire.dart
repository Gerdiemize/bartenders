import 'package:flutter/material.dart';
import 'package:bartenders_and_more/widgets/clientside/dashboardwidgetsclient.dart';

class ProfileHireScreen extends StatefulWidget {
  @override
  _ProfileHireScreenState createState() => _ProfileHireScreenState();
}

class _ProfileHireScreenState extends State<ProfileHireScreen> {
  late Future<ProfileData> profileData;

  @override
  void initState() {
    super.initState();
    profileData = getProfileData(); // Your async function to fetch profile data
  }

  Future<ProfileData> getProfileData() async {
    // Simulate a database call and delay
    await Future.delayed(Duration(seconds: 2));
    // Return fake data, replace with your actual database call
    return ProfileData(
      imagePath: 'assets/images/girlSearchResult.png',
      vendorName: 'Miriane Piers',
      rating: 4.9,
      experience: 'MVP Product design',
      location: 'Brookline, MA, USA.',
      price: '\$25/hr',
      // Add additional data needed for the new sections
      coverLetter: 'I am a specialist in (MVP Product design) Websites, Landing pages & Web App design or redesign for small businesses.',
      proposedBid: '\$20/hr',
      services: ['Serving', 'Serving', 'Serving'], // Replace with actual list of services
      equipment: ['Decanter\'s', 'Mixology', 'Decanter\'s', 'Mixology'], // Replace with actual list of equipment
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Miriane Piers'),
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
      body: FutureBuilder<ProfileData>(
        future: profileData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ProfileHireCard(
                    imagePath: snapshot.data!.imagePath,
                    vendorName: snapshot.data!.vendorName,
                    rating: snapshot.data!.rating,
                    experience: snapshot.data!.experience,
                    location: snapshot.data!.location,
                    price: snapshot.data!.price,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Cover letter:', style: TextStyle(color: Colors.white, fontSize: 16)),
                        Text(snapshot.data!.coverLetter, style: TextStyle(color: Colors.grey)),
                        SizedBox(height: 8),
                        Text('Proposed bid:', style: TextStyle(color: Colors.white, fontSize: 16)),
                        Text(snapshot.data!.proposedBid, style: TextStyle(color: Colors.grey)),
                        SizedBox(height: 8),
                        Text('Services:', style: TextStyle(color: Colors.white, fontSize: 16)),
                        ...snapshot.data!.services.map((service) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.0), // Reduced vertical padding
                          child: Row(
                            children: [
                              Icon(Icons.check, color: Colors.green, size: 20), // You can adjust the size as needed
                              SizedBox(width: 8), // Adjust the spacing as needed
                              Text(service, style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                        )),
                        SizedBox(height: 8),
                        Text('Equipment\'s:', style: TextStyle(color: Colors.white, fontSize: 16)),
                        ...snapshot.data!.equipment.map((equipment) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.0), // Reduced vertical padding
                          child: Row(
                            children: [
                              Icon(
                                equipment.startsWith('X') ? Icons.close : Icons.check,
                                color: equipment.startsWith('X') ? Colors.red : Colors.green,
                                size: 20, // You can adjust the size as needed
                              ),
                              SizedBox(width: 8), // Adjust the spacing as needed
                              Text(equipment.replaceFirst('X ', ''), style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                        )),
                        SizedBox(height: 8), // Add space before the "About" section
                        Container(
                          padding: EdgeInsets.all(8.0),
                          margin: EdgeInsets.only(bottom: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.black, // Adjust the color to match your design
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'About Miriane Pires',
                                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(Icons.work, color: Colors.white, size: 20),
                                  SizedBox(width: 8),
                                  Text(
                                    '10 yrs of experience',
                                    style: TextStyle(color: Colors.grey[400]),
                                  ),
                                  Spacer(), // Use spacer to push the vaccine info to the end of the row
                                  Icon(Icons.check_circle, color: Colors.green, size: 20),
                                  SizedBox(width: 4),
                                  Text(
                                    'Covid-19 vaccinated',
                                    style: TextStyle(color: Colors.grey[400]),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                'I am a specialist in (MVP Product design) Websites, Landing pages & Web App design or redesign for small businesses.',
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(height: 12),
                              buildDetailRow('Date of birth:', '21/12/2002'),
                              buildDetailRow('Gender:', 'Female'),
                              buildDetailRow('Language:', 'English, Spanish & Italian'),
                              buildDetailRow('Availability:', 'Monday - Saturday'),
                              buildDetailRow('Unavailable dates:', 'Sunday'),
                              buildDetailRow('Available hours:', '8:00 AM - 9:00 PM'),
                              buildDetailRow('Service area:', 'Miami, FL'),
                            ],
                          ),
                        ),
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
                                Navigator.pushNamed(context, '/currentEventDetails');
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min, // Use only the minimum space needed
                                children: <Widget>[
                                  Text(
                                    'Hire Miriane',
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
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text('No data found'));
          }
        },
      ),
    );
  }
}

class ProfileData {
  final String imagePath;
  final String vendorName;
  final double rating;
  final String experience;
  final String location;
  final String price;
  final String coverLetter;
  final String proposedBid;
  final List<String> services;
  final List<String> equipment;

  ProfileData({
    required this.imagePath,
    required this.vendorName,
    required this.rating,
    required this.experience,
    required this.location,
    required this.price,
    required this.coverLetter,
    required this.proposedBid,
    required this.services,
    required this.equipment,
  });
}

Widget buildDetailRow(String title, String detail) {
  return Padding(
    padding: const EdgeInsets.only(top: 4.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(width: 8),
        Text(
          detail,
          style: TextStyle(color: Colors.white),
        ),
      ],
    ),
  );
}


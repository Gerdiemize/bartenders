import 'package:flutter/material.dart';

class ApplyStaff extends StatefulWidget {
  @override
  _ApplyStaffState createState() => _ApplyStaffState();
}

class _ApplyStaffState extends State<ApplyStaff> {
  // Use a Map or a custom class to track the state of each checkbox
  Map<String, bool> equipment = {
    'Decanter’s': false,
    'Mixology': false,
  };

  Widget equipmentCheckbox(String title, bool value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: (bool? newValue) {
              setState(() {
                equipment[title] = newValue!;
              });
            },
            activeColor: Colors.green,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.grey[200], fontSize: 16),
          ),
        ],
      ),
    );
  }
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
                      'website are the links below.',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Hourly rate',
                style: TextStyle(color: Colors.grey[200], fontWeight: FontWeight.normal, fontSize: 16),
              ),
            ),
            rateInputField('20.00/hr'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Cover letter',
                style: TextStyle(color: Colors.grey[200], fontWeight: FontWeight.normal, fontSize: 16),
              ),
            ),
            coverLetterInputField(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Services you are going to offer',
                style: TextStyle(color: Colors.grey[200], fontWeight: FontWeight.normal, fontSize: 16),
              ),
            ),
            servicesInputField(),
            Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Equipment\'s you will bring with you',
                      style: TextStyle(color: Colors.grey[200], fontWeight: FontWeight.normal, fontSize: 16),
                    ),
                  ),
                  ...equipment.keys.map((String key) {
                    return equipmentCheckbox(key, equipment[key]!);
                  }).toList(),
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
                  Navigator.pushNamed(context, '/eventSearchResults'); // Update the navigation if needed
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

Widget rateInputField(String rate) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.black, // Change background color to black
        border: Border.all(color: Colors.grey), // Add grey border
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextFormField(
        initialValue: rate,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
      ),
    ),
  );
}

Widget coverLetterInputField() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.black, // Change background color to black
        border: Border.all(color: Colors.grey), // Add grey border
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: 5,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Write here',
          hintStyle: TextStyle(color: Colors.grey[500]),
          border: InputBorder.none,
        ),
      ),
    ),
  );
}

Widget servicesInputField() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.black, // Change background color to black
        border: Border.all(color: Colors.grey), // Add grey border
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Enter services',
          hintStyle: TextStyle(color: Colors.grey[500]),
          border: InputBorder.none,
        ),
      ),
    ),
  );
}

  



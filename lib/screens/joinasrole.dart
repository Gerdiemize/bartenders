import 'package:flutter/material.dart';

enum Role { client, staff }

class JoinAsRoleScreen extends StatefulWidget {
  @override
  _JoinAsRoleScreenState createState() => _JoinAsRoleScreenState();
}

class _JoinAsRoleScreenState extends State<JoinAsRoleScreen> {
  Role? _selectedRole = Role.client;

  void _onContinuePressed() {
    if (_selectedRole == Role.client) {
      Navigator.pushNamed(context, '/joinClient'); // Navigate to the Location screen if 'client' is selected
    } else {
      Navigator.pushNamed(context, '/joinStaff');
      // Handle the 'staff' role or show an alert if no role is selected
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Join as a Client or Staff',
              style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              'Are you planning an event or looking to work one? Let us know what you\'re here for.',
              style: TextStyle(color: Colors.grey, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            Card(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0), // Add padding inside the Card
                child: Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor: Colors.grey, // Set the color for the unselected state
                  ),
                  child: RadioListTile<Role>(
                    activeColor: Colors.white, // Color for the selected radio button
                    title: const Text('I am a client, hiring for a party', style: TextStyle(color: Colors.white)),
                    value: Role.client,
                    groupValue: _selectedRole,
                    onChanged: (Role? value) {
                      setState(() {
                        _selectedRole = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 16), // Spacing between the radio buttons
            Card(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0), // Add padding inside the Card
                child: Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor: Colors.grey, // Set the color for the unselected state
                  ),
                  child: RadioListTile<Role>(
                    activeColor: Colors.white, // Color for the selected radio button
                    title: const Text('I am staff member, looking for work', style: TextStyle(color: Colors.white)),
                    value: Role.staff,
                    groupValue: _selectedRole,
                    onChanged: (Role? value) {
                      setState(() {
                        _selectedRole = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 32),
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
                onPressed: _onContinuePressed,
                child: Row(
                  mainAxisSize: MainAxisSize.min, // Use only the minimum space needed
                  children: <Widget>[
                    Text(
                      'Continue',
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
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/signin'); // Replace '/signin' with your route's name to sign-in screen
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

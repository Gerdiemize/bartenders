import 'package:flutter/material.dart';

class CreateNewPassword extends StatelessWidget {
  final TextEditingController repeatPasswordController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void resetPasswordButtonPressed(BuildContext context) {
    // Get user input from controllers

    String repeatPassword = repeatPasswordController.text;
    String password = passwordController.text;
    if (password == repeatPassword) {
      if (password.length >= 8 && repeatPassword.length >= 8){
        if (isPasswordComplex(password) && isPasswordComplex(repeatPassword)){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
          content: Text("$password and $repeatPassword are equal and longer than 8 characters"),
          ),
        );
        }else{
          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
          content: Text("$password and $repeatPassword don't complete the complexity requirements."),
          ),
        );
        }
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
        content: Text("$password and $repeatPassword are less than 8 characters."),
        ),
      );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
        content: Text("$password and $repeatPassword don't match."),
        ),
      );
    }
    

    // Navigate to the email verification screen
    //Navigator.pushNamed(context, '/emailVerification');
  }

  bool isPasswordComplex(String password) {
    // Minimum length requirement
    if (password.length < 8) {
      print("Password must be at least 8 characters long.");
      return false;
    }

    // Check for uppercase letters
    if (!password.contains(RegExp(r'[A-Z]'))) {
      print("Password must contain at least one uppercase letter.");
      return false;
    }

    // Check for lowercase letters
    if (!password.contains(RegExp(r'[a-z]'))) {
      print("Password must contain at least one lowercase letter.");
      return false;
    }

    // Check for numbers
    if (!password.contains(RegExp(r'[0-9]'))) {
      print("Password must contain at least one number.");
      return false;
    }

    // Check for special characters
    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      print("Password must contain at least one special character.");
      return false;
    }

    // If all criteria are met, the password is considered complex
    return true;
}
  @override
  void dispose() {
    repeatPasswordController.dispose();
    passwordController.dispose();
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 100),
              Text(
                'Create New Password',
                style: TextStyle(color: Colors.white, fontSize: 28),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Your new password must be different from previous used password.',
                style: TextStyle(color: Colors.grey, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Text(
                'Password',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(height: 10),
              TextField(
                controller: passwordController,
                obscureText: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  suffixIcon: Icon(Icons.visibility_off, color: Colors.grey),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Must be at least 8 characters ',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 20),
              Text(
                'Repeat Password',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(height: 10),
              TextField(
                controller: repeatPasswordController,
                obscureText: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Repeat your password',
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  suffixIcon: Icon(Icons.visibility_off, color: Colors.grey),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Both passwords must match ',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 30),
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
                    resetPasswordButtonPressed(context);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min, // Use only the minimum space needed
                    children: <Widget>[
                      Text(
                        'Reset Password',
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
            ],
          ),
        ),
      ),
    );
  }
}

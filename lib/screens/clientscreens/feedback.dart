import 'package:flutter/material.dart';

class FeedbackClientScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Feedback'),
        actions: [
          TextButton(
            onPressed: () {
              // Handle skip action
            },
            child: Text(
              'Skip',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Public feedback',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 8,),
            Text(
              'This feedback will be shared on Bartender profile',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 20),
            FeedbackCategory(title: 'Skills'),
            FeedbackCategory(title: 'Communications'),
            FeedbackCategory(title: 'Cooperations',),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Total Score: ',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                Text(
                  '4.00',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Share your experience with this talent',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'Write here',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4.0), // Half of the desired space between buttons
                    child: Container(
                      height: 48, // Fixed height
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30), // Adjust for rounded corners
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/termsClient');
                        },
                        child: Text(
                          'Decline',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent, // Make the button background transparent
                          onSurface: Colors.transparent, // Ensure overlay colors are transparent too
                          shadowColor: Colors.transparent, // No shadow for transparent background
                          elevation: 0, // Remove elevation
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30), // Match the container's border radius
                            side: BorderSide(color: Colors.grey), // Add grey border
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8), // The space between the buttons
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0), // Half of the desired space between buttons
                    child: Container(
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
                          Navigator.pushNamed(context, '/homeClient');
                        },
                        child: Text(
                          'Accept',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
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
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black, // Set the background color
    );
  }
}

class FeedbackCategory extends StatefulWidget {
  final String title;

  const FeedbackCategory({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _FeedbackCategoryState createState() => _FeedbackCategoryState();
}

class _FeedbackCategoryState extends State<FeedbackCategory> {
  int rating = 0; // Initial rating is 0

  @override
  Widget build(BuildContext context) {
    // Define the gradient colors for the stars
    final Shader starGradient = LinearGradient(
      colors: <Color>[Color(0xFF825B33), Color(0xFFE8DABF),Color(0xFF825B33)],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 4,),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(5, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    rating = index + 1;
                  });
                },
                child: ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: [Color(0xFF825B33), Color(0xFFE8DABF),Color(0xFF825B33)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds);
                  },
                  child: Icon(
                    index < rating ? Icons.star : Icons.star_border,
                    color: index < rating ? null : Colors.grey,
                    size: 36,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';

class MembershipScreen extends StatefulWidget {
  @override
  _MembershipScreenState createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // This assumes that the MembershipScreen was pushed onto the navigation stack.
          },
        ),
        backgroundColor: Colors.black, // Adjust the color to match your design
      ),
      backgroundColor: Colors.black, // Set the background color
      body: Center(
        child: MembershipWidget(),
      ),
    );
  }
}

class MembershipWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle priceStyle = TextStyle(
      fontSize: 28, // Adjust the font size for the price as needed
      fontWeight: FontWeight.bold,
    );
    final TextStyle timeStyle = TextStyle(
      fontSize: 18, // Adjust the font size for the 'month' as needed
    );
    final gradientColors = [Color(0xFF00AC26), Color(0xFF00E432)];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0), // Adjust padding as needed
      child: Column(
        mainAxisSize: MainAxisSize.min, // This constrains the column to the size of its children
        mainAxisAlignment: MainAxisAlignment.center, // This centers the children vertically
        crossAxisAlignment: CrossAxisAlignment.center, // This centers the children horizontally
        children: <Widget>[
          Text(
            'Be 5X more likely to be hired with premium Membership',
            textAlign: TextAlign.center, // Center align text
            style: TextStyle(
              color: Colors.white,
              fontSize: 24, // Adjust the font size as needed
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 24), // Adjust the spacing as needed
          Image.asset('assets/images/membership.png',width: 160,), // Replace with your asset image
          SizedBox(height: 24), // Adjust the spacing as needed
          GradientText(
            gradientColors: [
              Color(0xFF825B33), // Start color
              Color(0xFFE8DABF), // Middle color
              Color(0xFF825B33), // End color
            ],
            text: '\$14.90 ',
            textStyle: priceStyle,
            textForSmallerFont: '/ month',
            textStyleForSmallerFont: timeStyle,
          ),
          SizedBox(height: 16), // Adjust the spacing as needed
          ...List.generate(
            4,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0), // Adjust the padding as needed
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center align row content
                children: <Widget>[
                  GradientIcon(icon: Icons.check,size: 24.0, colors: gradientColors), // Adjust color as needed
                  SizedBox(width: 8), // Adjust the spacing as needed
                  Text(
                    'Be the first to know about new jobs.',
                    style: TextStyle(color: Colors.white), // Adjust the color as needed
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 64,),
          Text(
            'Renews at \$14.90 a month\nRecurring billing. Local taxes apply. Cancel anytime.',
            textAlign: TextAlign.center, // Center align text
            style: TextStyle(
              color: Colors.grey[500], // Adjust the color to match the design
              fontSize: 12, // Adjust the font size as needed
            ),
          ),
          SizedBox(height: 8), // Adjust the spacing as needed
          Container(
            height: 48, // Fixed height for the button
            width: double.infinity, // The button will expand to fill the width of the Container
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), // Rounded corners
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFF85603F), Color(0xFFE8DABF),Color(0xFF85603F)], // Adjust the gradient colors to match the design
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
                    'Subscribe',
                    style: TextStyle(
                      color: Colors.black, // Adjust the color to match the design
                      fontSize: 16, // Adjust the font size as needed
                    ),
                  ),
                  SizedBox(width: 8), // Adjust the spacing as needed
                  Icon(
                    Icons.arrow_forward, // Use the appropriate icon
                    color: Colors.black, // Adjust the color to match the design
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
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0), // Adjust padding as needed
              ),
            ),
          ),
          SizedBox(height: 8), // Adjust the spacing as needed
          TextButton(
            onPressed: () {
              // Handle the "No Thanks" action
            },
            child: Text(
              'No Thanks, proceed to required screening',
              style: TextStyle(
                color: Colors.grey[500], // Adjust the color to match the design
                decoration: TextDecoration.underline, // Underline the text
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  final List<Color> gradientColors;
  final String text;
  final TextStyle textStyle;
  final String? textForSmallerFont;
  final TextStyle? textStyleForSmallerFont;

  GradientText({
    Key? key,
    required this.gradientColors,
    required this.text,
    required this.textStyle,
    this.textForSmallerFont,
    this.textStyleForSmallerFont,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: gradientColors,
        ).createShader(bounds);
      },
      child: RichText(
        text: TextSpan(
          style: textStyle.copyWith(color: Colors.white),
          children: [
            TextSpan(
              text: text,
            ),
            if (textForSmallerFont != null)
              TextSpan(
                text: textForSmallerFont,
                style: textStyleForSmallerFont,
              ),
          ],
        ),
      ),
    );
  }
}

class GradientIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final List<Color> colors;

  const GradientIcon({
    Key? key,
    required this.icon,
    required this.size,
    required this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: colors,
        ).createShader(bounds);
      },
      child: Icon(
        icon,
        size: size,
        color: Colors.white, // This color will be overridden by the shader
      ),
    );
  }
}



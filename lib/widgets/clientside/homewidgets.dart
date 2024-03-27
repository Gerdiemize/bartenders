import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PartyTypeCard extends StatelessWidget {
  final String iconAsset; // Now it should be the path to the SVG asset
  final String label;
  final bool isSelected;
  final VoidCallback onSelect;

  const PartyTypeCard({
    Key? key,
    required this.iconAsset, // Change this
    required this.label,
    required this.isSelected,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        width: 100, // Adjust the width based on your UI design
        padding: EdgeInsets.symmetric(horizontal: 8), // Add padding as needed
        margin: EdgeInsets.all(4), // Add margin as needed
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ? const Color.fromARGB(255, 252, 207, 72) : Colors.grey),
          borderRadius: BorderRadius.circular(8), // Match to your design
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              iconAsset,
              color: Colors.white,
              width: 40, // Set your SVG icon size here
              height: 40, // Set your SVG icon size here
            ),
            Text(label, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}



class ServicesGrid extends StatefulWidget {
  final Function(String, double, String) updateSelectedServices;
  final Function(String) removeServ;

  ServicesGrid({Key? key, required this.updateSelectedServices, required this.removeServ}) : super(key: key);
  @override
  _ServicesGridState createState() => _ServicesGridState();
}

class _ServicesGridState extends State<ServicesGrid> {
  final List<Map<String, dynamic>> services = [
    {'icon': 'assets/serviceIcons/bartender.svg', 'label': 'Bartender', 'isSelected': false},
    {'icon': 'assets/serviceIcons/server.svg', 'label': 'Server', 'isSelected': false},
    {'icon': 'assets/serviceIcons/chef.svg', 'label': 'Chef', 'isSelected': false},
    {'icon': 'assets/serviceIcons/dj.svg', 'label': 'DJ', 'isSelected': false},
    {'icon': 'assets/serviceIcons/eventPlanner.svg', 'label': 'Planner', 'isSelected': false},
    {'icon': 'assets/serviceIcons/security.svg', 'label': 'Security', 'isSelected': false},
    {'icon': 'assets/serviceIcons/host.svg', 'label': 'Host', 'isSelected': false},
    {'icon': 'assets/serviceIcons/clean-up.svg', 'label': 'Clean-up', 'isSelected': false},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true, // Use it to prevent the GridView from expanding infinitely.
      physics: NeverScrollableScrollPhysics(), // To disable GridView's scrolling
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // Adjust number of columns to fit your design
        childAspectRatio: 1, // Adjust child aspect ratio to fit your design
      ),
      itemCount: services.length,
      itemBuilder: (context, index) {
        final service = services[index];
        final iconPath = service['icon'];
        print(iconPath);
        return GestureDetector(
          onTap: () {
            setState(() {
              service['isSelected'] = !service['isSelected'];
              if (services[index]['isSelected']) {
                widget.updateSelectedServices(services[index]['label'], 120, services[index]['icon']); // Example price
              }
              if (!services[index]['isSelected']) {
                widget.removeServ(services[index]['label']);
              }
            });
          },
          child: Card(
            color: service['isSelected'] ? const Color.fromARGB(255, 159, 159, 159) : Colors.grey[800],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  iconPath, // Use the SVG asset path
                  color: Colors.white,
                  width: 36, // Adjust the size accordingly
                  height: 36, // Adjust the size accordingly
                ),
                Text(
                  service['label'],
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ServiceEstimateCard extends StatelessWidget {
  final String service;
  final String iconServ;
  final int count;
  final double price;
  final VoidCallback onAdd;
  final VoidCallback onSubtract;
  final VoidCallback onRemoveCard; // Callback to remove the card

  const ServiceEstimateCard({
    Key? key,
    required this.service,
    required this.iconServ,
    required this.count,
    required this.price,
    required this.onAdd,
    required this.onSubtract,
    required this.onRemoveCard, // Added parameter for removing the card
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[850],
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SvgPicture.asset(
              iconServ, // Use the SVG asset path
              color: Colors.white,
              width: 36, // Adjust the size accordingly
              height: 36, // Adjust the size accordingly
            ),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                service,
                style: TextStyle(color: Colors.white),
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: onRemoveCard,
            ),
            IconButton(
              icon: Icon(Icons.remove, color: Colors.white),
              onPressed: onSubtract,
            ),
            Text(
              '$count',
              style: TextStyle(color: Colors.white),
            ),
            IconButton(
              icon: Icon(Icons.add, color: Colors.white),
              onPressed: onAdd,
            ),
            Text(
              '\$$price',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}


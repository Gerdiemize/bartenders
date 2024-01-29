import 'package:flutter/material.dart';

class PartyTypeCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onSelect;

  const PartyTypeCard({
    Key? key,
    required this.icon,
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
          // Gradient border when selected
          
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 40, color: Colors.white), // Icon size and color can be adjusted
            Text(label, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}


class ServicesGrid extends StatefulWidget {
  final Function(String, double, IconData) updateSelectedServices;
  final Function(String) removeServ;

  ServicesGrid({Key? key, required this.updateSelectedServices, required this.removeServ}) : super(key: key);
  @override
  _ServicesGridState createState() => _ServicesGridState();
}

class _ServicesGridState extends State<ServicesGrid> {
  final List<Map<String, dynamic>> services = [
    {'icon': Icons.local_bar, 'label': 'Bartender', 'isSelected': false},
    {'icon': Icons.restaurant, 'label': 'Server', 'isSelected': false},
    {'icon': Icons.kitchen, 'label': 'Chef', 'isSelected': false},
    {'icon': Icons.music_note, 'label': 'DJ', 'isSelected': false},
    {'icon': Icons.event, 'label': 'Planner', 'isSelected': false},
    {'icon': Icons.security, 'label': 'Security', 'isSelected': false},
    {'icon': Icons.star, 'label': 'Host', 'isSelected': false},
    {'icon': Icons.cleaning_services, 'label': 'Clean-up', 'isSelected': false},
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
                Icon(service['icon'], color: Colors.white),
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
  final IconData iconServ;
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
            Icon(iconServ, color: Colors.white), // Replace with appropriate icon
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


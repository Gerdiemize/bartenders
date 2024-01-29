import 'dart:developer';

import 'package:bartenders_and_more/screens/clientscreens/partyDetails.dart';
import 'package:flutter/material.dart';
import 'package:bartenders_and_more/widgets/clientside/homewidgets.dart';

class HomeClientScreen extends StatefulWidget {
  @override
  _HomeClientScreenState createState() => _HomeClientScreenState();
}

class _HomeClientScreenState extends State<HomeClientScreen> {
  int numberOfBartenders = 1;
  double pricePerBartender = 120;
  String selectedPartyType = 'House';
  List<Map<String, dynamic>> selectedServices = [];

  void proceedButtonPressed(BuildContext context) {
    // Initialize a Map to store counts for each service
    Map<String, int> serviceCounts = {};

    if ( selectedServices.isNotEmpty){
      for (var service in selectedServices) {
        String serviceType = service["service"];
        int count = service["count"];

        // Update the count for the service type
        serviceCounts[serviceType] = (serviceCounts[serviceType] ?? 0) + count;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
        content: Text(selectedPartyType+serviceCounts.toString()),
        ),
      );
      //Navigator.pushNamed(context, '/partyDetails');
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
        content: Text("Please select a party type and the required services for your event."),
        ),
      );
    }
  }

  void updateSelectedServices(String service, double price, IconData iconDisp) {
  // Here you would add logic to update the selectedServices list based on user actions
  setState(() {
    selectedServices.add({
      'service': service,
      'icon': iconDisp,
      'count': 1,
      'price': price,
    });
  });
}

  void removeService(String serviceLabel) {
    print(serviceLabel);
    setState(() {
      selectedServices.removeWhere((service) => service['service'] == serviceLabel);
    });
    print(selectedServices);
  }

  void addServiceCount(String serviceLabel) {
  setState(() {
    for (var service in selectedServices) {
      if (service['service'] == serviceLabel) {
        print(service['count']);
        service['count']++;
        print('after');
        print(service['count']);
        break; // Exit the loop after updating the service count
      }
    }
  });
}

void subtractServiceCount(String serviceLabel) {
  setState(() {
    for (var service in selectedServices) {
      if (service['service'] == serviceLabel && service['count'] > 1) {
        service['count']--;
        break; // Exit the loop after updating the service count
      }
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.black,
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/avatarPlaceholder.png'), // Replace with your image URL
              // If you have the image as an asset, use AssetImage('path/to/asset')
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
        children: [
          Expanded(
        child:  SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 70.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Party Type',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Choose the setting for your celebration',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              SizedBox(height: 10),
              Container(
              height: 100, // Adjust the height to fit your design
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  PartyTypeCard(
                    icon: Icons.house,
                    label: 'House',
                    isSelected: selectedPartyType == 'House',
                    onSelect: () {
                      setState(() {
                        selectedPartyType = 'House';
                      });
                    },
                  ),
                  PartyTypeCard(
                    icon: Icons.favorite,
                    label: 'Wedding',
                    isSelected: selectedPartyType == 'Wedding',
                    onSelect: () {
                      setState(() {
                        selectedPartyType = 'Wedding';
                      });
                    },
                  ),
                  PartyTypeCard(
                    icon: Icons.business,
                    label: 'Corporate',
                    isSelected: selectedPartyType == 'Corporate',
                    onSelect: () {
                      setState(() {
                        selectedPartyType = 'Corporate';
                      });
                    },
                  ),
                  PartyTypeCard(
                    icon: Icons.business,
                    label: 'Corporate',
                    isSelected: selectedPartyType == 'Corporate',
                    onSelect: () {
                      setState(() {
                        selectedPartyType = 'Corporate';
                      });
                    },
                  ),
                  PartyTypeCard(
                    icon: Icons.business,
                    label: 'Corporate',
                    isSelected: selectedPartyType == 'Corporate',
                    onSelect: () {
                      setState(() {
                        selectedPartyType = 'Corporate';
                      });
                    },
                  ),
                  // Add more PartyTypeCards as needed
                ],
              ),
            ),
              SizedBox(height: 24),
              Text(
                'Services',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Select from a range of professionals',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              SizedBox(height: 10),
              ServicesGrid(updateSelectedServices: updateSelectedServices, removeServ: removeService),
              SizedBox(height: 24),
              Text(
                'Estimate',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Review and manage the cost of your selected services',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...selectedServices.map((service) {
                    return ServiceEstimateCard(
                      service: service['service'],
                      iconServ: service['icon'],
                      count: service['count'],
                      price: service['price'],
                      onAdd: () {
                        addServiceCount(service['service']);
                      },
                      onSubtract: () {
                        subtractServiceCount(service['service']);
                      },
                      onRemoveCard: () {
                        removeService(service['service']);
                      },
                    );
                  }).toList(),
                ],
              ),
            ],
          ),
        ),
      ),
          ),
        ],
          ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Container(
            height: 50, // Height of your custom button
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(130, 91, 51, 1),
                  Color.fromRGBO(232, 218, 191, 1),
                  Color.fromRGBO(130, 91, 51, 1),
                ],
              ),
            ),
            child: ElevatedButton(
              onPressed: () {
                  proceedButtonPressed(context);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min, // Use only the minimum space needed
                  children: <Widget>[
                    Text(
                      "\$450 - Proceed   ",
                      style: TextStyle(
                        color: Colors.black, // Set the text color to black
                        fontSize: 18,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward, // Add arrow forward icon
                      color: Colors.black, // Set the icon color to black
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
              ),
            ),
          ),
        ),
      ],
      ), 
      
    );
  }
}

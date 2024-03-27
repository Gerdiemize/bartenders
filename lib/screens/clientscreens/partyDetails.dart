import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bartenders_and_more/widgets/progressbar.dart';

class PartyDetailsPage extends StatefulWidget {
  @override
  _PartyDetailsPageState createState() => _PartyDetailsPageState();
}

class _PartyDetailsPageState extends State<PartyDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  final _eventDateController = TextEditingController();
  final _eventStartTimeController = TextEditingController();
  final _guestArrivalTimeController = TextEditingController();
  final _guestEntryTimeController = TextEditingController();
  final _numberOfGuestsController = TextEditingController();
  final _nameOfVenueController = TextEditingController();
  final _eventLocationController = TextEditingController();
  final _requiredMultitaskerController = TextEditingController();

  @override
  void dispose() {
    _eventDateController.dispose();
    _eventStartTimeController.dispose();
    _guestArrivalTimeController.dispose();
    _guestEntryTimeController.dispose();
    _numberOfGuestsController.dispose();
    _nameOfVenueController.dispose();
    _eventLocationController.dispose();
    _requiredMultitaskerController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _eventDateController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Party Details', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                StepProgressBar(
                  totalSteps: 8,
                  currentStep: 6,
                  title: 'Looking to hire', // Add the title text
                  ),
                SizedBox(height: 10),
                Text(
                  'Event Date',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(height: 8),
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller: _eventDateController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'DD/MM/YYYY',
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        suffixIcon: Icon(Icons.calendar_today, color: Colors.grey),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter event date';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Event Start Time',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _eventStartTimeController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Enter event start time',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter event start time';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Guest Arrival Time',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            controller: _guestArrivalTimeController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Guest arrival time',
                              hintStyle: TextStyle(color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter guest arrival time';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Guest Entry Time',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            controller: _guestEntryTimeController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Guest entry time',
                              hintStyle: TextStyle(color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter guest entry time';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Number of Guests',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _numberOfGuestsController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Enter number of guests',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter number of guests';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text(
                  'Name of Venue',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _nameOfVenueController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Enter name of venue',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the name of venue';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text(
                  'Event Location (Address)',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _eventLocationController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Enter event location',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter event location';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text(
                  'Required Multitasker',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _requiredMultitaskerController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Enter required multitasker',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter required multitaskers';
                    }
                    return null;
                  },
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
                    Navigator.pushNamed(context, '/confirmPartyDetails');
                     /* if (_formKey.currentState!.validate()) {
                        // Process data
                      }*/
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min, // Use only the minimum space needed
                    children: <Widget>[
                      Text(
                        'Preview',
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
              SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:greenchargehub/auth/model.dart';
import 'package:provider/provider.dart';

import '../auth/controller.dart';

class BookingScreen extends StatefulWidget {
  final String admin;
  final String price;
  final String address;
  final String stationname;
  final String number;

  const BookingScreen({
    Key? key,
    required this.admin,
    required this.price,
    required this.address,
    required this.stationname,
    required this.number,
  }) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  late Map<String, TextEditingController> textEditingControllers;
  late Map<String, dynamic> bookingData;

  @override
  void initState() {
    super.initState();
    // Initialize the TextEditingController map
    textEditingControllers = {
      'name': TextEditingController(),
      'phone': TextEditingController(),
      'address': TextEditingController(text: widget.address),
      'stationName': TextEditingController(text: widget.stationname),
      'price': TextEditingController(text: widget.price),
      'time': TextEditingController(),
      'date': TextEditingController(),
      'admin': TextEditingController(text: widget.admin),
    };

    // Parse JSON data into a Dart object
    String jsonString = '''
    {
      "name": "",
      "phone": "",
      "address": "${widget.address}",
      "stationName": "${widget.stationname}",
      "price": "${widget.price}",
      "time": "",
      "date": "",
      "admin": "${widget.admin}",
      "_id": "",
      "__v": 0
    }
    ''';
    bookingData = jsonDecode(jsonString);

    // Set initial values for controllers based on bookingData
    textEditingControllers.forEach((key, controller) {
      controller.text = bookingData[key];
    });
  }

  @override
  void dispose() {
    // Dispose all TextEditingController instances to avoid memory leaks
    textEditingControllers.values.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInputField('Name', 'name'),
              _buildInputField('Phone', 'phone'),
              _buildInputField('Address', 'address'),
              _buildInputField('Station Name', 'stationName'),
              _buildInputField('Price', 'price'),
              _buildInputField('Time', 'time'),
              _buildInputField('Date', 'date'),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _saveBookingData,
                  child: Text('Save Booking'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, String key) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: textEditingControllers[key],
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          setState(() {
            bookingData[key] = value;
          });
        },
      ),
    );
  }

  void _saveBookingData() async {
    // Retrieve values from bookingData map
    String name = bookingData['name'];
    String phone = bookingData['phone'];
    String address = bookingData['address'];
    String stationName = bookingData['stationName'];
    String price = bookingData['price'];
    String time = bookingData['time'];
    String date = bookingData['date'];
    String admin = bookingData['admin'];
    String id = bookingData['_id'];
    int v = bookingData['__v'];

    // Create a new instance of Booking model
    Booking booking = Booking(
      name: name,
      phone: phone,
      address: address,
      stationName: stationName,
      price: price,
      time: time,
      date: date,
      admin: admin,
    );

    final mentorNotifier = Provider.of<OnBoardNotifier>(context, listen: false);
    await mentorNotifier.userconfslots(booking);




    // Now you can use the 'booking' object as needed, such as saving it to a database or performing other operations.
  }
}

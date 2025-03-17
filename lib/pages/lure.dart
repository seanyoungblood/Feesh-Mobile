import 'package:flutter/material.dart';
import '../components/app_logo.dart';
import '../components/nav_bar.dart';
import '../widgets/custom_button.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/mappings.dart';

class Lure extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<Lure> {
  final TextEditingController atempController = TextEditingController();
  final TextEditingController wtempController = TextEditingController();
  final TextEditingController windsController = TextEditingController();
  String dropdownValue1 = 'Select';
  String dropdownValue2 = 'Select';
  String dropdownValue3 = 'Select';
  String dropdownValue4 = 'Select';
  String dropdownValue5 = 'Select';
  String dropdownValue6 = 'Select';
  String dropdownValueLevel = 'Select';
  String dropdownValueDirection = 'Select';
  String dropdownValue7 = 'Select';
  List<dynamic>? response;

  Future<void> predictLure() async {
    final url = Uri.parse('https://feeshflaskdocker.onrender.com/predictLure');

    final mappedData = {
      'spot': dropdownValue1,
      'time': timeMapping[dropdownValue2] ?? dropdownValue2,
      'month': monthMapping[dropdownValue3] ?? dropdownValue3,
      'atemp': atempController.text,
      'wtemp': wtempController.text,
      'sky': skyMapping[dropdownValue4] ?? dropdownValue4,
      'hum': humidityMapping[dropdownValue5] ?? dropdownValue5,
      'windd': windDirectionMapping[dropdownValue6] ?? dropdownValue6,
      'winds': windsController.text,
      'level': tideLevelMapping[dropdownValueLevel] ?? dropdownValueLevel,
      'dir': tideDirectionMapping[dropdownValueDirection] ?? dropdownValueDirection,
      'color': waterColorMapping[dropdownValue7] ?? dropdownValue7
    };

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(mappedData),
    );

    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      if (decodedResponse.containsKey("error")) {
        setState(() {
          this.response = ["Error: Ensure all values are valid and present!"];
        });
      } else {
        setState(() {
          this.response = decodedResponse['result']; // Ensure this key exists
        });
      }

    } else {
      print('Error: ${response.statusCode} - ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Predict Lure", style: Theme.of(context).textTheme.headlineLarge),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: dropdownValue1,
                  items: ["Select", "Backcountry", "Beach", "Bridge", "Creek", "Docks", "Dropoff", "Flats", "Inlet",
                    "Island", "Pass", "Pier", "Shoreline", "Spillway"]
                      .map((e) => DropdownMenuItem(value: e, child: Text(e, style: TextStyle(color: Colors.blueAccent))))
                      .toList(),
                  onChanged: (value) {
                    setState(() => dropdownValue1 = value!);
                  },
                  dropdownColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Spot",
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: dropdownValue2,
                  items: ["Select", "Morning", "Afternoon", "Evening", "Night"]
                      .map((e) => DropdownMenuItem(value: e, child: Text(e, style: TextStyle(color: Colors.blueAccent))))
                      .toList(),
                  onChanged: (value) {
                    setState(() => dropdownValue2 = value!);
                  },
                  dropdownColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Time of Day",
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: dropdownValue3,
                  items: ["Select", "January", "February", "March", "April", "May",
                    "June", "July", "August", "September", "October", "November", "December"]
                      .map((e) => DropdownMenuItem(value: e, child: Text(e, style: TextStyle(color: Colors.blueAccent))))
                      .toList(),
                  onChanged: (value) {
                    setState(() => dropdownValue3 = value!);
                  },
                  dropdownColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Month",
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: atempController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Air Temperature",
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: wtempController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Water Temperature",
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: dropdownValue4,
                  items: ["Select", "Sunny", "Partly Sunny", "Partly Cloudy", "Cloudy", "Raining"]
                      .map((e) => DropdownMenuItem(value: e, child: Text(e, style: TextStyle(color: Colors.blueAccent))))
                      .toList(),
                  onChanged: (value) {
                    setState(() => dropdownValue4 = value!);
                  },
                  dropdownColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Sky Condition",
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: dropdownValue5,
                  items: ["Select", "Low", "Moderate", "High"]
                      .map((e) => DropdownMenuItem(value: e, child: Text(e, style: TextStyle(color: Colors.blueAccent))))
                      .toList(),
                  onChanged: (value) {
                    setState(() => dropdownValue5 = value!);
                  },
                  dropdownColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Humidity (optional)",
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: dropdownValue6,
                  items: ["Select", "N", "NE", "E", "SE", "S", "SW", "W", "NW"]
                      .map((e) => DropdownMenuItem(value: e, child: Text(e, style: TextStyle(color: Colors.blueAccent))))
                      .toList(),
                  onChanged: (value) {
                    setState(() => dropdownValue6 = value!);
                  },
                  dropdownColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Wind Direction",
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: windsController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Wind Speed",
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: dropdownValueLevel,
                  items: ["Select", "Low", "High", "N/A"]
                      .map((e) => DropdownMenuItem(value: e, child: Text(e, style: TextStyle(color: Colors.blueAccent))))
                      .toList(),
                  onChanged: (value) {
                    setState(() => dropdownValueLevel = value!);
                  },
                  dropdownColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Tidal Level (optional)",
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: dropdownValueDirection,
                  items: ["Select", "Rising", "Falling", "Slack", "N/A"]
                      .map((e) => DropdownMenuItem(value: e, child: Text(e, style: TextStyle(color: Colors.blueAccent))))
                      .toList(),
                  onChanged: (value) {
                    setState(() => dropdownValueDirection = value!);
                  },
                  dropdownColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Tidal Direction (optional)",
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: dropdownValue7,
                  items: ["Select", "Clear", "Stained", "Murky"]
                      .map((e) => DropdownMenuItem(value: e, child: Text(e, style: TextStyle(color: Colors.blueAccent))))
                      .toList(),
                  onChanged: (value) {
                    setState(() => dropdownValue7 = value!);
                  },
                  dropdownColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Water Color",
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                CustomButton(
                  text: "Submit",
                  onPressed: predictLure,
                ),
                SizedBox(height: 5),
                if (response != null) ...[
                  SizedBox(height: 20),
                  Text(
                    "Prediction Results:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: response!.map((res) {
                      List<String> parts = res.split(" "); // Split "ArtiShrimp 0.99374863"
                      if (parts.length == 2) {
                        String lureCode = parts[0]; // "ArtiShrimp"
                        double confidence = double.tryParse(parts[1]) ?? 0.0; // 0.99374863

                        // Convert lure code to user-friendly name
                        String lureName = lureMapping[lureCode] ?? lureCode;
                        String confidenceStr = (confidence * 100).toStringAsFixed(0); // "99%"

                        return Text(
                          "$lureName - $confidenceStr% confidence",
                          style: TextStyle(fontSize: 16),
                        );
                      }
                      return Text(res, style: TextStyle(fontSize: 16)); // Fallback if parsing fails
                    }).toList(),
                  ),
                ]
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}

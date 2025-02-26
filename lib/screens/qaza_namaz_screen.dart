// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, unnecessary_to_list_in_spreads

import 'package:flutter/material.dart';

class QazaNamazScreen extends StatefulWidget {
  @override
  _QazaNamazScreenState createState() => _QazaNamazScreenState();
}

class _QazaNamazScreenState extends State<QazaNamazScreen> {
  final Map<String, TextEditingController> _controllers = {
    'Fajr': TextEditingController(),
    'Dhuhr': TextEditingController(),
    'Asr': TextEditingController(),
    'Maghrib': TextEditingController(),
    'Isha': TextEditingController(),
  };

  int _totalQaza = 0;

  void _calculateTotalQaza() {
    int total = 0;
    _controllers.forEach((_, controller) {
      total += int.tryParse(controller.text) ?? 0;
    });

    setState(() {
      _totalQaza = total;
    });
  }

  void _resetFields() {
    _controllers.forEach((_, controller) => controller.clear());
    setState(() {
      _totalQaza = 0;
    });
  }

  @override
  void dispose() {
    _controllers.forEach((_, controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Qaza Namaz Tracker'),
        backgroundColor: Colors.green.shade700,
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter the number of missed prayers:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.02),
            ..._controllers.keys
                .map((prayer) => _buildInputField(prayer, size))
                .toList(),
            SizedBox(height: size.height * 0.03),
            Center(
              child: Text(
                'Total Qaza Namaz: $_totalQaza',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade700,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _calculateTotalQaza,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade700,
                  ),
                  child: Text(
                    'Calculate',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: _resetFields,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text('Reset', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String prayer, Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.007),
      child: TextField(
        controller: _controllers[prayer],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: '$prayer Missed Days',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.history, color: Colors.green.shade700),
        ),
      ),
    );
  }
}

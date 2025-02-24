// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class DashBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  _buildHeader(size),
                  SizedBox(height: size.height * 0.02),
                  _buildFeatureIcons(size),
                  SizedBox(height: size.height * 0.02),
                  _buildPrayerTimes(size),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(Size size) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
        vertical: size.height * 0.03,
      ),
      decoration: BoxDecoration(
        color: Colors.green.shade700,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Namaz Tracker',
            style: TextStyle(
              color: Colors.white,
              fontSize: size.width * 0.07,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: size.height * 0.005),
          Text(
            '15 Ramadan 1445',
            style: TextStyle(
              color: Colors.white70,
              fontSize: size.width * 0.04,
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Text(
            'Next Prayer: Fajr',
            style: TextStyle(
              color: Colors.white,
              fontSize: size.width * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'in 2h 30m',
            style: TextStyle(
              color: Colors.white70,
              fontSize: size.width * 0.04,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureIcons(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _featureIcon(Icons.explore, 'Qibla', size),
          _featureIcon(Icons.mosque, 'Nearby Masjid', size),
          _featureIcon(Icons.menu_book, 'Duas', size),
          _featureIcon(Icons.history, 'Qaza', size),
        ],
      ),
    );
  }

  Widget _featureIcon(IconData icon, String label, Size size) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: size.width * 0.08,
          child: Icon(
            icon,
            color: Colors.green.shade700,
            size: size.width * 0.07,
          ),
        ),
        SizedBox(height: size.height * 0.005),
        Text(
          label,
          style: TextStyle(color: Colors.black87, fontSize: size.width * 0.035),
        ),
      ],
    );
  }

  Widget _buildPrayerTimes(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Prayer Times',
            style: TextStyle(
              fontSize: size.width * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: size.height * 0.01),
          _prayerTimeTile('Fajr', '5:23 AM', size, isHighlighted: true),
          _prayerTimeTile('Sunrise', '6:45 AM', size),
          _prayerTimeTile('Dhuhr', '12:30 PM', size),
          _prayerTimeTile('Asr', '3:45 PM', size),
          _prayerTimeTile('Maghrib', '6:15 PM', size),
          _prayerTimeTile('Isha', '7:45 PM', size),
        ],
      ),
    );
  }

  Widget _prayerTimeTile(
    String prayer,
    String time,
    Size size, {
    bool isHighlighted = false,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: size.height * 0.01),
      padding: EdgeInsets.symmetric(
        vertical: size.height * 0.015,
        horizontal: size.width * 0.05,
      ),
      decoration: BoxDecoration(
        color: isHighlighted ? Colors.green.shade700 : Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            prayer,
            style: TextStyle(
              color: isHighlighted ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: size.width * 0.045,
            ),
          ),
          Row(
            children: [
              Text(
                time,
                style: TextStyle(
                  color: isHighlighted ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.045,
                ),
              ),
              SizedBox(width: size.width * 0.02),
              Icon(
                isHighlighted ? Icons.access_time : Icons.check_circle,
                color: isHighlighted ? Colors.white : Colors.green,
                size: size.width * 0.06,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

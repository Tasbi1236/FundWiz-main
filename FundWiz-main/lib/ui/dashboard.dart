import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'swag.dart'; // Importing swag.dart

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: RegularPieChartSample(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the Swag screen when the button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Swag()),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}

class RegularPieChartSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            color: Colors.redAccent,
            value: 30, // Replace with your first variable value
            title: 'Spendings',
            radius: 200,
            titleStyle: TextStyle(color: Colors.white),
          ),
          PieChartSectionData(
            color: Colors.purple,
            value: 70, // Replace with your second variable value
            title: 'Earnings',
            radius: 200,
            titleStyle: TextStyle(color: Colors.white),
          ),
        ],
        centerSpaceRadius: 0, // Set to zero for a regular pie chart
        borderData: FlBorderData(show: false),
        sectionsSpace: 0,
      ),
    );
  }
}

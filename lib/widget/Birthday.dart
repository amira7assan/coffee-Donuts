import 'package:flutter/material.dart';
import 'package:intl/intl.dart';  // To format the date

class BirthdayCalculator extends StatefulWidget {
  @override
  _BirthdayCalculatorState createState() => _BirthdayCalculatorState();
}

class _BirthdayCalculatorState extends State<BirthdayCalculator> {
  DateTime? _selectedDate;
  String _ageText = "";

  // Method to calculate age
  void _calculateAge() {
    if (_selectedDate == null) {
      return;
    }
    DateTime now = DateTime.now();
    int years = now.year - _selectedDate!.year;
    int months = now.month - _selectedDate!.month;
    int days = now.day - _selectedDate!.day;

    // Adjust for negative months and days
    if (months < 0) {
      years--;
      months += 12;
    }
    if (days < 0) {
      months--;
      days += DateTime(now.year, now.month, 0).day; // Get the days in the previous month
    }

    setState(() {
      _ageText = "Age: $years years, $months months, $days days";
    });
  }

  // Open date picker to select a date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      _calculateAge();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Birthday Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Select Your Birth Date",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text(
                _selectedDate == null
                    ? "Pick a Date"
                    : DateFormat('yyyy-MM-dd').format(_selectedDate!),
              ),
            ),
            SizedBox(height: 20),
            // Display the selected date
            if (_selectedDate != null)
              Text(
                "Selected Date: ${DateFormat('yyyy-MM-dd').format(_selectedDate!)}",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            SizedBox(height: 20),
            // Display the calculated age
            Text(
              _ageText,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

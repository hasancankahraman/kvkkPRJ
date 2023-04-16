// ignore_for_file: unused_import, prefer_interpolation_to_compose_strings, prefer_final_fields, prefer_const_constructors, use_build_context_synchronously

import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class DateTimeScreen extends StatefulWidget {
  const DateTimeScreen({Key? key}) : super(key: key);

  @override
  State<DateTimeScreen> createState() => _DateTimeScreenState();
}

class _DateTimeScreenState extends State<DateTimeScreen> {
  DateTime? startDate;
  DateTime? endDate;
  TextEditingController _timeController = TextEditingController();
  List<String> _veriler = [
    '2023-04-16 10:30',
    '2023-04-17 12:15',
    '2023-04-16 14:45',
    '2023-04-18 16:00',
    '2023-04-19 11:30',
    '2023-04-20 13:45',
  ];

  getDate() {
    String baslangicTarihim =
        startDate != null ? DateFormat("d E LLL yyyy").format(startDate!) : "";
    String bitisTarih = endDate != null
        ? " - " + DateFormat("d E LLL yyyy").format(endDate!)
        : '';
    return "$baslangicTarihim$bitisTarih ${_timeController.text}";
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      _timeController.text = pickedTime.format(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarih ve Saat'),
      ),
      body: Column(
        children: [
          SfDateRangePicker(
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.range,
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
              if (args.value is PickerDateRange) {
                final DateTime rangeStartDate = args.value.startDate;
                final DateTime? rangeEndDate = args.value.endDate;
                startDate = rangeStartDate;
                endDate = rangeEndDate;
              }
              setState(() {});
            },
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              _selectTime(context);
            },
            child: AbsorbPointer(
              child: TextFormField(
                controller: _timeController,
                decoration: InputDecoration(
                  hintText: 'Saat Seçin',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Text(
            getDate(),
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}

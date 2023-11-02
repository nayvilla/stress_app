import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

Widget customDateInput(String labelText, String hintText, String? selectedDate, ValueChanged<String?> onChanged) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Container(
      width: double.infinity,
      constraints: const BoxConstraints(
        maxWidth: double.infinity,
      ),
      child: DateTimePicker(
        type: DateTimePickerType.date,
        dateMask: 'yyyy-MM-dd',
        initialValue: selectedDate ?? DateTime.now().toString(),
        firstDate: DateTime(1980),
        lastDate: DateTime(2101),
        icon: const Icon(Icons.event),
        dateLabelText: labelText,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Color.fromARGB(255, 245, 242, 242)),
          hintText: hintText,
          //hintStyle: const TextStyle(color: Color.fromARGB(255, 196, 189, 196)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Color(0xFFde455f)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Color(0xFFde455f)),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        ),
        style: const TextStyle(color: Color.fromARGB(255, 196, 189, 196)), 
      ),
    ),
  );
}
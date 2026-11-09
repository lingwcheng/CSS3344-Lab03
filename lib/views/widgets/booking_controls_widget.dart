import 'package:flutter/material.dart';

class BookingControlsWidget extends StatelessWidget {
  final DateTime? selectedDate;
  final String selectedPackage;
  final List<String> packageOptions;
  final bool isDarkMode;
  final Function(DateTime) onDateSelected;
  final Function(String) onPackageSelected;
  final Function(bool) onThemeToggled;

  const BookingControlsWidget({
    super.key,
    required this.selectedDate,
    required this.selectedPackage,
    required this.packageOptions,
    required this.isDarkMode,
    required this.onDateSelected,
    required this.onPackageSelected,
    required this.onThemeToggled,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Trip Preferences', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Cruise Date:'),
            trailing: TextButton(
              onPressed: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: selectedDate ?? DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030),
                );
                if (date != null) onDateSelected(date);
              },
              child: Text(selectedDate != null
                  ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                  : 'Select Date'),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Transport Mode:'),
            trailing: DropdownButton<String>(
              value: selectedPackage,
              onChanged: (val) {
                if (val != null) onPackageSelected(val);
              },
              items: packageOptions.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
            ),
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Dark Mode Theme'),
            value: isDarkMode,
            onChanged: onThemeToggled,
          ),
        ],
      ),
    );
  }
}
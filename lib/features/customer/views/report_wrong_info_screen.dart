import 'package:flutter/material.dart';
import '../../../app/theme/app_colors.dart';

class ReportWrongInfoScreen extends StatelessWidget {
  const ReportWrongInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Report Incorrect Info', style: TextStyle(color: AppColors.textPrimary, fontSize: 18)),
        backgroundColor: AppColors.surface,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Help us keep LocaLink accurate',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'Select what information is incorrect for this listing:',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
            ),
            const SizedBox(height: 16),
            CheckboxListTile(
              title: const Text('Incorrect Opening Hours'),
              value: false,
              onChanged: (v) {},
            ),
            CheckboxListTile(
              title: const Text('Phone Number Not Working'),
              value: false,
              onChanged: (v) {},
            ),
            CheckboxListTile(
              title: const Text('Location/Address is Wrong'),
              value: false,
              onChanged: (v) {},
            ),
            CheckboxListTile(
              title: const Text('Business Permanently Closed'),
              value: false,
              onChanged: (v) {},
            ),
            const SizedBox(height: 16),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Additional details (optional)...',
                fillColor: AppColors.surface,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColors.border),
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Report submitted. Thank you!')),
                  );
                  Navigator.pop(context);
                },
                child: const Text('Submit Report', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
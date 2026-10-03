import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../widgets/customer_widgets.dart';

class ReportWrongInfoScreen extends StatefulWidget {
  const ReportWrongInfoScreen({super.key});
  @override
  State<ReportWrongInfoScreen> createState() => _ReportWrongInfoScreenState();
}

class _ReportWrongInfoScreenState extends State<ReportWrongInfoScreen> {
  int _sel = 0;
  final _details = TextEditingController();

  @override
  void dispose() {
    _details.dispose();
    super.dispose();
  }

  void _send() {
    final m = ScaffoldMessenger.of(context);
    m.showSnackBar(const SnackBar(
        content: Text('Thanks. Our team will check this.'), behavior: SnackBarBehavior.floating));
    Navigator.of(context).maybePop();
  }

  @override
  Widget build(BuildContext context) {
    return CustomerScaffold(
      children: [
        const ScreenHeader(title: 'Report wrong info'),
        const SizedBox(height: 12),
        const SectionLabel('What is wrong?'),
        ChipRow(
          labels: const ['Closed', 'Wrong phone', 'Wrong location'],
          selected: _sel,
          onSelected: (i) => setState(() => _sel = i),
        ),
        const SizedBox(height: 16),
        const SectionLabel('Details'),
        TextField(
          controller: _details,
          maxLines: 4,
          decoration: InputDecoration(
            hintText: 'Tell us more (optional)',
            hintStyle: const TextStyle(color: AppColors.muted),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: AppColors.line)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: AppColors.primary, width: 1.6)),
          ),
        ),
        const SizedBox(height: 20),
        PrimaryButton(label: 'Send', onPressed: _send),
      ],
    );
  }
}
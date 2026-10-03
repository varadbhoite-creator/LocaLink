import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../widgets/customer_widgets.dart';

class ReviewsListScreen extends StatelessWidget {
  const ReviewsListScreen({super.key});

  static const _reviews = [
    ['Anil', 'On time', 5.0],
    ['Sana', 'Fair price', 5.0],
    ['Rahul', 'Late once', 3.0],
  ];

  @override
  Widget build(BuildContext context) {
    return CustomerScaffold(
      navIndex: 0,
      children: [
        const ScreenHeader(title: 'Reviews'),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: const Row(children: [
            Text('4.6', style: TextStyle(fontSize: 38, fontWeight: FontWeight.w800, color: AppColors.ink)),
            SizedBox(width: 14),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                RatingRow(rating: 4.6, size: 20),
                SizedBox(height: 4),
                Text('4.6 average · 38 reviews', style: TextStyle(fontSize: 12.5, color: AppColors.muted)),
              ]),
            ),
          ]),
        ),
        const SizedBox(height: 14),
        for (final r in _reviews)
          ListCard(
            title: r[0] as String,
            subtitle: r[1] as String,
            leading: CircleAvatar(
              radius: 21,
              backgroundColor: tint(AppColors.primary, .14),
              child: Text((r[0] as String)[0],
                  style: const TextStyle(fontWeight: FontWeight.w800, color: AppColors.primary)),
            ),
          ),
        const SizedBox(height: 8),
        GhostButton(label: 'Write a review', onPressed: () => comingSoon(context, 'Writing a review')),
      ],
    );
  }
}
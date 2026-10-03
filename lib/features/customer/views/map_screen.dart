import 'package:flutter/material.dart';

import '../widgets/customer_widgets.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _kinds = ['service', 'place', 'shop'];
  static const _data = {
    'service': [
      ['Ravi Plumbing', '1 km · Verified'],
      ['Gupta Works', '2 km · Verified'],
      ['Shinde Services', '2.6 km · Available'],
    ],
    'place': [
      ['City Hospital', '600 m · Open 24x7'],
      ['Rural Care Clinic', '1.1 km · Open now'],
      ['Lifeline Diagnostics', '1.8 km · Open now'],
    ],
    'shop': [
      ['Sharma Hardware', '450 m · Open now'],
      ['Patil Traders', '900 m · Open now'],
      ['City Tools', '1.4 km · 24x7'],
    ],
  };

  int _sel = 0;

  @override
  Widget build(BuildContext context) {
    final kind = _kinds[_sel];
    return CustomerScaffold(
      navIndex: 1,
      scroll: false,
      children: [
        ChipRow(
          labels: const ['Services', 'Places', 'Shops'],
          selected: _sel,
          color: kindColor(kind),
          onSelected: (i) => setState(() => _sel = i),
        ),
        const SizedBox(height: 10),
        const Expanded(child: MapPlaceholder()),
        const SizedBox(height: 10),
        const SectionLabel('Nearest 3 results'),
        SizedBox(
          height: 200,
          child: ListView(
            children: [
              for (final r in _data[kind]!)
                ListCard(
                  title: r[0],
                  subtitle: r[1],
                  color: kindColor(kind),
                  onTap: () => Navigator.of(context).pushNamed(detailRoute(kind)),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
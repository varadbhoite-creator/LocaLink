import 'package:flutter/material.dart';

import '../../../app/routes/app_routes.dart';
import '../../../app/theme/app_colors.dart';

/// Temporary session flag. Replace with your real auth state later.
class CustomerSession {
  static bool isGuest = true;
}

Color tint(Color c, [double amount = .12]) => Color.lerp(Colors.white, c, amount)!;

void comingSoon(BuildContext context, String what) {
  final m = ScaffoldMessenger.of(context);
  m.hideCurrentSnackBar();
  m.showSnackBar(SnackBar(
    content: Text('$what comes in a later phase'),
    behavior: SnackBarBehavior.floating,
  ));
}

Color kindColor(String kind) => kind == 'place'
    ? AppColors.places
    : kind == 'shop'
        ? AppColors.shops
        : AppColors.primary;

String detailRoute(String kind) => kind == 'place'
    ? AppRoutes.placeDetail
    : kind == 'service'
        ? AppRoutes.providerDetail
        : AppRoutes.shopDetail;

IconData iconFor(String label) {
  final x = label.toLowerCase();
  const map = <String, IconData>{
    'electric': Icons.bolt,
    'plumb': Icons.plumbing,
    'carpent': Icons.carpenter,
    'clean': Icons.cleaning_services_outlined,
    'lock': Icons.lock_outline,
    'mover': Icons.local_shipping_outlined,
    'hospital': Icons.local_hospital_outlined,
    'clinic': Icons.medical_services_outlined,
    'diagnostic': Icons.biotech_outlined,
    'college': Icons.school_outlined,
    'coaching': Icons.menu_book_outlined,
    'pg': Icons.bed_outlined,
    'govt': Icons.account_balance_outlined,
    'bank': Icons.atm,
    'hardware': Icons.hardware,
    'tools': Icons.build_outlined,
    'electronics': Icons.devices_other,
    'grocery': Icons.shopping_basket_outlined,
    'stationer': Icons.edit_outlined,
    'furniture': Icons.chair_outlined,
    'medical': Icons.medical_services_outlined,
    'ai assistant': Icons.auto_awesome,
    'services': Icons.handyman_outlined,
    'places': Icons.place_outlined,
    'shops': Icons.storefront_outlined,
    'traders': Icons.storefront_outlined,
    'works': Icons.handyman_outlined,
  };
  for (final e in map.entries) {
    if (x.contains(e.key)) return e.value;
  }
  return Icons.place_outlined;
}

// ───────────────────────── Scaffold + nav ─────────────────────────

class CustomerScaffold extends StatelessWidget {
  const CustomerScaffold({
    super.key,
    required this.children,
    this.navIndex,
    this.scroll = true,
  });

  final List<Widget> children;
  final int? navIndex;
  final bool scroll;

  @override
  Widget build(BuildContext context) {
    final Widget body = scroll
        ? ListView(padding: const EdgeInsets.fromLTRB(16, 8, 16, 20), children: children)
        : Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: children),
          );
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(child: body),
      bottomNavigationBar: navIndex == null ? null : CustomerBottomNav(index: navIndex!),
    );
  }
}

class CustomerBottomNav extends StatelessWidget {
  const CustomerBottomNav({super.key, required this.index});
  final int index;

  void _go(BuildContext c, int i) {
    if (i == index) return;
    final guest = CustomerSession.isGuest;
    final nav = Navigator.of(c);
    switch (i) {
      case 0:
        nav.pushNamedAndRemoveUntil(guest ? AppRoutes.guestHome : AppRoutes.home, (r) => false);
        break;
      case 1:
        nav.pushNamedAndRemoveUntil(AppRoutes.map, (r) => false);
        break;
      default:
        if (guest) {
          nav.pushNamed(AppRoutes.signUpGate);
        } else {
          comingSoon(c, const ['', '', 'AI Assistant', 'My requests', 'Profile'][i]);
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        backgroundColor: Colors.white,
        indicatorColor: tint(AppColors.primary, .15),
        iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((s) => IconThemeData(
            color: s.contains(WidgetState.selected) ? AppColors.primary : AppColors.muted)),
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((s) => TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: s.contains(WidgetState.selected) ? AppColors.primary : AppColors.muted)),
      ),
      child: NavigationBar(
        height: 66,
        selectedIndex: index,
        onDestinationSelected: (i) => _go(context, i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.map_outlined), selectedIcon: Icon(Icons.map), label: 'Map'),
          NavigationDestination(icon: Icon(Icons.auto_awesome_outlined), selectedIcon: Icon(Icons.auto_awesome), label: 'AI'),
          NavigationDestination(icon: Icon(Icons.list_alt_outlined), selectedIcon: Icon(Icons.list_alt), label: 'Requests'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Me'),
        ],
      ),
    );
  }
}

// ───────────────────────── Header ─────────────────────────

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, required this.icon, required this.onTap, this.color = AppColors.ink});
  final IconData icon;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: Color(0x22000000), blurRadius: 5, offset: Offset(0, 1))],
        ),
        child: Icon(icon, size: 18, color: color),
      ),
    );
  }
}

class ScreenHeader extends StatelessWidget {
  const ScreenHeader({super.key, required this.title, this.trailing, this.showBack = true});
  final String title;
  final Widget? trailing;
  final bool showBack;

  @override
  Widget build(BuildContext context) {
    final canBack = showBack && Navigator.of(context).canPop();
    return SizedBox(
      height: 48,
      child: Row(children: [
        if (canBack) ...[
          RoundIconButton(icon: Icons.arrow_back_ios_new, onTap: () => Navigator.of(context).maybePop()),
          const SizedBox(width: 12),
        ],
        Expanded(
          child: Text(title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: AppColors.ink)),
        ),
        if (trailing != null) trailing!,
      ]),
    );
  }
}

class SaveButton extends StatefulWidget {
  const SaveButton({super.key});
  @override
  State<SaveButton> createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {
  bool _saved = false;
  @override
  Widget build(BuildContext context) {
    return RoundIconButton(
      icon: _saved ? Icons.bookmark : Icons.bookmark_border,
      color: _saved ? AppColors.primary : AppColors.ink,
      onTap: () {
        setState(() => _saved = !_saved);
        final m = ScaffoldMessenger.of(context);
        m.hideCurrentSnackBar();
        m.showSnackBar(SnackBar(
            content: Text(_saved ? 'Saved' : 'Removed from saved'),
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 1)));
      },
    );
  }
}

// ───────────────────────── Inputs + buttons ─────────────────────────

class AppSearchField extends StatelessWidget {
  const AppSearchField({super.key, required this.hint, this.onSubmitted, this.initial});
  final String hint;
  final ValueChanged<String>? onSubmitted;
  final String? initial;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initial,
      textInputAction: TextInputAction.search,
      onFieldSubmitted: onSubmitted,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.muted, fontWeight: FontWeight.w500),
        prefixIcon: const Icon(Icons.search, color: AppColors.muted),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: AppColors.line)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: AppColors.primary, width: 1.6)),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color = AppColors.primary,
    this.icon,
    this.onDark = false,
  });
  final String label;
  final VoidCallback onPressed;
  final Color color;
  final IconData? icon;
  final bool onDark;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: onDark ? Colors.white : color,
          foregroundColor: onDark ? color : Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          textStyle: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          if (icon != null) ...[Icon(icon, size: 18), const SizedBox(width: 8)],
          Flexible(child: Text(label, overflow: TextOverflow.ellipsis)),
        ]),
      ),
    );
  }
}

class GhostButton extends StatelessWidget {
  const GhostButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color = AppColors.primary,
    this.icon,
    this.onDark = false,
  });
  final String label;
  final VoidCallback onPressed;
  final Color color;
  final IconData? icon;
  final bool onDark;

  @override
  Widget build(BuildContext context) {
    final fg = onDark ? Colors.white : color;
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: fg,
          backgroundColor: onDark ? Colors.transparent : Colors.white,
          side: BorderSide(color: onDark ? Colors.white70 : Color.lerp(Colors.white, color, .45)!, width: 1.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          textStyle: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          if (icon != null) ...[Icon(icon, size: 18), const SizedBox(width: 8)],
          Flexible(child: Text(label, overflow: TextOverflow.ellipsis)),
        ]),
      ),
    );
  }
}

class ChipRow extends StatelessWidget {
  const ChipRow({
    super.key,
    required this.labels,
    this.selected = -1,
    this.color = AppColors.primary,
    this.onSelected,
  });
  final List<String> labels;
  final int selected;
  final Color color;
  final ValueChanged<int>? onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(spacing: 8, runSpacing: 8, children: [
      for (int i = 0; i < labels.length; i++)
        GestureDetector(
          onTap: onSelected == null ? null : () => onSelected!(i),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: i == selected ? color : Colors.white,
              borderRadius: BorderRadius.circular(99),
              border: Border.all(color: i == selected ? color : AppColors.line),
            ),
            child: Text(labels[i],
                style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w700,
                    color: i == selected ? Colors.white : AppColors.ink)),
          ),
        ),
    ]);
  }
}

// ───────────────────────── Cards ─────────────────────────

class SosBanner extends StatelessWidget {
  const SosBanner({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Color(0xFFE5493A), Color(0xFFB02A1E)]),
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [BoxShadow(color: Color(0x55C0392B), blurRadius: 12, offset: Offset(0, 5))],
        ),
        child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.bolt, color: Colors.white, size: 20),
          SizedBox(width: 8),
          Text('SOS Emergency',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 15)),
        ]),
      ),
    );
  }
}

class CategoryItem {
  final String label;
  final IconData icon;
  final Color color;
  const CategoryItem(this.label, this.icon, this.color);
}

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key, required this.items, required this.onTap});
  final List<CategoryItem> items;
  final ValueChanged<String> onTap;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        for (final it in items)
          Material(
            color: Colors.white,
            elevation: 1,
            shadowColor: Colors.black26,
            borderRadius: BorderRadius.circular(18),
            child: InkWell(
              borderRadius: BorderRadius.circular(18),
              onTap: () => onTap(it.label),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(color: tint(it.color, .14), borderRadius: BorderRadius.circular(14)),
                  child: Icon(it.icon, color: it.color, size: 24),
                ),
                const SizedBox(height: 8),
                Text(it.label,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.ink)),
              ]),
            ),
          ),
      ],
    );
  }
}

class ListCard extends StatelessWidget {
  const ListCard({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.color = AppColors.primary,
    this.onTap,
    this.leading,
  });
  final String title;
  final String? subtitle;
  final IconData? icon;
  final Color color;
  final VoidCallback? onTap;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: Colors.white,
        elevation: 1,
        shadowColor: Colors.black26,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(children: [
              leading ??
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(color: tint(color, .14), borderRadius: BorderRadius.circular(13)),
                    child: Icon(icon ?? iconFor(title), color: color, size: 22),
                  ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(title,
                      style: const TextStyle(fontSize: 14.5, fontWeight: FontWeight.w800, color: AppColors.ink)),
                  if (subtitle != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(subtitle!,
                          style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w500, color: AppColors.muted)),
                    ),
                ]),
              ),
              if (onTap != null) const Icon(Icons.chevron_right, color: Color(0xFF9AA9AB)),
            ]),
          ),
        ),
      ),
    );
  }
}

class PhotoPlaceholder extends StatelessWidget {
  const PhotoPlaceholder({super.key, required this.color, this.icon = Icons.photo_outlined, this.height = 150});
  final Color color;
  final IconData icon;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
            begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [tint(color, .22), tint(color, .08)]),
      ),
      child: Center(child: Icon(icon, size: 44, color: color)),
    );
  }
}

class InfoRow extends StatelessWidget {
  const InfoRow({super.key, required this.icon, required this.text, this.color = AppColors.muted});
  final IconData icon;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: 10),
        Expanded(
            child: Text(text,
                style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w600, color: AppColors.ink))),
      ]),
    );
  }
}

class RatingRow extends StatelessWidget {
  const RatingRow({super.key, required this.rating, this.label, this.size = 18});
  final double rating;
  final String? label;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      for (int i = 0; i < 5; i++)
        Icon(i < rating.floor() ? Icons.star_rounded : Icons.star_outline_rounded,
            size: size, color: AppColors.star),
      if (label != null) ...[
        const SizedBox(width: 6),
        Flexible(child: Text(label!, style: const TextStyle(fontSize: 12.5, color: AppColors.muted))),
      ],
    ]);
  }
}

class SectionLabel extends StatelessWidget {
  const SectionLabel(this.text, {super.key});
  final String text;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 6, bottom: 8),
        child: Text(text, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.muted)),
      );
}

// ───────────────────────── Map placeholder ─────────────────────────

class MapPlaceholder extends StatelessWidget {
  const MapPlaceholder({super.key, this.label = 'Map with pins and my location'});
  final String label;

  static const _pins = <List<dynamic>>[
    [0.22, 0.26, AppColors.primary],
    [0.66, 0.44, AppColors.places],
    [0.40, 0.66, AppColors.shops],
    [0.78, 0.20, AppColors.primary],
  ];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Stack(fit: StackFit.expand, children: [
        CustomPaint(painter: _MapPainter()),
        LayoutBuilder(builder: (context, box) {
          final w = box.maxWidth, h = box.maxHeight;
          return Stack(children: [
            for (final p in _pins)
              Positioned(
                left: w * (p[0] as double) - 17,
                top: h * (p[1] as double) - 34,
                child: Icon(Icons.location_on, size: 34, color: p[2] as Color),
              ),
            Positioned(
              left: w * .5 - 8,
              top: h * .36 - 8,
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: const Color(0xFF2F6FED),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                  boxShadow: const [BoxShadow(color: Color(0x332F6FED), spreadRadius: 8)],
                ),
              ),
            ),
          ]);
        }),
        Positioned(
          left: 10,
          bottom: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700)),
          ),
        ),
      ]),
    );
  }
}

class _MapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size s) {
    canvas.drawRect(Offset.zero & s, Paint()..color = const Color(0xFFE6EDEA));
    canvas.drawCircle(Offset(s.width * .25, s.height * .3), s.width * .2, Paint()..color = const Color(0xFFCFE6D6));
    canvas.drawCircle(Offset(s.width * .8, s.height * .72), s.width * .24, Paint()..color = const Color(0xFFCFE0EE));
    final road = Paint()
      ..color = Colors.white
      ..strokeWidth = 9
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(Offset(s.width * .05, s.height * .85), Offset(s.width * .95, s.height * .12), road);
    canvas.drawLine(Offset(s.width * .1, s.height * .2), Offset(s.width * .9, s.height * .8), road);
    canvas.drawLine(Offset(s.width * .55, 0), Offset(s.width * .45, s.height), road);
  }

  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}

// ───────────────────────── Shared browse screen ─────────────────────────

class BrowseView extends StatelessWidget {
  const BrowseView({super.key, required this.title, required this.hint, required this.kind, required this.items});
  final String title;
  final String hint;
  final String kind;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    final color = kindColor(kind);
    return CustomerScaffold(
      navIndex: 0,
      children: [
        ScreenHeader(title: title),
        const SizedBox(height: 10),
        AppSearchField(
          hint: hint,
          onSubmitted: (q) => Navigator.of(context).pushNamed(AppRoutes.searchResults, arguments: q),
        ),
        const SizedBox(height: 16),
        CategoryGrid(
          items: [for (final i in items) CategoryItem(i, iconFor(i), color)],
          onTap: (label) => Navigator.of(context)
              .pushNamed(AppRoutes.listingList, arguments: ListingArgs('$label near me', kind)),
        ),
      ],
    );
  }
}
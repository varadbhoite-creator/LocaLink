import 'package:flutter/material.dart';
import 'package:localink/core/router/app_routes.dart';
import 'package:localink/core/widgets/app_buttons.dart';
import 'package:localink/core/widgets/app_text_field.dart';
import 'package:localink/core/widgets/onboarding_scaffold.dart';

/// 1.7 Customer info. Create account -> 1.8 Location permission.
class CustomerInfoScreen extends StatefulWidget {
  const CustomerInfoScreen({super.key});

  @override
  State<CustomerInfoScreen> createState() => _CustomerInfoScreenState();
}

class _CustomerInfoScreenState extends State<CustomerInfoScreen> {
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _area = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    _area.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      title: 'About you',
      subtitle: 'So providers know who they are helping.',
      actions: [
        PrimaryButton(
          label: 'Create account',
          onPressed: () {
            // TODO(backend): save the customer profile.
            //   Supabase: from('profiles').upsert({id: user.id, role:
            //     'customer', name, phone, home_area})
            //   Firestore: users/{uid}.set({role: 'customer', name, phone,
            //     homeArea})
            // TODO(validation): name required; phone 10 digits.
            Navigator.of(context).pushNamed(AppRoutes.locationPermission);
          },
        ),
      ],
      child: Column(
        children: [
          AppTextField(
            label: 'Name',
            hint: 'Your full name',
            icon: Icons.person_outline_rounded,
            controller: _name,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 14),
          AppTextField(
            label: 'Phone',
            hint: '98765 43210',
            icon: Icons.phone_outlined,
            prefixText: '+91  ',
            controller: _phone,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            maxLength: 10,
            digitsOnly: true,
          ),
          const SizedBox(height: 14),
          AppTextField(
            label: 'Home area',
            hint: 'e.g. neighbourhood or locality',
            icon: Icons.home_outlined,
            controller: _area,
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }
}

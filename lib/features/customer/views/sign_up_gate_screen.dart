import 'package:flutter/material.dart';

import '../../../app/routes/app_routes.dart';
import '../../../app/theme/app_colors.dart';
import '../widgets/customer_widgets.dart';

class SignUpGateScreen extends StatelessWidget {
  const SignUpGateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.primary, Color(0xFF07343A)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              Align(
                alignment: Alignment.centerLeft,
                child: RoundIconButton(
                    icon: Icons.close, onTap: () => Navigator.of(context).maybePop()),
              ),
              const Spacer(),
              Container(
                width: 88,
                height: 88,
                decoration: const BoxDecoration(color: Color(0x26FFFFFF), shape: BoxShape.circle),
                child: const Icon(Icons.verified_user_outlined, color: Colors.white, size: 42),
              ),
              const SizedBox(height: 22),
              const Text(
                'Create an account to browse services and book',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800, height: 1.25),
              ),
              const Spacer(),
              PrimaryButton(
                label: 'Continue with Google',
                onDark: true,
                icon: Icons.account_circle_outlined,
                onPressed: () => comingSoon(context, 'Google sign in'),
              ),
              const SizedBox(height: 12),
              GhostButton(
                label: 'Explore Places and Shops',
                onDark: true,
                onPressed: () => Navigator.of(context)
                    .pushNamedAndRemoveUntil(AppRoutes.guestHome, (r) => false),
              ),
              const SizedBox(height: 8),
            ]),
          ),
        ),
      ),
    );
  }
}
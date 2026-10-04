import 'package:flutter/material.dart';
import 'package:localink/core/router/app_routes.dart';
import 'package:localink/core/theme/app_colors.dart';
import 'package:localink/core/widgets/app_buttons.dart';
import 'package:localink/core/widgets/app_text_field.dart';
import 'package:localink/core/widgets/onboarding_scaffold.dart';
import 'package:localink/onboarding/models/onboarding_models.dart';

/// 1.6 Verify phone. After OTP, the next screen depends on the role:
/// Customer -> 1.7, Provider -> 6.1, Shop owner -> 7.1, Place owner -> 7.5.
class VerifyPhoneScreen extends StatefulWidget {
  const VerifyPhoneScreen({super.key, this.args});
  final AuthArgs? args;

  @override
  State<VerifyPhoneScreen> createState() => _VerifyPhoneScreenState();
}

class _VerifyPhoneScreenState extends State<VerifyPhoneScreen> {
  final _phone = TextEditingController();
  final _otp = TextEditingController();

  @override
  void dispose() {
    _phone.dispose();
    _otp.dispose();
    super.dispose();
  }

  String _nextRoute(UserRole? role) => switch (role) {
        UserRole.customer || null => AppRoutes.customerInfo,
        UserRole.provider => AppRoutes.providerRegister,
        UserRole.shopOwner => AppRoutes.shopRegister,
        UserRole.placeOwner => AppRoutes.placeRegister,
      };

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      title: 'Verify phone',
      subtitle: 'We will send a 6 digit code by SMS.',
      actions: [
        PrimaryButton(
          label: 'Verify',
          onPressed: () {
            // TODO(backend): verify the OTP, then continue.
            //   Supabase: auth.verifyOTP(phone:, token:, type: OtpType.sms)
            //   Firebase: PhoneAuthProvider.credential(verificationId:, smsCode:)
            //   (Both need an SMS provider; Firebase phone auth has a free
            //   tier, Supabase needs Twilio/MessageBird etc.)
            // TODO(validation): check 10-digit phone and 6-digit OTP first.
            Navigator.of(context)
                .pushNamed(_nextRoute(widget.args?.role));
          },
        ),
      ],
      child: Column(
        children: [
          AppTextField(
            label: 'Phone number',
            hint: '98765 43210',
            icon: Icons.phone_rounded,
            prefixText: '+91  ',
            controller: _phone,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            maxLength: 10,
            digitsOnly: true,
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                // TODO(backend): send the OTP to the phone number above.
              },
              child: const Text(
                'Send code',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: AppColors.teal,
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          AppTextField(
            label: '6 digit code',
            hint: '------',
            controller: _otp,
            keyboardType: TextInputType.number,
            maxLength: 6,
            digitsOnly: true,
            letterSpacing: 8,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Center(
            child: TextButton(
              // TODO(backend): enable after a 30s countdown (Timer), then
              //   re-send the OTP.
              onPressed: null,
              child: const Text(
                'Resend in 30s',
                style: TextStyle(color: AppColors.mute),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

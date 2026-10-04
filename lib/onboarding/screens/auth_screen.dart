import 'package:flutter/material.dart';
import 'package:localink/core/router/app_routes.dart';
import 'package:localink/core/theme/app_colors.dart';
import 'package:localink/core/widgets/app_buttons.dart';
import 'package:localink/core/widgets/onboarding_scaffold.dart';
import 'package:localink/onboarding/models/onboarding_models.dart';

/// 1.5 Sign in or register.
/// Register: -> Terms and privacy consent -> 1.6 Verify phone.
/// Log in:   -> that user's home.
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key, this.args});
  final AuthArgs? args;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late bool _isLogin = widget.args?.isLogin ?? false;

  AuthArgs get _args =>
      AuthArgs(role: widget.args?.role, isLogin: _isLogin);

  void _continue() {
    if (_isLogin) {
      // TODO(backend): sign the user in, then route by their STORED role:
      //   customer -> AppRoutes.home, provider -> provider dashboard (6.12),
      //   shop/place owner -> vendor dashboard (7.8).
      // Until those screens exist, everyone goes to Home.
      Navigator.of(context).pushNamedAndRemoveUntil(
        AppRoutes.home,
        (route) => false,
      );
    } else {
      // Per the flow doc: consent comes before phone verification.
      Navigator.of(context).pushNamed(AppRoutes.terms, arguments: _args);
    }
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      title: _isLogin ? 'Welcome back' : 'Create your account',
      subtitle: _isLogin
          ? 'Log in to continue where you left off.'
          : 'It takes less than a minute.',
      actions: [
        PrimaryButton(
          label: 'Continue with Google',
          // TODO(brand): use the official Google "G" logo asset.
          leading: const _GoogleBadge(),
          onPressed: () {
            // TODO(backend): Google sign-in.
            //   Supabase: auth.signInWithOAuth(OAuthProvider.google)
            //   Firebase: GoogleSignIn + FirebaseAuth.signInWithCredential
            // New user -> Verify phone; returning user -> home.
            _continue();
          },
        ),
        GhostButton(
          label: 'Use email',
          leading: const Icon(Icons.mail_outline_rounded,
              size: 20, color: AppColors.teal),
          onPressed: () {
            // TODO(backend): email sign-in / sign-up.
            //   Add an email + password (or magic link) screen here, or
            //   expand this screen with fields.
            //   Supabase: signUp / signInWithPassword / signInWithOtp
            //   Firebase: createUserWithEmailAndPassword / signInWithEmailAndPassword
            _continue();
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Center(
            child: TextButton(
              onPressed: () => setState(() => _isLogin = !_isLogin),
              child: Text.rich(
                TextSpan(
                  text: _isLogin
                      ? 'New to LocaLink? '
                      : 'Already registered? ',
                  style: const TextStyle(
                    color: AppColors.mute,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: _isLogin ? 'Create account' : 'Log in',
                      style: const TextStyle(
                        color: AppColors.teal,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
      child: Column(
        children: [
          const SizedBox(height: 12),
          // TODO(assets): replace with an auth illustration if the design adds one.
          Center(
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: AppColors.teal.withValues(alpha: 0.10),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.lock_open_rounded,
                  size: 52, color: AppColors.teal),
            ),
          ),
          if (!_isLogin && widget.args?.role != null) ...[
            const SizedBox(height: 20),
            Center(
              child: Chip(
                avatar: Icon(widget.args!.role!.icon,
                    size: 16, color: widget.args!.role!.color),
                label: Text(
                  'Signing up as ${widget.args!.role!.label}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 12.5),
                ),
                backgroundColor: Colors.white,
                side: const BorderSide(color: AppColors.line),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _GoogleBadge extends StatelessWidget {
  const _GoogleBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 22,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: const Text(
        'G',
        style: TextStyle(
          color: AppColors.teal,
          fontWeight: FontWeight.w800,
          fontSize: 13,
        ),
      ),
    );
  }
}

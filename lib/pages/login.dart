import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:maps_route/blocs/auth/auth_bloc.dart';
import 'package:maps_route/pages/home.dart';
import 'package:maps_route/shared/theme.dart';
import 'package:maps_route/widgets/custom_button.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => const Home()),
              (route) => false);
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Selamat Datang 👋',
                  style: mediumTS.copyWith(fontSize: 28),
                ),
                const Gap(40),
                CustomButton(
                  text: 'Login with Google',
                  iconUrl: 'assets/login_google.png',
                  onTap: () {
                    context.read<AuthBloc>().add(AuthGoogleSignIn());
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_route/blocs/auth/auth_bloc.dart';
import 'package:maps_route/firebase_options.dart';
import 'package:maps_route/pages/home.dart';
import 'package:maps_route/pages/login.dart';

import 'repositories/auth_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(
          auth: RepositoryProvider.of<AuthRepository>(context),
        ),
        child: MaterialApp(
          theme: ThemeData.dark(useMaterial3: true),
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const Home();
              }
              return const Login();
            },
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:maps_route/pages/menu_dataagen.dart';
import 'package:maps_route/pages/menu_pencarian.dart';

import '../shared/theme.dart';
import '../widgets/custom_field.dart';

import '../blocs/auth/auth_bloc.dart';
import '../blocs/maps/maps_bloc.dart';

import 'login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => const Login()),
            (route) => false,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: Column(
            children: [
              Text(
                'Halo 👋',
                style: semiboldTS.copyWith(fontSize: 22),
              ),
              const Gap(6),
              Text(
                user!.email!,
                style: mediumTS.copyWith(fontSize: 14),
              ),
            ],
          ),
          centerTitle: true,
        ),
        drawer: const HomeDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('assets/logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Gap(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Lokasi Anda : ',
                    style: mediumTS.copyWith(fontSize: 15),
                  ),
                  const Gap(10),
                  Expanded(
                    child: CustomField(
                      child: getUserAddress(),
                    ),
                  ),
                ],
              ),
              const Gap(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tujuan Anda : ',
                    style: mediumTS.copyWith(fontSize: 15),
                  ),
                  const Gap(10),
                  Expanded(
                    child: CustomField(
                      child: Text(
                        'Aceh',
                        style: mediumTS,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(30),
              TextButton(
                onPressed: () {
                  context.read<AuthBloc>().add(AuthSignOut());
                },
                child: Text(
                  'Log out',
                  style: semiboldTS.copyWith(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: mediumTS,
        ),
      ),
    );
  }

  BlocProvider<MapsBloc> getUserAddress() {
    return BlocProvider(
      create: (context) => MapsBloc()..add(MapsCurrentLocationEvent()),
      child: BlocBuilder<MapsBloc, MapsState>(
        builder: (context, state) {
          if (state is MapsLoaded) {
            return BlocProvider(
              create: (context) => MapsBloc()..add(MapsGetAddressEvent(state.position)),
              child: BlocBuilder<MapsBloc, MapsState>(
                builder: (context, state) {
                  return Text(
                    (state is AddressSuccess) ? state.address : '-',
                    style: mediumTS,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  );
                },
              ),
            );
          }
          return const Text('-');
        },
      ),
    );
  }
}

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Theme.of(context).focusColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'Aplikasi Mapping',
                    style: boldTS.copyWith(fontSize: 24),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10),
              children: [
                ListTile(
                  onTap: () => Navigator.of(context).pop(),
                  trailing: const Icon(Icons.home),
                  title: const Text('Home'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const MenuPencarian(),
                      ),
                    );
                  },
                  trailing: const Icon(Icons.search),
                  title: const Text('Pencarian'),
                ),
                ListTile(
                  trailing: const Icon(Icons.directions_bus),
                  title: const Text('Data Agen'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ListBus(),
                      ),
                    );
                  },
                ),
                ListTile(
                  onTap: () => showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          insetPadding: const EdgeInsets.all(20),
                          title: Text(
                            'Tentang Aplikasi',
                            style: semiboldTS,
                            textAlign: TextAlign.center,
                          ),
                          content: Text(
                            'Aplikasi mapping ini dibuat untuk melakukan pencarian bus terdekat dengan metode djikstra dan topsis.',
                            style: mediumTS.copyWith(fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                        );
                      }),
                  trailing: const Icon(Icons.info_outline),
                  title: const Text('Tentang Aplikasi'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

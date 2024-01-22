import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:maps_route/pages/list.dart';
import 'package:maps_route/pages/login.dart';
import 'package:maps_route/services/maps_service.dart';
import 'package:maps_route/shared/theme.dart';
import 'package:maps_route/widgets/custom_button.dart';
import 'package:maps_route/widgets/custom_field.dart';

import '../blocs/auth/auth_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final user = FirebaseAuth.instance.currentUser;
  final hargaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => const Login()),
              (route) => false);
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Aplikasi Mapping',
                style: semiboldTS.copyWith(fontSize: 24),
              ),
              Text(
                user!.email!,
                style: mediumTS.copyWith(height: 2),
              ),
              const Gap(20),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Harga (Rp) : ',
                    style: mediumTS.copyWith(fontSize: 15),
                  ),
                  const Gap(10),
                  Expanded(
                    child: TextFormField(
                      controller: hargaController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        fillColor: Theme.of(context).highlightColor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(30),
              CustomButtonWithArrow(
                text: 'LANJUTKAN',
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ListLocation(
                      priceRequest: int.tryParse(hargaController.text)!,
                    ),
                  ),
                ),
              ),
              const Gap(20),
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

  FutureBuilder<Position> getUserAddress() {
    return FutureBuilder(
      future: MapsService().getUserCurrentPosition(),
      builder: (context, position) {
        if (position.hasData) {
          return FutureBuilder(
            future: MapsService().getFullAddressFromPosition(
              position.data!,
            ),
            builder: (context, address) {
              if (address.hasData) {
                return Text(
                  address.data.toString(),
                  style: mediumTS,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                );
              }
              return const Text('-');
            },
          );
        }
        return const Text('-');
      },
    );
  }
}

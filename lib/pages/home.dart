import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:maps_route/models/filter_model.dart';
import 'package:maps_route/shared/value.dart';

import '../shared/theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_field.dart';

import '../blocs/auth/auth_bloc.dart';
import '../blocs/maps/maps_bloc.dart';

import 'list.dart';
import 'login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final user = FirebaseAuth.instance.currentUser;

  String fasilitas = listFasilitas.first;
  String pelayanan = listPelayanan.first;
  String keamanan = listKeamanan.first;
  String waktu = listWaktu.first;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => const Login()), (route) => false);
        }
      },
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
          children: [
            Column(
              children: [
                Text(
                  'Mapping',
                  style: semiboldTS.copyWith(fontSize: 24),
                ),
                Text(
                  user!.email!,
                  style: mediumTS.copyWith(height: 2),
                ),
              ],
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
            Text(
              'Filter',
              style: boldTS.copyWith(fontSize: 18),
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Fasilitas : ',
                  style: mediumTS.copyWith(fontSize: 15),
                ),
                const Gap(10),
                Expanded(
                  child: CustomDropdownField(
                    items: List.generate(listFasilitas.length, (index) {
                      return DropdownMenuItem(
                        value: listFasilitas[index],
                        child: Text(listFasilitas[index]),
                      );
                    }),
                    onChanged: (value) {
                      setState(() {
                        fasilitas = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Pelayanan : ',
                  style: mediumTS.copyWith(fontSize: 15),
                ),
                const Gap(10),
                Expanded(
                  child: CustomDropdownField(
                    items: List.generate(listPelayanan.length, (index) {
                      return DropdownMenuItem(
                        value: listPelayanan[index],
                        child: Text(listPelayanan[index]),
                      );
                    }),
                    onChanged: (value) {
                      setState(() {
                        pelayanan = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Keamanan : ',
                  style: mediumTS.copyWith(fontSize: 15),
                ),
                const Gap(10),
                Expanded(
                  child: CustomDropdownField(
                    items: List.generate(listKeamanan.length, (index) {
                      return DropdownMenuItem(
                        value: listKeamanan[index],
                        child: Text(listKeamanan[index]),
                      );
                    }),
                    onChanged: (value) {
                      setState(() {
                        keamanan = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Waktu : ',
                  style: mediumTS.copyWith(fontSize: 15),
                ),
                const Gap(10),
                Expanded(
                  child: CustomDropdownField(
                    items: List.generate(listWaktu.length, (index) {
                      return DropdownMenuItem(
                        value: listWaktu[index],
                        child: Text(listWaktu[index]),
                      );
                    }),
                    onChanged: (value) {
                      setState(() {
                        waktu = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const Gap(30),
            CustomButtonWithArrow(
                text: 'LANJUTKAN',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ListLocation(
                        model: FilterModel(
                          fasilitas: fasilitas,
                          keamanan: keamanan,
                          pelayanan: pelayanan,
                          waktu: waktu,
                        ),
                      ),
                    ),
                  );
                }),
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

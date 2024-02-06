import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../shared/value.dart';
import '../shared/theme.dart';

class ListBus extends StatelessWidget {
  const ListBus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Data Bus',
          style: boldTS,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: listBus.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white10,
            ),
            child: Row(
              children: [
                const Icon(Icons.directions_bus_outlined),
                const Gap(10),
                Expanded(child: Text(listBus[index])),
              ],
            ),
          );
        },
      ),
    );
  }
}

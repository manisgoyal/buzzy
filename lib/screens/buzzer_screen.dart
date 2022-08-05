import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/buzzer_button.dart';
import '../providers/team_id.dart';

class BuzzerScreen extends StatelessWidget {
  final nameController = TextEditingController();
  final int round;
  BuzzerScreen({required this.round, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TeamIdProvider>(
      builder: (context, nameProvider, child) => Scaffold(
        appBar: AppBar(
          title: Text(nameProvider.teamId),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: BuzzerButton(round),
        ),
      ),
    );
  }
}

import 'package:buzzy/providers/team_id.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/buzzer_screen.dart';

class TeamName extends StatelessWidget {
  final TextEditingController nameController;
  const TeamName({
    Key? key,
    required this.nameController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Consumer<TeamIdProvider>(
        builder: (context, nameProvider, child) => TextField(
          controller: nameController,
          decoration: const InputDecoration(
            hintText: 'Type your Team Code',
            hintStyle: TextStyle(
              fontSize: 18,
              fontStyle: FontStyle.italic,
            ),
          ),
          onSubmitted: (_) {
            TeamIdProvider teamIdProvider =
                Provider.of<TeamIdProvider>(context, listen: false);
            teamIdProvider.changeId(_);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => BuzzerScreen(
                          round: 1,
                        )));
          },
        ),
      ),
    );
  }
}

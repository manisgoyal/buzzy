import 'package:buzzy/components/team_name.dart';
import 'package:buzzy/screens/buzzer_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/team_id.dart';

class TeamScreen extends StatelessWidget {
  final nameController = TextEditingController();

  TeamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Enter your Team\'s Code'),
            TeamName(nameController: nameController),
            TextButton(
              onPressed: () {
                TeamIdProvider teamIdProvider =
                    Provider.of<TeamIdProvider>(context, listen: false);
                teamIdProvider.changeId(nameController.text);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BuzzerScreen(
                              round: 1,
                            )));
              },
              child: const Text('Continue'),
            )
          ],
        ),
      ),
    );
  }
}

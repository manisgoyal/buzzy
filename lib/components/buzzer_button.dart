import 'package:audioplayers/audioplayers.dart';
import 'package:buzzy/providers/team_id.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ntp/ntp.dart';
import 'package:provider/provider.dart';

import '../screens/buzzer_screen.dart';

class BuzzerButton extends StatefulWidget {
  final int round;
  const BuzzerButton(this.round, {Key? key}) : super(key: key);

  @override
  State<BuzzerButton> createState() => _BuzzerButtonState();
}

class _BuzzerButtonState extends State<BuzzerButton> {
  late bool _isBuzzerPressed;
  DateTime ntpTime = DateTime.now();

  void _loadNTPTime() async {
    setState(() async {
      ntpTime = await NTP.now();
    });
  }

  @override
  void initState() {
    _isBuzzerPressed = false;
    super.initState();
  }

  void _showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Response recorded in server.'),
      ),
    );
  }

  void _pressed() async {
    DatabaseReference ref = FirebaseDatabase.instance
        .ref("teams/${context.read<TeamIdProvider>().teamId}");
    _loadNTPTime();

    await ref.update({
      "roundId${widget.round}Time": {
        "buzzTime": ntpTime.toUtc().toString(),
        "nowTime": DateTime.now().toString()
      }
    });
    _showSnackBar();
    AudioPlayer audio = AudioPlayer();
    AssetSource sc = AssetSource('audio/buzzer.mp3');
    audio.play(sc);
    setState(() {
      _isBuzzerPressed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _isBuzzerPressed
          ? Column(
              children: [
                Text('You pressed the buzzer for Round ${widget.round}'),
                ElevatedButton(
                  onPressed: (widget.round < 5)
                      ? () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BuzzerScreen(
                                round: widget.round + 1,
                              ),
                            ),
                          )
                      : null,
                  child: (widget.round < 5)
                      ? const Text('Continue')
                      : const Text('Thanks!! Contact the coordinator.'),
                ),
              ],
            )
          : FloatingActionButton(
              onPressed: _isBuzzerPressed ? null : _pressed,
              tooltip: 'I know the Answer',
              child: const Icon(Icons.notifications_active_sharp),
            ),
    );
  }
}

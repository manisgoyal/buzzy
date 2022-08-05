import '../providers/team_id.dart';
import '../screens/team_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TeamIdProvider>(
      create: (context) => TeamIdProvider(),
      child: Consumer<TeamIdProvider>(
        builder: (context, nameProvider, child) => MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: FutureBuilder(
                future: _fbApp,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text("Error is there");
                  } else if (snapshot.hasData) {
                    return TeamScreen();
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                })),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:payflow/app_widget.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Material(
            child: Center(
              child: Text(
                "Não foi possível inicializar o Firebase",
                textDirection: TextDirection.ltr,
              ),
            ),
          );
        }

        // Once complete, show your application
        else if (snapshot.connectionState == ConnectionState.done) {
          return AppWidget();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Material(
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

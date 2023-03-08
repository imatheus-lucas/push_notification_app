import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:push_notification_app/notification_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<NotificationService>(
            create: (context) => NotificationService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Push Notification App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _showNotification() {
    Provider.of<NotificationService>(context, listen: false)
        .showLocalNotification(
            id: 1,
            title: "Drink Water",
            body: "Time to drink some water!",
            payload: "You just took water! Huurray!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: _showNotification,
                child: const Text("Show Notification"))
          ],
        ),
      ),
    );
  }
}

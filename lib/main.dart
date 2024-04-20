import 'dart:io';


import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../globals.dart' as globals;
import 'services/backgroundService.dart';
import 'services/notificationServices.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeService();
  await Permission.notification.request();
  // await Permission.camera.request();
  await initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    socketInit();
  }
  socketInit() {
    Socket socket = io('http://192.168.1.2:3000',
        OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            // .setExtraHeaders({'foo': 'bar'}) // optional
            .build());
    socket.onConnect((data) {
      print('connect');
    });
    socket.on('chat message', (data) => print(data));
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}

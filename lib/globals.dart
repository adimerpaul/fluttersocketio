library my_prj.globals;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:socket_io_client/socket_io_client.dart';

// bool isLoggedIn = false;
late Socket socket;
int id = 0;
late AndroidNotificationDetails androidNotificationDetails;
late NotificationDetails notificationDetails;

import 'package:device_info/device_info.dart';
import 'package:riverpod/riverpod.dart';

var deviceInfoPluginProvider = Provider<DeviceInfoPlugin>(
  (ref) => DeviceInfoPlugin(),
);


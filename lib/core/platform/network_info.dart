import 'package:connectivity/connectivity.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {

  @override
  Future<bool> get isConnected async {
    ConnectivityResult result = await Connectivity().checkConnectivity();
    return Future.value(result != ConnectivityResult.none);
  }
}

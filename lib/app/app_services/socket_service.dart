import 'package:cholai/app/core/config/app_info.dart';
import 'package:cholai/app/core/utils/logger_util.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketService {
  static final SocketService _instance = SocketService._internal();
  factory SocketService() => _instance;
  late io.Socket socket;

  SocketService._internal();

  void connectSocket(String userId) {
    socket = io.io(AppInfo.kAppBaseUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
      'query': {'userId': userId},
    });

    socket.connect();

    socket.onConnect((_) {
      LoggerUtil.debug('Socket connected');
    });

    socket.onDisconnect((_) {
      LoggerUtil.debug('Socket disconnected');
    });

    socket.onConnectError((err) => LoggerUtil.debug('Connect Error: $err'));
    socket.onError((err) => LoggerUtil.debug('Socket Error: $err'));
  }

  io.Socket get socketInstance => socket;
  void joinChat(String chatId) => socket.emit('joinChat', chatId);
  void leaveChat(String chatId) => socket.emit('leaveChat', chatId);
  void disconnectSocket() {
    socket.disconnect();
  }
}

import 'dart:async';
import 'dart:developer' as dev;

mixin LogMixin on Object {
  String get _className => this.runtimeType.toString();

  void log(
    String message, {
    DateTime? time,
    int? sequenceNumber,
    int level: 0,
    String? name,
    Zone? zone,
    Object? error,
    StackTrace? stackTrace,
  }) {
    final now = DateTime.now();
    dev.log(
      '${now.hour}:${now.minute}:${now.second}.${now.millisecond} $message',
      name: name ?? _className,
      time: time,
      sequenceNumber: sequenceNumber,
      level: level,
      zone: zone,
      error: error,
      stackTrace: stackTrace,
    );
  }
}

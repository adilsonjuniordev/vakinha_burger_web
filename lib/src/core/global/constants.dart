import '../storage/session_storage.dart';

enum SessionStorageKeys {
  accessToken('/ACCESS_TOKEN/');

  final String key;

  const SessionStorageKeys(this.key);
}

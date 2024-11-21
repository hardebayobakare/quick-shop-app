import 'package:get_storage/get_storage.dart';

class CustomLocalStorage {

  late final GetStorage _storage;

  static CustomLocalStorage? _instance;

  CustomLocalStorage._();

  factory CustomLocalStorage.instance(){
    _instance ??= CustomLocalStorage._();
    return _instance!;
  }

  static Future<void> init(String bucketName) async {
    await GetStorage.init(bucketName);
    _instance = CustomLocalStorage._();
    _instance!._storage = GetStorage(bucketName);
  }

  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  Future<void> clearAllData() async {
    await _storage.erase();
  }
}
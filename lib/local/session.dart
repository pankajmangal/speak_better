import 'package:get_storage/get_storage.dart';

class SessionManager {
  final _myStorage = GetStorage();

  Future<void> saveString(String key, String value) async {
    _myStorage.write(key, value);
  }

  Future<String> getString(String key) async {
    String string_value;
    string_value = await _myStorage.read(key);
    return string_value;
  }

  Future<void> saveBoolean(String key, bool value) async {
    _myStorage.write(key, value);
    print("Bool saved");
  }

  Future<bool> getBoolean(String key) async {
    bool boolean_value;
    boolean_value = _myStorage.read(key) ?? false;
    print("Bool returned-$boolean_value");
    return boolean_value;
  }

  Future<void> clearPreferences() {
    _myStorage.erase();
  }

  /*Future<void> saveUser(String key, UserData value) async {
    _myStorage.write(key, value);
  }

  Future<void> saveBankData(String key, BankData value) async {
    _myStorage.write(key, value);
  }

  Future<void> saveVehicleData(String key, VehicleData value) async {
    _myStorage.write(key, value);
  }

  Future<UserData> getUser(String key) async {
    UserData user;
    user = UserData.fromJson(await _myStorage.read(key));
    print("..............");
    print(user);
    return user;
  }

  Future<BankData> getBankData(String key) async {
    BankData data = BankData.fromJson(await _myStorage.read(key));
    print("..............");
    print(data);
    return data;
  }

  Future<VehicleData> getVehicleData(String key) async {
    VehicleData data = VehicleData.fromJson(await _myStorage.read(key));
    print("..............");
    print(data);
    return data;
  }
*/
  Future<void> saveReasonList(String key, String value) async {
    _myStorage.write(key, value);
  }

  Future<String> getReasonList(String key) async {
    String data = await _myStorage.read(key);
    return data;
  }

  Future<void> saveServiceCategoryList(String key, String value) async {
    _myStorage.write(key, value);
  }

  Future<String> getServiceCategoryList(String key) async {
    String data = await _myStorage.read(key);
    return data;
  }
}

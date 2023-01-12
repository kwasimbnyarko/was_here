import 'package:get_mac_address/get_mac_address.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:was_here/api/datails_api_service.dart';
import '../utils/shared_preferences_keys.dart';

class UserDetails {
  static String? userId;
  static String? name;
  static String? indexNumber;
  static String? referenceNumber;
  static String? deviceMacAddress;
  static bool? areDetailsAvailable;

  static Future<void> getDeviceMacAddress() async {
    final prefs = await SharedPreferences.getInstance();

    try {
      deviceMacAddress = prefs.getString(deviceMacAddressKey);
      if (deviceMacAddress == null) {
        deviceMacAddress = await GetMacAddress().getMacAddress();
        if (deviceMacAddress != null) {
          prefs.setString(deviceMacAddressKey, deviceMacAddress!);
        }
      }
      print("device MAC Address : $deviceMacAddress");
      return;
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> getUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();

    userId = prefs.getString(detailsUserIdKey);
    name = prefs.getString(detailsNameKey);
    indexNumber = prefs.getString(detailsIndexNumberKey);
    referenceNumber = prefs.getString(detailsReferenceNumberKey);
    deviceMacAddress = prefs.getString(deviceMacAddressKey);
    areDetailsAvailable = (userId != null);
    print("hehe");
    if (!areDetailsAvailable!) {
      await getDeviceMacAddress();
      print('getting uset with thta mac');
      await DetailsApiService().getUserWithMacAddress(deviceMacAddress!);
    }
  }

  static void setUserDetailsToSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString(detailsUserIdKey, userId!);
    prefs.setString(detailsNameKey, name!);
    prefs.setString(detailsIndexNumberKey, indexNumber!);
    prefs.setString(detailsReferenceNumberKey, referenceNumber!);
    prefs.setString(deviceMacAddressKey, deviceMacAddress!);
  }
}

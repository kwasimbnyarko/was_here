import "package:get_mac/get_mac.dart";
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/shared_preferences_keys.dart';

class UserDetails {
  static String? name;
  static String? indexNumber;
  static String? referenceNumber;
  static bool? areDetailsAvailable;
  static String? deviceMacAddress;

  static void getUserDetails() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      name = prefs.getString(detailsNameKey);
      indexNumber = prefs.getString(detailsIndexNumberKey);
      referenceNumber = prefs.getString(detailsReferenceNumberKey);

      areDetailsAvailable = ((name != null) ||
          (indexNumber != null) ||
          (referenceNumber != null));

      if (!areDetailsAvailable!) {
        getDeviceMacAddress();

        //todo make api call for getting user details
      }
    } catch (e) {
      rethrow;
    }
  }

  static void getDeviceMacAddress() async {
    try {
      deviceMacAddress = await GetMac.macAddress;
      print("device MAC Address : $deviceMacAddress");
    } catch (e) {
      rethrow;
    }
  }
}

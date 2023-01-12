import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:was_here/user/user_details.dart';
import '../models/create_user_model.dart';
import '../utils/api_call_paths.dart';

class DetailsApiService {
  Future<int> createUser(CreateUserRequestModel requestModel) async {
    Uri url = Uri(scheme: scheme, host: host, path: createUserPath);

    try {
      final response = await http.post(url, body: requestModel.toJson());
      print('response status code : ${response.statusCode}');
      if (response.statusCode == 201) {
        var createUserResponse = json.decode(response.body);
        print("response.body = ${response.body}");
        UserDetails.userId = createUserResponse["_id"];
        UserDetails.name = createUserResponse["name"];
        UserDetails.indexNumber = createUserResponse["index_number"];
        UserDetails.referenceNumber = createUserResponse["reference_number"];
        UserDetails.deviceMacAddress = createUserResponse["mac_address"];
        UserDetails.areDetailsAvailable = true;
        UserDetails.setUserDetailsToSharedPreferences();
        return response.statusCode;
      }
    } catch (e) {
      rethrow;
    }
    return 0;
  }

  Future<void> getUserWithMacAddress(String macAddress) async {
    Uri url = Uri(
        scheme: scheme,
        host: host,
        path: getUserWithMacAddressPath + macAddress);

    print('mac address usef for request $macAddress');
    try {
      final response = await http.get(url);
      print('response status code : ${response.statusCode}');

      if (response.statusCode == 200) {
        var getUserWithMacAddressResponse = json.decode(response.body);
        print("response.body = ${response.body}");
        if (getUserWithMacAddressResponse["user"] == null) {
          print('no user');
          UserDetails.areDetailsAvailable = false;
        } else {
          print('yes user');
          UserDetails.userId = getUserWithMacAddressResponse["user"]["_id"];
          UserDetails.name = getUserWithMacAddressResponse["user"]["name"];
          UserDetails.indexNumber =
              getUserWithMacAddressResponse["user"]["index_number"];
          UserDetails.referenceNumber =
              getUserWithMacAddressResponse["user"]["reference_number"];
          // UserDetails.deviceMacAddress =
          //     getUserWithMacAddressResponse.user.mac_address;
          UserDetails.areDetailsAvailable = true;
          UserDetails.setUserDetailsToSharedPreferences();
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}

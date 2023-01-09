import 'package:http/http.dart' as http;

import '../models/create_user_model.dart';
import '../utils/api_call_paths.dart';

class DetailsApiService {
  Future<CreateUserResponseModel> createUser(
      CreateUserRequestModel requestModel) async {
    Uri url = Uri(scheme: scheme, host: host, path: createUserPath);

    try {
      final response = await http.post(url, body: requestModel.toJson());
      print(response.statusCode);
      if (response.statusCode == 201) {
        print("response.body = ${response.body}");
      }
    } catch (e) {
      rethrow;
    }

    return CreateUserResponseModel();
  }
}

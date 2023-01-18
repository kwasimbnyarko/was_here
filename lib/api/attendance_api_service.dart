import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:was_here/utils/api_call_paths.dart';
import '../models/mark_attendance_model.dart';

class AttendanceApiService {
  Future<MarkAttendanceResponseModel> markAttendance(
      MarkAttendanceRequestModel requestModel) async {
    try {
      Uri url = Uri(scheme: scheme, host: host, path: markAttendancePath);

      final response = await http.put(url, body: requestModel.toJson());
      print('mark attendance status code : ${response.statusCode}');
      print(response.body);
      var responseModelDecoded = json.decode(response.body);

      MarkAttendanceResponseModel responseModel = MarkAttendanceResponseModel(
          success: responseModelDecoded['success'],
          error: responseModelDecoded['error']);

      return responseModel;
    } catch (e) {
      rethrow;
    }
  }
}

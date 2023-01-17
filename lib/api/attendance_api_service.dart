import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:was_here/utils/api_call_paths.dart';
import '../models/mark_attendance_model.dart';

class AttendanceApiService {
  Future<int?> markAttendance(MarkAttendanceRequestModel requestModel) async {
    try {
      Uri url = Uri(scheme: scheme, host: host, path: markAttendancePath);

      final response = await http.put(url, body: requestModel.toJson());
      print('mark attendance status code : ${response.statusCode}');
      print(response.body);
      var responseModel = json.decode(response.body);
      if (response.statusCode != 200) {
        print(responseModel['error']);
        //todo show this on screen
      }
      return response.statusCode;
    } catch (e) {
      rethrow;
    }
    return null;
  }
}

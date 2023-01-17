import 'package:was_here/user/user_details.dart';

class MarkAttendanceRequestModel {
  String? code = '';

  // Map<String, String?> details = {'userId': UserDetails.userId};'userId': UserDetails.userId

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'code': code!.trim(),
      'userId': UserDetails.userId
    };
    return map;
  }
}

class MarkAttendanceResponseModel {
  bool? success;
  String? attendance;
  String? error;

  MarkAttendanceResponseModel({
    this.success,
    this.attendance,
    this.error,
  });
}

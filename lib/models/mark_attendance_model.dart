import 'package:was_here/user/user_details.dart';

class MarkAttendanceRequestModel {
  String? code = '';

  Map<String, String?> details = {'userId': UserDetails.userId};

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {'code': code!.trim(), 'details': details};
    return map;
  }
}

class MarkAttendanceResponseModel {
  String? success;
  String? attendance;
  String? error;

  MarkAttendanceResponseModel({
    this.success,
    this.attendance,
    this.error,
  });
}

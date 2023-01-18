import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:was_here/models/mark_attendance_model.dart';
import 'package:was_here/utils/app_routes.dart';

class ScanResultPage extends StatelessWidget {
  final MarkAttendanceResponseModel response;
  const ScanResultPage({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    if (response.success!) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Attendance marked succesfully'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).viewDetails();
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        color: const Color(0xff5671FF),
                        borderRadius: BorderRadius.circular(8)),
                    child: const Center(
                      child: Text(
                        'Done',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        //todo change to exit page
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(response.error!),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).scanPage();
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        color: const Color(0xff5671FF),
                        borderRadius: BorderRadius.circular(8)),
                    child: const Center(
                      child: Text(
                        'Try Again',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          //todo error specification
        ),
      );
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:was_here/utils/shared_preferences_keys.dart';
import '../components/details_page/DetailsTextField.dart';
import '../components/details_page/DetialsPageCustomButton.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../user/user_details.dart';

class ViewDetailsPage extends StatefulWidget {
  bool? areDetailsAvailable;

  @override
  State<ViewDetailsPage> createState() => _ViewDetailsPageState();
}

class _ViewDetailsPageState extends State<ViewDetailsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Expanded(
                flex: 4,
                child: Center(
                  child: Text(
                    "View My Details",
                    style: TextStyle(fontFamily: 'Nunito', fontSize: 35),
                  ),
                ),
              ),
              Expanded(
                flex: 14,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        DetailsTextField(
                          hintText: UserDetails.name ?? "--",
                          enabled: false,
                        ),
                        DetailsTextField(
                          hintText: UserDetails.indexNumber ?? "--",
                          keyboardType: TextInputType.number,
                          // maxLength: 7,
                          enabled: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter index number";
                            }
                            if (!RegExp(r"[0-9]+").hasMatch(value)) {
                              return "Please enter numbers only";
                            }
                            if (value.length < 7) {
                              return "Index must be 7 characters long";
                            }
                            return null;
                          },
                        ),
                        DetailsTextField(
                          hintText: UserDetails.referenceNumber ?? "--",
                          keyboardType: TextInputType.number,
                          // maxLength: 8,
                          enabled: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter index number";
                            }
                            if (!RegExp(r"[0-9]+").hasMatch(value)) {
                              return "Please enter numbers only";
                            }
                            if (value.length < 8) {
                              return "Index must be 8 characters long";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: GestureDetector(
                            onTap: () {
                              //todo mark attendance call here
                            },
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: const Color(0xff5671FF),
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Center(
                                child: Text(
                                  'Scan',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:was_here/utils/shared_preferences_keys.dart';
import '../components/details_page/DetailsTextField.dart';
import '../components/details_page/DetialsPageCustomButton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailsPage extends StatefulWidget {
  bool? areDetailsAvailable;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Future checkIfDetailsAreAvailable() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      widget.areDetailsAvailable = prefs.getBool(detailsAreAvailableKey);
    });
  }

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
                    "My Details",
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
                          hintText: "Full Name",
                          enabled: (widget.areDetailsAvailable!) ? false : true,
                        ),
                        DetailsTextField(
                          hintText: "Index Number",
                          keyboardType: TextInputType.number,
                          maxLength: 7,
                          enabled: (widget.areDetailsAvailable!) ? false : true,
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
                          hintText: "Reference number",
                          keyboardType: TextInputType.number,
                          maxLength: 8,
                          enabled: (widget.areDetailsAvailable!) ? false : true,
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
                          height: 20,
                        ),
                        const CustomButton(
                          buttonColor: Color(0xff8c8c8c),
                          buttonLabel: "Change Details",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const CustomButton(
                          buttonColor: Color(0xff5671FF),
                          buttonLabel: "Done",
                          labelColor: Colors.white,
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

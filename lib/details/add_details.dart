import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/details_page/DetailsTextField.dart';
import '../components/details_page/DetialsPageCustomButton.dart';

class DetailsPage extends StatelessWidget {
  // const DetailsPage({Key? key}) : super(key: key);

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
                        const DetailsTextField(
                          hintText: "Full Name",
                        ),
                        DetailsTextField(
                          hintText: "Index Number",
                          keyboardType: TextInputType.number,
                          maxLength: 7,
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

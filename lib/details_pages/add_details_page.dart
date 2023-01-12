import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:was_here/api/datails_api_service.dart';
import 'package:was_here/user/user_details.dart';
import 'package:was_here/utils/app_routes.dart';
import '../components/details_page/DetailsTextField.dart';
import '../models/create_user_model.dart';

class AddDetailsPage extends StatefulWidget {
  bool? areDetailsAvailable;
  CreateUserRequestModel requestModel = CreateUserRequestModel();

  @override
  State<AddDetailsPage> createState() => _AddDetailsPageState();
}

class _AddDetailsPageState extends State<AddDetailsPage> {
  final _formKey = GlobalKey<FormState>();

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
                    "Enter Details",
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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          DetailsTextField(
                            hintText: "Full Name",
                            validator: (value) {
                              setState(() {
                                widget.requestModel.name = value!;
                              });
                            },
                          ),
                          DetailsTextField(
                            hintText: "Index Number",
                            keyboardType: TextInputType.number,
                            maxLength: 7,
                            // enabled: (widget.areDetailsAvailable!) ? false : true,
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
                              setState(() {
                                widget.requestModel.indexNumber = value;
                              });
                              return null;
                            },
                          ),
                          DetailsTextField(
                            hintText: "Reference number",
                            keyboardType: TextInputType.number,
                            maxLength: 8,
                            // enabled: (widget.areDetailsAvailable!) ? false : true,
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
                              setState(() {
                                widget.requestModel.referenceNumber = value;
                              });
                              return null;
                            },
                          ),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          // const CustomButton(
                          //   buttonColor: Color(0xff8c8c8c),
                          //   buttonLabel: "Change Details",
                          // ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: GestureDetector(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    widget.requestModel.macAddress =
                                        UserDetails.deviceMacAddress!;
                                  });
                                }
                                DetailsApiService()
                                    .createUser(widget.requestModel)
                                    .then((value) => {
                                          if (value == 201)
                                            {
                                              Navigator.of(context)
                                                  .viewDetails()
                                            }
                                        });
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';
import '../../models/feedback_model.dart';
import 'feedback_controller.dart';

class FeedbackScreen extends StatefulWidget {
  final PageController controller;

  const FeedbackScreen({Key key, this.controller}) : super(key: key);
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController _emailcontroller = TextEditingController();

  String get feedback => _emailcontroller.text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    //top: MediaQuery.of(context).padding.top,
                      left: 16,
                      right: 16),
                  child: Image.asset('assets/img.png'),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    'Your FeedBack',
                    style: GoogleFonts.cookie(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 16),
                  child: const Text(
                    'Give your best time for this moment.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                _buildComposer(),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Center(
                    child: Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius:
                        const BorderRadius.all(Radius.circular(4.0)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.6),
                              offset: const Offset(4, 4),
                              blurRadius: 8.0),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            _submitForm(feedback);
                          },
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                'Send',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
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
    );
  }

  Widget _buildComposer() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(8),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                offset: const Offset(4, 4),
                blurRadius: 8),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            padding: const EdgeInsets.all(4.0),
            constraints: const BoxConstraints(minHeight: 80, maxHeight: 160),
            color: Color(0xFFFFFFFF),
            child: SingleChildScrollView(
              padding:
              const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
              child: TextField(
                controller: _emailcontroller,
                maxLines: null,
                onChanged: (String txt) {},
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF313A44),
                ),
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your feedback...'),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm(String feedback) {
    FeedbackForm feedbackForm = FeedbackForm(Constants.rate, feedback);

    FormController formController = FormController((String response) {
      print("Response: $response");
      if (feedback == "") {
        Constants.confirmCopyLink(context,
            title: "Empty Feedback",
            content: "Feedback can't be empty, please write a feedback",
            defaultActionText: "Ok");
        widget.controller.animateToPage(
          0,
          duration: const Duration(milliseconds: 1200),
          curve: Curves.fastOutSlowIn,
        );
      } else if (response == FormController.STATUS_SUCCESS) {
        Constants.confirmCopyLink(context,
            title: "Feedback Submitted",
            content:
            "Thank you for you feedback, we will take your feedback into consideration ",
            defaultActionText: "Ok");
        widget.controller.animateToPage(
          0,
          duration: const Duration(milliseconds: 1200),
          curve: Curves.fastOutSlowIn,
        );
      } else {
        Constants.confirmCopyLink(context,
            title: "Error occured",
            content:
            "Error ocurrs while submitting your feedback, please check your internet connection and try again later",
            defaultActionText: "Ok");
        widget.controller.animateToPage(
          0,
          duration: const Duration(milliseconds: 1200),
          curve: Curves.fastOutSlowIn,
        );
      }
    });

    // Submit 'feedbackForm' and save it in Google Sheet
    if (feedback != "") {
      formController.submitForm(feedbackForm);
    }

    _emailcontroller.clear();
  }
}

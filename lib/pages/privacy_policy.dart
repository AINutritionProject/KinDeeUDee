import 'package:appfood2/widgets/button_back.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color.fromRGBO(255, 251, 236, 1),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 30),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: ButtonBack(
                      colorCircle: Colors.orange,
                      color: Colors.white,
                    )),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  "นโยบายความเป็นส่วนตัว",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.65,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 251, 236, 1),
                      border: Border.all(color: Colors.black38, width: 1.4),
                    ),
                    child: SfPdfViewer.asset(
                      "assets/documents/appfood_privacy_policy.pdf",
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

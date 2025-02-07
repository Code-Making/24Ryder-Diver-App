import 'package:flutter/material.dart';
import 'package:rideapp/ui/pages/home/payments/payment_method.dart';
import 'package:rideapp/ui/pages/profile/profile.dart';
import 'package:rideapp/ui/pages/utils/extension.dart';

class TermsPage extends StatefulWidget {
  const TermsPage(
      {super.key,
      required this.title,
      required this.desc,
      required this.subtitle});
  final String title;
  final String subtitle;
  final String desc;
  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Base(children: [
        CustomHeader(
          title: widget.title,
          addpadding: false,
        ),
        40.toh,
        widget.subtitle.toText(),
        16.toh,
        widget.desc.toText(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: "#6F6F6F".toHex()),
      ]),
    );
  }
}

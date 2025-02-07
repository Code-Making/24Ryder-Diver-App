import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rideapp/ui/pages/CustomHeader/customheader.dart';
import 'package:rideapp/ui/pages/profile/profile.dart';
import 'package:rideapp/ui/pages/utils/colors.dart';
import 'package:rideapp/ui/pages/utils/extension.dart';

class FAQs extends StatefulWidget {
  const FAQs({super.key});

  @override
  State<FAQs> createState() => _FAQsState();
}

class _FAQsState extends State<FAQs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Base(children: [
        const CustomHeader(
          title: "FAQs",
          addpadding: false,
        ),
        20.toh,
        const SearchField(),
        20.toh,
        const FaqWidget(
            label: ("How do I manage my notifications?"),
            desc:
                ("""To manage notifications, go to "Settings," select\n"Notification Settings," and customize your preferences.""")),
        const FaqWidget(
            label: ("How do I start a guided meditation session?"),
            desc:
                ("""To manage notifications, go to "Settings," select\n"Notification Settings," and customize your preferences.""")),
        const FaqWidget(
            label: ("How do I join a support group?"),
            desc:
                ("""To manage notifications, go to "Settings," select\n"Notification Settings," and customize your preferences.""")),
        const FaqWidget(
            label: ("How do I join a support group?"),
            desc:
                ("""To manage notifications, go to "Settings," select\n"Notification Settings," and customize your preferences.""")),
        const FaqWidget(
            label: ("HIs my data safe and private?"),
            desc:
                ("""To manage notifications, go to "Settings," select\n"Notification Settings," and customize your preferences.""")),
      ]),
    );
  }
}

class FaqWidget extends StatefulWidget {
  const FaqWidget({super.key, required this.label, required this.desc});
  final String label;
  final String desc;
  @override
  State<FaqWidget> createState() => _FaqWidgetState();
}

class _FaqWidgetState extends State<FaqWidget> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromRGBO(48, 45, 129, 0.06),
          borderRadius: BorderRadius.circular(23)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(23), topRight: Radius.circular(23)),
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Row(
              children: [
                widget.label
                    .toText(fontSize: 15, fontWeight: FontWeight.w600)
                    .paddingAll(16),
                InkWell(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: const Icon(
                    Icons.keyboard_arrow_down_outlined,
                  ),
                ),
              ],
            ),
          ),
          if (isExpanded)
            Container(
              height: 2,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(23)),
            ),
          if (isExpanded)
            widget.desc
                .toText(fontSize: 12, fontWeight: FontWeight.w400)
                .paddingAll(16),
          20.toh,
        ],
      ),
    ).marginOnly(bottom: 16);
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
          child: Image.asset(
            "assets/search-md.png",
            height: 16,
            width: 16,
          ),
        ),
        hintText: "search for help",
        hintStyle: TextStyle(
          color: Palette.primary,
        ),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: Colors.transparent,
            )),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: Colors.transparent,
            )),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: Colors.transparent,
            )),
        filled: true,
        fillColor: const Color.fromRGBO(48, 45, 129, 0.06),
      ),
    );
  }
}

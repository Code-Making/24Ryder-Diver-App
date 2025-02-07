import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rideapp/ui/pages/CustomHeader/customheader.dart';

import 'package:rideapp/ui/pages/profile/profile.dart';
import 'package:rideapp/ui/pages/terms/terms.dart';
import 'package:rideapp/ui/pages/utils/extension.dart';
import 'package:rideapp/ui/pages/widgets/home.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Base(
        addPadding: false,
        children: [
          const CustomHeader(
            title: 'Settings',
            addpadding: false,
          ),
          20.toh,
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  thickness: .5,
                  color: Colors.grey.shade300,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const TermsPage(
                        title: "About Us",
                        desc:
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essenti\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essenti\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essenti",
                        subtitle: "About app"));
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: "About"
                        .toText(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        )
                        .paddingSymmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                  ),
                ),
                Divider(
                  thickness: .5,
                  color: Colors.grey.shade300,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const TermsPage(
                        title: "Terms & Conditions",
                        desc:
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essenti\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essenti\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essenti",
                        subtitle: "Terms of Use"));
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: "Terms & Conditions"
                        .toText(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        )
                        .paddingSymmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                  ),
                ),
                Divider(
                  thickness: .5,
                  color: Colors.grey.shade300,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const TermsPage(
                        title: "Terms & Conditions",
                        desc:
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essenti\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essenti\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essenti",
                        subtitle: "Privacy Policies"));
                  },
                  child: Container(
                    child: "Privacy Policies"
                        .toText(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        )
                        .paddingSymmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                  ),
                ),
                Divider(
                  thickness: .5,
                  color: Colors.grey.shade300,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    child: "Delete Account"
                        .toText(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        )
                        .paddingSymmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                  ),
                ),
                Divider(
                  thickness: .5,
                  color: Colors.grey.shade300,
                ),
                GestureDetector(
                  onTap: () {
                    Get.bottomSheet(
                        const BottomSheetWidget(child: LanguageSelector()));
                  },
                  child: Container(
                    child: "Language"
                        .toText(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        )
                        .paddingSymmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                  ),
                ),
                Divider(
                  thickness: .5,
                  color: Colors.grey.shade300,
                ),
              ])
        ],
      ),
    );
  }
}

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  _LanguageSelectorState createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  String? _selectedLanguage = 'en';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          "Select Language".title.paddingOnly(left: 30, top: 30),
          RadioListTile<String>(
            title: const Text('English'),
            value: 'en',
            groupValue: _selectedLanguage,
            onChanged: (String? value) {
              setState(() {
                _selectedLanguage = value;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('Hindi'),
            value: 'hi',
            groupValue: _selectedLanguage,
            onChanged: (String? value) {
              setState(() {
                _selectedLanguage = value;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('Spanish'),
            value: 'es',
            groupValue: _selectedLanguage,
            onChanged: (String? value) {
              setState(() {
                _selectedLanguage = value;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('French'),
            value: 'fr',
            groupValue: _selectedLanguage,
            onChanged: (String? value) {
              setState(() {
                _selectedLanguage = value;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('German'),
            value: 'de',
            groupValue: _selectedLanguage,
            onChanged: (String? value) {
              setState(() {
                _selectedLanguage = value;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('Chinese'),
            value: 'zh',
            groupValue: _selectedLanguage,
            onChanged: (String? value) {
              setState(() {
                _selectedLanguage = value;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('Japanese'),
            value: 'ja',
            groupValue: _selectedLanguage,
            onChanged: (String? value) {
              setState(() {
                _selectedLanguage = value;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('Korean'),
            value: 'ko',
            groupValue: _selectedLanguage,
            onChanged: (String? value) {
              setState(() {
                _selectedLanguage = value;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('Hindi'),
            value: 'hi',
            groupValue: _selectedLanguage,
            onChanged: (String? value) {
              setState(() {
                _selectedLanguage = value;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('Portuguese'),
            value: 'pt',
            groupValue: _selectedLanguage,
            onChanged: (String? value) {
              setState(() {
                _selectedLanguage = value;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('Arabic'),
            value: 'ar',
            groupValue: _selectedLanguage,
            onChanged: (String? value) {
              setState(() {
                _selectedLanguage = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

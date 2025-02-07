import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:rideapp/ui/pages/CustomHeader/customheader.dart';
import 'package:rideapp/ui/pages/utils/colors.dart';
import 'package:rideapp/ui/pages/utils/extension.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            CustomHeader(title: "Chat"),
            Expanded(child: MessagesWidget()),
          ],
        ),
      ),
    );
  }
}

class MessagesWidget extends StatefulWidget {
  const MessagesWidget({super.key});

  @override
  State<MessagesWidget> createState() => _MessagesWidgetState();
}

class _MessagesWidgetState extends State<MessagesWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Column(
                children: [
                  const RiderMessage(
                    message: "Good Evening!",
                    showTime: false,
                  ),
                  const RiderMessage(
                    message: "Welcome to 24RYDE Customer Service ",
                    showIcon: false,
                  ),
                  const UserMessage().alignRight,
                  const RiderMessage(
                    message: "Welcome to 24RYDE Customer Service ",
                  ),
                  const UserMessage(messagedTime: "Just Now").alignRight,
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              const Icon(Icons.add_circle_outline_sharp),
              8.toW,
              const Expanded(
                  child: TextField(
                decoration: InputDecoration(
                    hintText: 'Enter your message',
                    suffixIcon: Icon(
                      Icons.sentiment_satisfied,
                    ),
                    isDense: true,
                    border: OutlineInputBorder()),
              )),
              8.toW,
              Image.asset(
                "assets/Subtract.png",
                height: 16,
              ),
              8.toW,
            ],
          ),
        )
      ],
    );
  }
}

class RiderMessage extends StatelessWidget {
  const RiderMessage({
    super.key,
    this.showIcon = true,
    this.showTime = true,
    required this.message,
  });
  final String message;
  final bool showIcon;
  final bool showTime;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: showIcon == false ? 0 : 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showIcon)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/Ellipse 42.png",
                  height: 35,
                ),
                12.toW,
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.zero,
                        topRight: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16)),
                    color: "background: #E8E8E8;".toHexColor(),
                  ),
                  child: message.toText(
                      color: "background: #5A5A5A;".toHexColor(),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ],
            )
          else
            Container(
              margin: const EdgeInsets.only(left: 47, top: 4),
              constraints: const BoxConstraints(maxWidth: 200),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.zero,
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16)),
                color: "background: #E8E8E8;".toHexColor(),
              ),
              child: (message.toText(
                  color: "background: #5A5A5A;".toHexColor(),
                  fontSize: 14,
                  fontWeight: FontWeight.w400)),
            ),
          8.toh,
          if (showTime)
            "8:29 pm"
                .toText(
                    color: "background: #717171;".toHexColor(),
                    fontSize: 12,
                    fontWeight: FontWeight.w400)
                .marginOnly(left: 47),
        ],
      ),
    );
  }
}

class UserMessage extends StatelessWidget {
  const UserMessage({super.key, this.messagedTime = ''});
  final String messagedTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 0, top: 24),
          constraints: const BoxConstraints(maxWidth: 300),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Palette.primary),
            borderRadius: const BorderRadius.only(
                topRight: Radius.zero,
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16)),
            color: "background: #F5F4FF;".toHexColor(),
          ),
          child: ("Welcome to 24RYDE Customer Service ".toText(
              color: "background: #5A5A5A;".toHexColor(),
              fontSize: 14,
              fontWeight: FontWeight.w400)),
        ).alignRight,
        8.toh,
        messagedTime
            .toText(
                color: "background: #717171;".toHexColor(),
                fontSize: 12,
                fontWeight: FontWeight.w400)
            .marginOnly(left: 47)
            .alignRight,
      ],
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
  List<Map<String, dynamic>> messages = [];
  TextEditingController messageController = TextEditingController();

  Future<void> sendMessage(String message) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
      'POST',
      Uri.parse('https://taxi.servermaster.online/taxi_app/api/send-message'),
    );
    request.body =
        json.encode({"message": message, "user_id": "112", "sender_id": "114"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      var jsonResponse = json.decode(responseBody);
      if (jsonResponse['status'] == true) {
        setState(() {
          messages.add({
            "message": message,
            "sender_id": "40",
            "receiver_id": "8",
            "created_at": DateTime.now().toString()
          });
        });
      }
    } else {
      print("Error: ${response.reasonPhrase}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const CustomHeader(title: "Chat"),
            Expanded(
              child: MessagesWidget(messages: messages),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  const Icon(Icons.add_circle_outline_sharp),
                  8.toW,
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      decoration: const InputDecoration(
                        hintText: 'Enter your message',
                        suffixIcon: Icon(Icons.sentiment_satisfied),
                        isDense: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  8.toW,
                  GestureDetector(
                    onTap: () {
                      if (messageController.text.isNotEmpty) {
                        sendMessage(messageController.text);
                        messageController.clear();
                      }
                    },
                    child: Image.asset(
                      "assets/Subtract.png",
                      height: 16,
                    ),
                  ),
                  8.toW,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesWidget extends StatelessWidget {
  final List<Map<String, dynamic>> messages;
  const MessagesWidget({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: messages.map((msg) {
        return msg['sender_id'] == "40"
            ? UserMessage(message: msg['message'])
            : RiderMessage(message: msg['message']);
      }).toList(),
    );
  }
}

class RiderMessage extends StatelessWidget {
  final String message;
  final bool showIcon;
  final bool showTime;
  const RiderMessage(
      {super.key,
      this.showIcon = true,
      this.showTime = true,
      required this.message});

  @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     margin: const EdgeInsets.only(top: 16),
  //     padding: const EdgeInsets.all(12),
  //     decoration: BoxDecoration(
  //       color: Colors.grey[300],
  //       borderRadius: BorderRadius.circular(12),
  //     ),
  //     child: Text(message),
  //   );
  // }
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
          // if (showTime)
          //   "8:29 pm"
          //       .toText(
          //           color: "background: #717171;".toHexColor(),
          //           fontSize: 12,
          //           fontWeight: FontWeight.w400)
          //       .marginOnly(left: 47),
        ],
      ),
    );
  }
}

class UserMessage extends StatelessWidget {
  final String message;
  const UserMessage({super.key, required this.message});

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
          child: (message.toText(
              color: "background: #5A5A5A;".toHexColor(),
              fontSize: 14,
              fontWeight: FontWeight.w400)),
        ).alignRight,
        8.toh,
      ],
    );
  }
}

// class RiderMessage extends StatelessWidget {
//   const RiderMessage({
//     super.key,
//     this.showIcon = true,
//     this.showTime = true,
//     required this.message,
//   });
//   final String message;
//   final bool showIcon;
//   final bool showTime;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(top: showIcon == false ? 0 : 24),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           if (showIcon)
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Image.asset(
//                   "assets/Ellipse 42.png",
//                   height: 35,
//                 ),
//                 12.toW,
//                 Container(
//                   alignment: Alignment.center,
//                   padding: const EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     borderRadius: const BorderRadius.only(
//                         topLeft: Radius.zero,
//                         topRight: Radius.circular(16),
//                         bottomLeft: Radius.circular(16),
//                         bottomRight: Radius.circular(16)),
//                     color: "background: #E8E8E8;".toHexColor(),
//                   ),
//                   child: message.toText(
//                       color: "background: #5A5A5A;".toHexColor(),
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400),
//                 ),
//               ],
//             )
//           else
//             Container(
//               margin: const EdgeInsets.only(left: 47, top: 4),
//               constraints: const BoxConstraints(maxWidth: 200),
//               alignment: Alignment.center,
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.only(
//                     topLeft: Radius.zero,
//                     topRight: Radius.circular(16),
//                     bottomLeft: Radius.circular(16),
//                     bottomRight: Radius.circular(16)),
//                 color: "background: #E8E8E8;".toHexColor(),
//               ),
//               child: (message.toText(
//                   color: "background: #5A5A5A;".toHexColor(),
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400)),
//             ),
//           8.toh,
//           if (showTime)
//             "8:29 pm"
//                 .toText(
//                     color: "background: #717171;".toHexColor(),
//                     fontSize: 12,
//                     fontWeight: FontWeight.w400)
//                 .marginOnly(left: 47),
//         ],
//       ),
//     );
//   }
// }

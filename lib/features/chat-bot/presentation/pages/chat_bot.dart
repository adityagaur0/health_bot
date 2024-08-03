import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:health_bot/core/utils/constant/colour.dart';
import 'package:health_bot/features/chat-bot/data/model/chat_message_model.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class ChatBot extends StatelessWidget {
  const ChatBot({super.key});

  @override
  Widget build(BuildContext context) {
    List<ChatMessageModel> messages = [
      ChatMessageModel(
          role: "user", parts: [ChatPartModel(text: "Hello, How are you?")]),
      ChatMessageModel(
          role: "space_pod",
          parts: [ChatPartModel(text: "I am fine, How can I help you?")]),
      ChatMessageModel(
          role: "user", parts: [ChatPartModel(text: "I am not feeling well")]),
      ChatMessageModel(
          role: "space_pod",
          parts: [ChatPartModel(text: "I am sorry to hear that")]),
      ChatMessageModel(
          role: "user",
          parts: [ChatPartModel(text: "Can you help me with my symptoms?")]),
      ChatMessageModel(
          role: "space_pod",
          parts: [ChatPartModel(text: "Sure, Please tell me your symptoms")]),
      ChatMessageModel(
          role: "user", parts: [ChatPartModel(text: "I have a headache")]),
      ChatMessageModel(
          role: "space_pod",
          parts: [ChatPartModel(text: "I am sorry to hear that")]),
      ChatMessageModel(
          role: "user", parts: [ChatPartModel(text: "I have a headache")]),
    ];
    TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 249, 249),
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white.withOpacity(0.9),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz_outlined),
            onPressed: () {},
          )
        ],
      ),
      body: Stack(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          chat(messages: messages),
          // const SizedBox(
          //   height: 10,
          // ),
          // Positioned.fill(
          //     child: BackdropFilter(
          //   filter: ImageFilter.blur(sigmaX: 5, sigmaY: 10),
          //   child: const SizedBox(),
          // )),
          Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: BottomTextField(
                  textEditingController: textEditingController)),
          // const SizedBox(
          //   height: 20,
          // ),
        ],
      ),
    );
  }
}

class BottomTextField extends StatefulWidget {
  const BottomTextField({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  _BottomTextFieldState createState() => _BottomTextFieldState();
}

class _BottomTextFieldState extends State<BottomTextField> {
  bool _isFocused = false;
  bool _isRecording = false;
  FocusNode _focusNode = FocusNode();
  stt.SpeechToText _speech = stt.SpeechToText();
  String _recordedText = '';

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _startListening() async {
    bool available = await _speech.initialize();
    if (available) {
      setState(() {
        _isRecording = true;
      });
      _speech.listen(onResult: (result) {
        setState(() {
          _recordedText = result.recognizedWords;
        });
      });
    }
  }

  void _stopListening() {
    _speech.stop();
    setState(() {
      _isRecording = false;
      widget.textEditingController.text = _recordedText;
    });
  }

  void _cancelRecording() {
    _speech.stop();
    setState(() {
      _isRecording = false;
      _recordedText = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          if (_isFocused)
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                _focusNode.unfocus();
              },
            ),
          if (!_isFocused) ...[
            IconButton(
              icon: const Icon(Icons.camera_alt_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.wallpaper),
              onPressed: () {},
            ),
          ],
          Expanded(
            child: TextFormField(
              focusNode: _focusNode,
              controller: widget.textEditingController,
              style: const TextStyle(color: Colors.black),
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.white,
                hintText: "Message",
                hintStyle: TextStyle(color: Colors.grey.shade400),
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    if (_isRecording) {
                      _stopListening();
                    } else {
                      _startListening();
                    }
                  },
                  onHorizontalDragUpdate: (details) {
                    if (details.primaryDelta! > 0) {
                      _cancelRecording();
                    }
                  },
                  child: Icon(
                    _isRecording ? Icons.mic : Icons.mic_none,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          IconButton(
            icon: Icon(Icons.send, color: Theme.of(context).primaryColor),
            onPressed: () {
              if (widget.textEditingController.text.isNotEmpty) {
                String text = widget.textEditingController.text;
                widget.textEditingController.clear();
                // Add your message sending logic here
              }
            },
          ),
        ],
      ),
    );
  }
}

class chat extends StatelessWidget {
  const chat({
    super.key,
    required this.messages,
  });

  final List<ChatMessageModel> messages;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 90),
      child: ListView.builder(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            bool isUserMessage = messages[index].role == "user";
            return MessageBox(
              isUserMessage: isUserMessage,
              message: messages[index].parts.first.text,
            );
          }),
    );
  }
}

class MessageBox extends StatelessWidget {
  final bool isUserMessage;
  final String message;

  MessageBox({required this.isUserMessage, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isUserMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: isUserMessage
                  ? TColors.primary.withOpacity(0.1)
                  : Colors.grey.withOpacity(0.1),
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.75,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isUserMessage ? "You" : "Doobi.",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: isUserMessage ? TColors.primary : TColors.black),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    message,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(height: 1.2),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Icon(
              isUserMessage ? Icons.done_all : null,
              color: isUserMessage ? TColors.primary : Colors.grey,
              size: 20,
            ),
          )
        ],
      ),
    );
  }
}
// class bottom_text_field extends StatelessWidget {
//   const bottom_text_field({
//     super.key,
//     required this.textEditingController,
//   });

//   final TextEditingController textEditingController;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
// decoration: BoxDecoration(
//   boxShadow: const [
//     BoxShadow(
//       color: Colors.black,
//       blurRadius: 100,
//       offset: Offset(0, 60),
//     ),
//   ],
//   borderRadius: BorderRadius.circular(50),
// ),
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       child: Row(
//         children: [
//           IconButton(
//             icon: const Icon(Icons.camera_alt_outlined),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: const Icon(Icons.wallpaper),
//             onPressed: () {},
//           ),
//           Expanded(
//               child: TextFormField(
//             controller: textEditingController,
//             style: const TextStyle(color: Colors.black),
//             cursorColor: Theme.of(context).primaryColor,
//             decoration: InputDecoration(
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(100),
//               ),
//               fillColor: Colors.white,
//               hintText: "Message",
//               hintStyle: TextStyle(color: Colors.grey.shade400),
//               filled: true,
//               focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(100),
//                   borderSide:
//                       BorderSide(color: Theme.of(context).primaryColor)),
//             ),
//           )),
//           const SizedBox(width: 12),
//           // InkWell(
//           //   onTap: () {
//           //     if (textEditingController.text.isNotEmpty) {
//           //       String text = textEditingController.text;
//           //       textEditingController.clear();
//           //       // messages.add(tex);
//           //       // chatBloc.add(
//           //       //   ChatGenerateNewTextMessageEvent(inputMessage: text),
//           //       // );
//           //     }
//           //   },
//           //   child: CircleAvatar(
//           //     radius: 32,
//           //     backgroundColor: Colors.white,
//           //     child: CircleAvatar(
//           //       radius: 30,
//           //       backgroundColor: TColors.primary,
//           //       child: const Center(
//           //         child: Icon(Icons.send, color: Colors.white),
//           //       ),
//           //     ),
//           //   ),
//           // )
//         ],
//       ),
//     );
//   }
// }

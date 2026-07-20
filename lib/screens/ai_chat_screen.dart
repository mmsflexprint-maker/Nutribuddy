import 'package:flutter/material.dart';
import '../services/api_service.dart';


class AIChatScreen extends StatefulWidget {
  const AIChatScreen({super.key});

  @override
  State<AIChatScreen> createState() => _AIChatScreenState();
}

class _AIChatScreenState extends State<AIChatScreen> {

  // Controller for typing messages
  final TextEditingController _messageController =
      TextEditingController();

  // Scroll Controller
  final ScrollController _scrollController =
      ScrollController();

  // Chat Messages
  final List<Map<String, dynamic>> _messages = [

    {
      "message":
          "👋 Hello! I'm NutriBuddy AI.\nHow can I help you today?",
      "isUser": false,
    }

  ];

  bool isTyping = false;

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
    Widget _buildMessageBubble(Map<String, dynamic> message) {
    bool isUser = message["isUser"];

    return Align(
      alignment:
          isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: isUser ? Colors.green : Colors.grey.shade300,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(18),
            topRight: const Radius.circular(18),
            bottomLeft:
                isUser ? const Radius.circular(18) : Radius.zero,
            bottomRight:
                isUser ? Radius.zero : const Radius.circular(18),
          ),
        ),
        child: Text(
          message["message"],
          style: TextStyle(
            color: isUser ? Colors.white : Colors.black87,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _typingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "🤖 AI is typing...",
          style: TextStyle(
            color: Colors.grey,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
    Future<void> _sendMessage() async  {
    String text = _messageController.text.trim();

    if (text.isEmpty) return;

    // Add user's message
    setState(() {
      _messages.add({
        "message": text,
        "isUser": true,
      });

      isTyping = true;
    });

    _messageController.clear();

    // Scroll to bottom
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });

    // Fake AI response (we'll replace this with FastAPI later)
   

      String aiReply = await ApiService.askAI(text);

setState(() {
  isTyping = false;

  _messages.add({
    "message": aiReply,
    "isUser": false,
  });
});

Future.delayed(const Duration(milliseconds: 100), () {
  if (_scrollController.hasClients) {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
});
  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.smart_toy,
                color: Colors.green,
              ),
            ),
            SizedBox(width: 10),
            Text(
              "NutriBuddy AI",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),

      body: Column(
        children: [

          // Chat Messages
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(10),
              itemCount:
                  _messages.length + (isTyping ? 1 : 0),
              itemBuilder: (context, index) {

                if (index == _messages.length &&
                    isTyping) {
                  return _typingIndicator();
                }

                return _buildMessageBubble(
                    _messages[index]);
              },
            ),
          ),

          const Divider(height: 1),

          // Bottom Chat Box
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.white,
            child: Row(
              children: [

                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Ask me anything...",
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(25),
                      ),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),

                const SizedBox(width: 10),

                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.green,
                  child: IconButton(
                    icon: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                    onPressed: _sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
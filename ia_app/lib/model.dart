// ignore_for_file: public_member_api_docs, sort_constructors_first
enum MessageType { usuario, bot }

class ChatMessage {
  final String text;
  final MessageType messageType;

  ChatMessage({
    required this.text,
    required this.messageType,
  });
}

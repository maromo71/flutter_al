import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ia_app/chat_meesage_widget.dart';
import 'package:ia_app/model.dart';
import 'package:ia_app/constant.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ChatPage(),
    );
  }
}

//metodo gerador de resposta

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late bool isLoading;
  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<ChatMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  Future<String> generateResponse(String prompt) async {
    const apiKey = apiSecretKey;

    var url = Uri.https("api.openai.com", "/v1/completions");
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
        'Accept-Language': 'pt-BR',
      },
      body: jsonEncode({
        "model": "text-davinci-003",
        "prompt": prompt,
        'temperature': 0,
        'max_tokens': 2000,
        'top_p': 1,
        'frequency_penalty': 0.0,
        'presence_penalty': 0.0,
      }),
    );

    // Do something with the response

    Map<String, dynamic> newresponse = jsonDecode(response.body);
    return newresponse['choices'][0]['text'];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
          title: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Open IA - ChatGPT - Exemplo em Flutter',
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          backgroundColor: botBgColor,
        ),
        backgroundColor: bgColor,
        body: Column(
          children: [
            //corpo do chat
            Expanded(
              child: _buildList(),
            ),

            Visibility(
              visible: isLoading,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  //campos de entrada
                  _buildInput(),

                  //botão de submissao
                  _buildSubmit(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView _buildList() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        var message = _messages[index];
        return ChatMessageWidget(
          text: message.text,
          chatMessageType: message.messageType,
        );
      },
    );
  }

  Widget _buildSubmit() {
    return Visibility(
      visible: !isLoading,
      child: Container(
        color: botBgColor,
        child: IconButton(
          iconSize: 32,
          icon: const Icon(
            Icons.send_rounded,
            color: Color.fromRGBO(142, 142, 160, 0.8),
          ),
          onPressed: () {
            //mostrar o input do usuario
            setState(() {
              _messages.add(
                ChatMessage(
                  text: _textEditingController.text,
                  messageType: MessageType.usuario,
                ),
              );
              isLoading = true;
            });

            var input = _textEditingController.text;
            _textEditingController.clear();
            Future.delayed(const Duration(microseconds: 50))
                .then((value) => _scrolDown());

            //chamar a api do chatbot
            generateResponse(input).then((value) {
              setState(() {
                isLoading = false;
                //mostrar resposta do chatbot
                debugPrint(value);
                String sDecoded = utf8.decode(value.runes.toList());
                _messages.add(
                  ChatMessage(text: sDecoded, messageType: MessageType.bot),
                );
              });
            });
            _textEditingController.clear();
            Future.delayed(const Duration(milliseconds: 50))
                .then((value) => _scrolDown());
          },
        ),
      ),
    );
  }

  Expanded _buildInput() {
    return Expanded(
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(
          color: Colors.white,
        ),
        controller: _textEditingController,
        decoration: const InputDecoration(
            fillColor: botBgColor,
            filled: true,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none),
      ),
    );
  }

  void _scrolDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}

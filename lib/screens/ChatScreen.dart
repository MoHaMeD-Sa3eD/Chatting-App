import 'package:chat_app/Models/messagesCollectionModel.dart';
import 'package:chat_app/constants/appConstants.dart';
import 'package:chat_app/screens/LoginScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import '../CustomWidgets/CustomWidgets/chatContainer.dart';

class ChatScreen extends StatefulWidget {
  static String iD = 'ChatScreen';

  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  TextEditingController textFieldController = TextEditingController();

  ScrollController listViewController = ScrollController();

  var data;

  @override
  Widget build(BuildContext context) {
    String email = ModalRoute
        .of(context)!
        .settings
        .arguments as String;
    CollectionReference messages =
    FirebaseFirestore.instance.collection(kMessagesCollection);
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kMessageTime, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MessagesCollectionModel> messagesList = [];
          for (var i = 0; i < snapshot.data!.docs.length; i++) {
            MessagesCollectionModel messagesCollectionModel =
            MessagesCollectionModel.fromFireStore(snapshot.data!.docs[i]);
            messagesList.add(messagesCollectionModel);
          }
          return Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  Image.asset(
                    kAppImage,
                    width: 50,
                    height: 50,
                  ),
                  const Text(
                    'Chat',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, LoginScreen.iD);
                },
                icon: const Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                ),
              ),
              backgroundColor: kPrimaryColor,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: listViewController,
                    reverse: true,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return messagesList[index].id == email
                          ? UserChatContainer(
                        messagesCollectionModel: messagesList[index],
                      )
                          : FriendChatContainer(
                          messagesCollectionModel: messagesList[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: textFieldController,
                    onSubmitted: (data) {
                      messages.add({
                        kMessageField: data,
                        kMessageTime: DateTime.now().toString(),
                        kMessageID: email,
                      });
                      textFieldController.clear();
                      listViewController.animateTo(
                        listViewController.position.minScrollExtent,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOut,
                      );
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: kPrimaryColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: kPrimaryColor),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            messages.add({
                              kMessageField: data,
                              kMessageTime: DateTime.now().toString(),
                              kMessageID: email,
                            });
                                },
                          icon: const Icon(
                            Icons.send,
                            color: kPrimaryColor,
                          ),
                        ),
                        hintText: 'Send message'),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

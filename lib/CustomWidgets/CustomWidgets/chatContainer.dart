import 'package:chat_app/Models/messagesCollectionModel.dart';
import 'package:flutter/material.dart';
import '../../constants/appConstants.dart';

class UserChatContainer extends StatelessWidget {
  final MessagesCollectionModel messagesCollectionModel;

  const UserChatContainer({super.key, required this.messagesCollectionModel});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.55,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
            decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16))),
            child: Text(
              messagesCollectionModel.message,
              style: const TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          Text(
            '${messagesCollectionModel.date.hour}:${messagesCollectionModel.date.minute}',
            style: const TextStyle(color: kPrimaryColor),
          )
        ],
      ),
    );
  }
}

class FriendChatContainer extends StatelessWidget {
  final MessagesCollectionModel messagesCollectionModel;

  const FriendChatContainer({super.key, required this.messagesCollectionModel});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '${messagesCollectionModel.date.hour}:${messagesCollectionModel.date.minute}',
            style: const TextStyle(color: kSecondaryColor),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.55,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
            decoration: const BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16))),
            child: Text(
              messagesCollectionModel.message,
              style: const TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

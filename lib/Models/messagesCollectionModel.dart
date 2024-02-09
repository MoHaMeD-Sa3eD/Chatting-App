
import '../constants/appConstants.dart';

class MessagesCollectionModel {
  final String message;
  final DateTime date;

  final String id;

  MessagesCollectionModel(
      {required this.message, required this.date, required this.id});

  factory MessagesCollectionModel.fromFireStore(jsonData) {
    return MessagesCollectionModel(
      message: jsonData[kMessageField],
      date: DateTime.parse(jsonData[kMessageTime]),
      id: jsonData[kMessageID],
    );
  }
}

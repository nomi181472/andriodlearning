import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './../constants.dart';

class ChatScreen extends StatefulWidget {
  static String Id = "/ChatScreen";
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _messageTextController = TextEditingController();
  late User loggedUser;
  late String message;
  late DateTime dateTime;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getMessages() async {
    var messages =
        _firestore.collection("messages").get().then((value) => print(value));
  }

  void messageStream() async {
    await for (var snapshot in _firestore.collection("messages").snapshots()) {
      for (var message in snapshot.docs) print(message.data());
    }
  }

  void getCurrentUser() async {
    try {
      final currentUser = await _auth.currentUser;
      if (currentUser != null) {
        loggedUser = currentUser;
        print(loggedUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () async {
                await _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: _firestore.collection("messages").snapshots(),
                builder: (context, snapshots) {
                  if (snapshots.hasData) {
                    final documents = snapshots.data!.docs.reversed;
                    List<MessageBubble> textWidgets = [];

                    documents.forEach((data) {
                      var element = data.data();

                      final messageText = element['text'];
                      final messageSender = element['senderEmail'];
                      late final String curDate;
                      if (element["time"] != null) {
                        curDate = element["time"];
                      } else {
                        curDate = DateTime.now().toString();
                      }
                      print("yes ${DateTime.parse(curDate)}");
                      final textWidget = MessageBubble(
                        dateTime: DateTime.parse(curDate),
                        messageSender: messageSender,
                        messageText: messageText,
                        isCurrentUser:
                            loggedUser.email == messageSender ? true : false,
                      );

                      textWidgets.add(textWidget);
                    });

                    textWidgets
                        .sort((a, b) => a.dateTime.compareTo(b.dateTime));
                    return Expanded(
                      child: ListView(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        children: textWidgets,
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.lightBlueAccent,
                      ),
                    );
                  }
                }),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _messageTextController,
                      onChanged: (value) {
                        message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      _messageTextController.clear();
                      _firestore
                          .collection("messages")
                          .add({
                            "text": message,
                            "senderEmail": loggedUser.email,
                            "time": DateTime.now().toString()
                          })
                          .then((value) => print("Message Added"))
                          .catchError((error) =>
                              print("Failed to add Message: $error"));
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble(
      {required this.messageText,
      required this.messageSender,
      required this.isCurrentUser,
      required this.dateTime});
  late final String messageSender;
  late final String messageText;
  late final bool isCurrentUser;
  late final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment:
            isCurrentUser ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Text(
            messageSender,
            style: TextStyle(color: Colors.black54, fontSize: 12),
          ),
          Material(
              elevation: 5,
              borderRadius: isCurrentUser
                  ? BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    )
                  : BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
              color: isCurrentUser ? Colors.white : Colors.lightBlueAccent,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  '$messageText',
                  style: TextStyle(fontSize: 15),
                ),
              )),
        ],
      ),
    );
  }
}

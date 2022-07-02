import 'package:flutter/material.dart';

import '../items/message.dart';
import '../items/user.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key, required this.user}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
  final User user;
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.4,
        backgroundColor: Color.fromARGB(255, 251, 165, 36),
        title: Row(
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
              margin: EdgeInsets.fromLTRB(0, 5, 20, 0),
              child: Center(
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Color.fromARGB(255, 255, 94, 7),
                  child: Text(
                    'CS',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Chickenise CS',
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  'Live Chat',
                  style: TextStyle(
                    color: Colors.green[500],
                    fontSize: 12,
                  ),
                )
              ],
            )
          ],
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: ClipRRect(
                  // borderRadius: BorderRadius.only(
                  //   topLeft: Radius.circular(30),
                  //   topRight: Radius.circular(30),
                  // ),
                  child: Conversation(user: widget.user),
                ),
              ),
            ),
            buildChatComposer()
          ],
        ),
      ),
    );
  }
}

class Conversation extends StatelessWidget {
  const Conversation({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        reverse: true,
        itemCount: messages.length,
        itemBuilder: (context, int index) {
          final message = messages[index];
          bool isMe = message.sender.id == currentUser.id;
          return Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment:
                      isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (!isMe)
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Color.fromARGB(255, 255, 94, 7),
                        child: Text(
                          'CS',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.6),
                      decoration: BoxDecoration(
                          color: isMe
                              ? Colors.orangeAccent[100]
                              : Colors.grey[200],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                            bottomLeft: Radius.circular(isMe ? 12 : 0),
                            bottomRight: Radius.circular(isMe ? 0 : 12),
                          )),
                      child: Text(
                        messages[index].text,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment:
                        isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                    children: [
                      if (isMe)
                        SizedBox(
                          width: 40,
                        ),
                      if (isMe && message.isRead)
                        Icon(
                          Icons.done_all,
                          size: 20,
                          color: Colors.green,
                        ),
                      if (isMe && message.isRead == false)
                        Icon(
                          Icons.done_all,
                          size: 20,
                          color: Colors.grey,
                        ),
                      if (!isMe)
                        Icon(
                          Icons.verified,
                          size: 20,
                          color: Colors.green,
                        ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        message.time,
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}

Container buildChatComposer() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    color: Colors.white,
    height: 100,
    child: Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 14),
            height: 60,
            decoration: BoxDecoration(
              color: Colors.orange[100],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.emoji_emotions_outlined,
                  color: Colors.grey[500],
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type your message ...',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                    ),
                  ),
                ),
                Icon(
                  Icons.attach_file,
                  color: Colors.grey[500],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: 16,
        ),
        CircleAvatar(
          backgroundColor: Colors.orange[300],
          child: Icon(
            Icons.send,
            color: Colors.white,
          ),
        )
      ],
    ),
  );
}

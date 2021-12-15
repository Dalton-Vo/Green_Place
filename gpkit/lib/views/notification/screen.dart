import 'package:flutter/material.dart';
import 'package:localization_release/models/notification.dart';

class Notification extends StatefulWidget {
  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notification'),
        ),
        body: Center(
          child: ListView.separated(
              itemBuilder: (context, index) {
                final items = chatsData;
                return Dismissible(
                  onDismissed: (direction) {
                    // Remove the item from the data source.
                    setState(() {
                      chatsData.removeAt(index);
                    });

                    // Then show a snackbar.
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("$items dismissed")));
                  },
                  key: UniqueKey(),
                  background: Container(
                    color: Colors.blue,
                  ),
                  child: ChatCard(
                    chat: chatsData[index],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: chatsData.length),
        ));
  }
}

class ChatCard extends StatelessWidget {
  const ChatCard({Key key, this.chat}) : super(key: key);
  final Chat chat;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(chat.image),
          radius: 30,
        ),
        Container(
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chat.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(chat.lastMessage),
              ],
            ),
          ),
        )
      ],
    );
  }
}

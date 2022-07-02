import 'user.dart';

class Message {
  final User sender;
  final String avatar;
  final String time;
  final String text;
  final bool isRead;

  Message({
    required this.sender,
    required this.time,
    this.avatar = '',
    this.text = '',
    this.isRead = false,
  });
}

final List<Message> messages = [
  Message(
    sender: currentUser,
    time: '12:09 PM',
    isRead: false,
    text: "Sama-sama",
  ),
  Message(
    sender: customerService,
    time: '12:05 AM',
    text: "Terima kasih kak.",
  ),
  Message(
    sender: currentUser,
    time: '12:05 PM',
    isRead: true,
    text: "Oke, tidak masalah.",
  ),
  Message(
    sender: customerService,
    time: '11:51 PM',
    text: "Mohon maaf atas ketidaknyamanannya.",
  ),
  Message(
    sender: customerService,
    time: '11:50 PM',
    text: "Baik kak.",
  ),
  Message(
    sender: currentUser,
    time: '11:45 PM',
    isRead: true,
    text: "Selamat siang kak. Boleh kok kak.",
  ),
  Message(
    sender: customerService,
    time: '11:30 PM',
    text:
        "Selamat siang kak, untuk kentang crinklenya lagi kosong. Boleh diganti dengan kentang ring kak ?",
  ),
  Message(
    sender: customerService,
    time: '11:26 PM',
    text: "Halo",
  ),
];

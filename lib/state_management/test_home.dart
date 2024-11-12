import 'package:flutter/material.dart';
import '../features/home_screen/voicechatroom/presentation/pages/voide_chat_room_screen.dart';

class HomeScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Voice Chat Rooms')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VoiceChatRoomScreen(),
              ),
            );
          },
          child: const Text('Join Voice Chat Room'),
        ),
      ),
    );
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class ChatRoomPage extends StatefulWidget {
  const ChatRoomPage({Key? key}) : super(key: key);

  @override
  State<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  User? get currentUser => FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();

    if (currentUser == null) {}
  }

  void signin() {
    final providers = [
      EmailProviderConfiguration(),
      EmailLinkProviderConfiguration(
        actionCodeSettings: ActionCodeSettings(
          url: '',
        ),
      ),
      GoogleProviderConfiguration(
        clientId: '',
      ),
      PhoneProviderConfiguration(),
      AppleProviderConfiguration(),
    ];

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return SignInScreen(
            providerConfigs: providers,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Room"),
      ),
      body: Builder(
        builder: (context) {
          if (currentUser == null) {
            return Center(
              child: Column(
                children: [
                  Text('Not Login'),
                  TextButton(
                    onPressed: signin,
                    child: Text('Login'),
                  ),
                ],
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}

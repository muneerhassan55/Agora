import 'package:flutter/material.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:permission_handler/permission_handler.dart';

class VideoCall extends StatefulWidget {
  const VideoCall({super.key});

  @override
  State<VideoCall> createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  AgoraClient client = AgoraClient(
    enabledPermission: [
      Permission.camera,
      Permission.microphone,
    ],
    agoraConnectionData: AgoraConnectionData(
      appId:
          'ecf45d9610754bbc9b70f7398b042383', // Replace with your Agora appId
      channelName: 'test', // Replace with your channel name
      tempToken:
          '007eJxTYPiw0eGctEOz7AGmC6JPVD7zrl8b/bf/uLtLru+7DPcMSTEFhtTkNBPTFEszQwNzU5OkpGTLJHODNHNjS4skAxMjYwvjvxFc6Q2BjAyvfDazMjJAIIjPwlCSWlzCwAAAGjceqA==', // Replace with a valid token
    ),
  );

  @override
  void initState() {
    super.initState();
    initializeAgora();
  }

  Future<void> initializeAgora() async {
    // Request camera and microphone permissions at runtime
    await [Permission.camera, Permission.microphone].request();

    // Initialize Agora client
    try {
      await client.initialize();
    } catch (e) {
      print("Agora initialization failed: $e");
    }
  }

  @override
  void dispose() {
    client.sessionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AgoraVideoViewer(client: client),
            AgoraVideoButtons(client: client),
          ],
        ),
      ),
    );
  }
}

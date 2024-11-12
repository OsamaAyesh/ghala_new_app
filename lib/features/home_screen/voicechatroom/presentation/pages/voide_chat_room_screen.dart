import 'dart:async';
import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:permission_handler/permission_handler.dart';

// استبدل بالـ App ID، التوكن، واسم القناة الخاصة بك
const appId = "0aab847179754ba287b7cbb81b170bfa";
const token = "your-token-here";  // تأكد من تحديث التوكن
const channel = "ghalatest";

class VoiceChatRoomScreen extends StatefulWidget {
  @override
  _VoiceChatRoomScreenState createState() => _VoiceChatRoomScreenState();
}

class _VoiceChatRoomScreenState extends State<VoiceChatRoomScreen> {
  late RtcEngine _engine;
  bool _localUserJoined = false;
  int? _remoteUid;
  String _statusMessage = "Joining channel...";  // رسالة حالة المستخدم

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  // أولاً، طلب الأذونات الخاصة بالميكروفون
  Future<void> initAgora() async {
    await [Permission.microphone].request();

    // إنشاء المحرك وتهيئته
    _engine = await createAgoraRtcEngine();
    await _engine.initialize(RtcEngineContext(appId: appId));

    // تعيين معالج الأحداث
    _engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          setState(() {
            _localUserJoined = true;
            _statusMessage = "You have joined the channel.";
          });
          debugPrint("Local user ${connection.localUid} joined the channel");
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          setState(() {
            _remoteUid = remoteUid;
          });
          debugPrint("Remote user $remoteUid joined");
        },
        onUserOffline: (RtcConnection connection, int remoteUid, UserOfflineReasonType reason) {
          setState(() {
            _remoteUid = null;
          });
          debugPrint("Remote user $remoteUid left the channel");
        },
        onLeaveChannel: (RtcConnection connection, RtcStats stats) {
          setState(() {
            _localUserJoined = false;
            _remoteUid = null;
            _statusMessage = "You have left the channel.";
          });
        },
      ),
    );

    // الانضمام إلى القناة
    try {
      await _engine.joinChannel(
        token: token,
        channelId: channel,
        options: ChannelMediaOptions(
          autoSubscribeAudio: true,
          publishMicrophoneTrack: true,
          clientRoleType: ClientRoleType.clientRoleBroadcaster,
        ),
        uid: 0,
      );
    } catch (e) {
      setState(() {
        _statusMessage = "Failed to join channel: $e";
      });
      debugPrint("Failed to join channel: $e");
    }
  }

  // مغادرة القناة وتحرير الموارد عند الخروج من التطبيق
  Future<void> _dispose() async {
    await _engine.leaveChannel();
    await _engine.release();
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voice Chat Room'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_statusMessage), // عرض الرسالة المناسبة لحالة الانضمام
            if (_localUserJoined)
              Text("You have joined the channel as a host.")
            else
              Text("Joining channel..."),
            if (_remoteUid != null)
              Text("Remote user $_remoteUid is in the channel."),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // مغادرة القناة
                await _dispose();
                setState(() {
                  _localUserJoined = false;
                  _remoteUid = null;
                  _statusMessage = "You left the channel.";
                });
              },
              child: Text("Leave Channel"),
            ),
          ],
        ),
      ),
    );
  }
}

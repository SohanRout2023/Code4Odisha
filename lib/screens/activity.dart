import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marquee_text/marquee_text.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Status extends StatefulWidget {
  Status({super.key});
  // final WebSocketChannel channel = WebSocketChannel.connect(
  //     Uri.parse('ws://c4obackendtest.herokuapp.com/broadcast'));

  @override
  // State<Status> createState() => _StatusState(channel: channel);
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  // final WebSocketChannel channel;
  String? broadcast = 'Broadcasting Disabled';

  // _StatusState({required this.channel}) {
  //   channel.stream.listen((message) {
  //     setState(() {
  //       print(message);
  //       broadcast = message;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: MarqueeText(
              text: TextSpan(
                text: broadcast,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () async{
              // await channel.sink.close();
            },
            child: const Text(
              'Enable Broadcasting',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(),
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  spreadRadius: 5,
                  blurRadius: 9,
                  offset: Offset(10.0, 6.0),
                ),
              ],
            ),
            height: 380,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "TEAM STATUS",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                Image.asset('images/soft_dev.png'),
                const Text(
                  "\nYOU ARE IN",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                const Text(
                  "RED ZONE",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 66.6),
            alignment: Alignment.topRight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
                textStyle: const TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
              child: const Text('\t\t\t\t+24\n \tOTHERS'),
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('TEAM STATUS'),
                  content: const Text(
                      'TEAM 1\nTEAM 2\nTEAM 3\nTEAM 4\nTEAM 5\nTEAM 6\nTEAM 7\nTEAM 8\nTEAM 9\n'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(),
          ),
        ],
      ),
    );
  }
}

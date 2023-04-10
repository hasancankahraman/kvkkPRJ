// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hakkımızda'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Bu projeyi yapanlar:',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              GestureDetector(
                onTap: () async {
                  const url = 'https://www.linkedin.com/in/hasancankahraman/';
                  if (await canLaunch(url)) {
                    await launch(url);
                  }
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          'https://cdn.discordapp.com/attachments/1094766824341643326/1094766966755033169/developer3.jpeg'),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Hasancan Kahraman',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '212016715',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  const url = 'https://www.linkedin.com/in/cakirogluyagiz/';
                  if (await canLaunch(url)) {
                    await launch(url);
                  }
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          'https://cdn.discordapp.com/attachments/1094766824341643326/1094766967317070004/developer.jpeg'),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Yağız Can Çakıroğlu',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '212016709',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  const url = 'https://www.linkedin.com/in/cahitsaral/';
                  if (await canLaunch(url)) {
                    await launch(url);
                  }
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          'https://cdn.discordapp.com/attachments/1094766824341643326/1094766967098978355/developer1.jpeg'),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Cahit Saral',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '212016723',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
                'Kişisel Verileri Koruma Kurumu (kısaca KVKK), Türkiye\'de kişisel verilerin korunmasını sağlamak ve gözetmek için kurulmuş olan düzenleyici ve denetleyici bir kurumdur.'),
          ),
        ],
      ),
    );
  }
}

import 'package:empety/katalog.dart';
import 'package:empety/profil.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              const Text(
                'Halo Guys',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline,
                  backgroundColor: Colors.red,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Selamat datang di Flutter!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  decoration: TextDecoration.none,
                  color: Colors.blue,
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.phone_bluetooth_speaker_sharp,
                    size: 50,
                    color: Colors.blue,
                  ),
                  Text(
                    'Hubungi Kami',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: 100,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Terima kasih telah menggunakan aplikasi kami!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
              ),
              // SizedBox(height: 20),
              // Image.network(
              //   'https://picsum.photos/300/200',
              //   height: 200,
              //   width: 300,
              //   fit: BoxFit.cover,
              // ),
              // Container(
              //   padding: const EdgeInsets.all(20.0),
              //     color: Colors.green,
              //     child: Image.asset(
              //       'aseets/images/upgris.png',
              //       height: 200,
              //       width: 300,
              //     ),
              //   ),

              Container(
                margin: const EdgeInsets.all(30.0),
                color: Colors.green,
                child: Image.asset(
                  'assets/images/upgris.png',
                  height: 50,
                  width: 50,
                ),
              ),
              Builder(
                builder: (context) {
                  return ElevatedButton(onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Profil()),
                    );
                  }, child: Text('Klik Saya'));
                }
              ),
              SizedBox(height: 10),
               Builder(
                builder: (context) {
                  return ElevatedButton(onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Katalog()),
                    );
                  }, child: Text('Katalog'));
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}

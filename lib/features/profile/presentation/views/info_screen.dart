import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFFFFF), Color(0xFFEAE9E9)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: SafeArea(
          top: false,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.black,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'My info',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: CircleAvatar(
                      radius: 64,
                      backgroundColor: Color(0xFF6495ED),
                      child: Icon(Icons.person, size: 90, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Center(
                    child: Text.rich(
                      TextSpan(
                        text: 'You can update your ',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'email',
                            style: TextStyle(color: Color(0xFF1999F9), fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: ' or '),
                          TextSpan(
                            text: 'password',
                            style: TextStyle(color: Color(0xFF1999F9), fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: ' whenever you like!'),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text('Email:', style: TextStyle(fontSize: 18, color: Color(0xFF1999F9), fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Johndoe@gmail.com',
                      hintStyle: const TextStyle(color: Colors.black),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: const BorderSide(color: Color(0xFF1999F9), width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: const BorderSide(color: Color(0xFF1999F9), width: 2),
                      ),
                      suffixIcon: Icon(Icons.edit, color: Color(0xFF1999F9)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: SizedBox(
                      width: 180,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF3996F7),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                          elevation: 2,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text('Verify', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text('Password:', style: TextStyle(fontSize: 18, color: Color(0xFF1999F9), fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: '***********************',
                      hintStyle: const TextStyle(color: Colors.black),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: const BorderSide(color: Color(0xFF1999F9), width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: const BorderSide(color: Color(0xFF1999F9), width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: SizedBox(
                      width: 260,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF3996F7),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                          elevation: 2,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: const Text('Change Password', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

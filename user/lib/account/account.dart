import 'package:flutter/material.dart';
import '../../welcome/welcome.dart';
import 'editaccount.dart'; // Import the EditProfile screen

class AccountScreen extends StatelessWidget {
  final String userNickname = 'Mico';
  final String userName = '21e8dfd2-3207-4cbd-bbb0-e36f81b589aa';
  final String userEmail = 'erlemico@yahoo.com';
  final String userPhone = '086950927591';
  final String userAddress = 'Jl. Rambutan No. 17, Jakarta';
  final String userPhotoURL = 'assets/images/abe.jpg'; // Example photo URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background putih untuk Scaffold
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(userPhotoURL), // Gunakan URL gambar profil di sini
                backgroundColor: Colors.transparent,
              ),
              SizedBox(height: 12),
              Text(
                userNickname,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildUserDetail('ID', userName),
                    _buildUserDetail('Email', userEmail),
                    _buildUserDetail('No. Telepon', userPhone),
                    _buildUserDetail('Alamat', userAddress),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: SizedBox(
                      width: 200, // Set the width of the button
                      child: ElevatedButton(
                        onPressed: () {
                          // Aksi edit
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfile(
                                userNickname: userNickname,
                                userName: userName,
                                userEmail: userEmail,
                                userPhone: userPhone,
                                userAddress: userAddress,
                                userPhotoURL: userPhotoURL, // Kirim URL gambar profil
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFE00E0F), // Warna tombol Edit
                          padding: EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(color: Color(0xFFE00E0F)),
                          ),
                        ),
                        child: Text(
                          'Edit', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Center(
                    child: SizedBox(
                      width: 200, // Set the width of the button
                      child: ElevatedButton(
                        onPressed: () {
                          // Aksi sign out
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Welcome()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFE00E0F), // Warna tombol Sign Out
                          padding: EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(color: Color(0xFFE00E0F)),
                          ),
                        ),
                        child: Text('Keluar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(value, style: TextStyle(fontSize: 16), textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
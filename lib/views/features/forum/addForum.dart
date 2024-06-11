import 'package:flutter/material.dart';
import 'package:flutter_application_bullysafe/models/forum.dart';
import 'package:flutter_application_bullysafe/viewmodels/forum.dart';
import 'package:flutter_application_bullysafe/views/features/forum/addForum.dart';

class AddForumScreen extends StatefulWidget {
  @override
  _AddForumScreenState createState() => _AddForumScreenState();
}

class _AddForumScreenState extends State<AddForumScreen> {
  final AddForumViewModel _viewModel = AddForumViewModel();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF6F6F6),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: AppBar(
            title: const Text(
              "Forum",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
                fontSize: 20,
              ),
            ),
            centerTitle: true,
            backgroundColor: const Color(0xFFF6F6F6),
            elevation: 0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 16),
              TextField(
                controller: _contentController,
                decoration: InputDecoration(
                  hintText: 'Ketik Disini...',
                  hintStyle: const TextStyle(
                    fontFamily: 'Poppins',
                  ),
                  filled: true,
                  fillColor: Color(0xFFEFEFEF),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                maxLines: 20,
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () async {
                  Forum forum = Forum(
                      username: '', id: '', content: _contentController.text);
                  await _viewModel.addForum(forum);
                  _contentController.clear();
                  _showSuccessDialog(
                      context); // Tampilkan dialog unggah berhasil
                },
                child: Container(
                  width: 122,
                  height: 47,
                  decoration: ShapeDecoration(
                    color: Color(0xFF4EACF0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: Center(
                    child: const Text(
                      'Unggah',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk menampilkan dialog unggah berhasil
  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Unggah Berhasil"),
          content: Text("Forum Anda berhasil diunggah."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Tutup dialog
                Navigator.pop(
                    context); // Kembali ke halaman sebelumnya (ForumScreen)
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}

import 'package:demo_firebase_app/ui/auth/login_screen.dart';
import 'package:demo_firebase_app/ui/posts/add_post.dart';
import 'package:demo_firebase_app/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Screen'),
        actions: [
          IconButton(
              onPressed: () {
                // auth.signOut().then((value) => {
                //   Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()))
                // })
                auth.signOut().then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                }).onError((error, stackTrace) {
                  Utils().toastMessage(error.toString());
                });
              },
              icon: Icon(
                Icons.logout_outlined,
                color: Colors.white,
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
           MaterialPageRoute(builder: (context) => AddPostScreen()));
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';


class CommentWidget extends StatelessWidget {
  final int? postid;
  final int? id;
  final String? name;
  final String? email;
  final String? body;

  const CommentWidget({
    Key? key,
     this.id,
     this.name,
     this.email,
     this.body, this.postid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   'Post ID: $postid',
            //   style: const TextStyle(fontWeight: FontWeight.bold),
            // ),
            // Text(
            //   'Post ID: $id',
            //   style: const TextStyle(fontWeight: FontWeight.bold),
            // ),
            const SizedBox(height: 8),
            Text(
              'Name: $name',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              'Email: $email',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              body!,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

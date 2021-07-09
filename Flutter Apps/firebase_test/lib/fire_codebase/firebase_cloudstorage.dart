import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:uuid/uuid.dart';
import 'dart:io';

class CommitStorage {
  final String username;
  CommitStorage(this.username);

  Future<String> addImage({required String filePath}) async {
    /* convert the string-absolute-path to file
    so it can be processed/uploaded to firebase */
    File imageFile = File(filePath);

    // MAKE SURE EVERY FILE HAS A UNIQUE NAME

    try {
      // generate time-based unique file name per task
      var uuid = Uuid();

      /* making a db instance in the func is different
      than how I did it w/ firestore but it should be fine */
      var task = await firebase_storage.FirebaseStorage.instance
          .ref("users/" + username + "/userPosts/" + uuid.v1())
          .putFile(imageFile);

      return task.ref.getDownloadURL();
    } catch (e) {
      return e.toString();
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_test/fire_codebase/firebase_cloudstorage.dart';

class RetrieveUser {
  //
  final username;
  RetrieveUser(this.username);

  final CollectionReference usersReference =
      FirebaseFirestore.instance.collection('users');

  Future<DocumentSnapshot?> userInfo() async {
    /*  accesses the document at username
    in the given collection (most likely "users")  */
    DocumentSnapshot? userProfile = await usersReference.doc(username).get();

    return userProfile;
  }

  Future<List> userPosts() async {
    List userPostsData = [];
    /* accesses the document at username and 
    retrieves data in the "userPosts" collection which 
    contains documents representing post metadata */
    QuerySnapshot? userPosts =
        await usersReference.doc(username).collection("userPosts").get();

    /* returns image url for each item given by the 
    QuerySnapshot from ^ */
    for (var index = 0; index < userPosts.docs.length; index++) {
      // returns path of the db reference inside "postReference"
      String postPath = userPosts.docs[index].get("postReference").path;

      // gets document of the path from ^
      DocumentSnapshot postData =
          await FirebaseFirestore.instance.doc(postPath).get();

      // retrieves data (postUrl/link) of DocumentSnapshot and appends it to list
      userPostsData.add({
        "data": postData.data(),
        "path": postPath,
        "id": userPosts.docs[index].id
      });
    }

    return userPostsData;
  }
}

class CommitUser {
  final username;
  CommitUser(this.username);

  final CollectionReference usersReference =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference postsReference =
      FirebaseFirestore.instance.collection('posts');

  Future<bool> addPost({required String filePath}) async {
    final CommitStorage addStorage = CommitStorage(username);

    // will return false if an exception occured
    try {
      /* adds image to firebase cloud storage and returns
      the cdn url (firebase hosted url that contains the image file) */
      String imageUrl = await addStorage.addImage(filePath: filePath);

      /* adds post to the "postsReference" collection 
      and returns the path */
      DocumentReference firebasePath = await postsReference
          .add({"url": imageUrl, "likeCount": 0, "comments": []});

      /* adds firebase post path to the "userPosts" document in 
      the "usersReference" collection */
      usersReference
          .doc(username)
          .collection("userPosts")
          .add({"postReference": firebasePath});
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<bool> deletePost(
      {required String referenceId, required String imageUrl}) async {
    CommitStorage addUser = CommitStorage(username);

    DocumentReference referenceDoc =
        usersReference.doc(username).collection("userPosts").doc(referenceId);

    DocumentSnapshot snap = await referenceDoc.get();

    // gets reference to
    var postReferencePath = snap.get("postReference");

    try {
      // deletes the actual file in firebase cloud storage
      addUser.deleteImage(imageUrl: imageUrl);

      // deletes document referencing the cloud storage object
      await FirebaseFirestore.instance.doc(postReferencePath.path).delete();
      await referenceDoc.delete();

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}

class RetrieveReference {
  static Future<List?> postComments(postPath) async {
    /* gets document of the path passed in as a
    function arg */
    DocumentSnapshot userPost =
        await FirebaseFirestore.instance.doc(postPath).get();

    // gets the "comments" field in the ref from ^
    List? postComments = userPost.get("comments");

    return postComments;
  }
}

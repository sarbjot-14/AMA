import 'package:ama/models/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  String uid;
  DatabaseService({this.uid});

  final CollectionReference postingsCollection =
      Firestore.instance.collection('postings');

  Future<void> createPost(Post post) async {
    print("database createdand posting now");
    return await postingsCollection.document(post.title).setData({
      'title': post.title,
      'content': post.content,
      'postUid': '${post.posterId}_${post.title}',
      'posterName': post.postUid,
      'posterId': post.posterId,
    });
  }

  // get posts stream
  Stream<List<Post>> get getPosts {
    return postingsCollection.snapshots().map((aSnapshot) {
      return snapshotToList(aSnapshot);
    });
  }

  //helper funciton: post list from querysnapshot

  List<Post> snapshotToList(QuerySnapshot snaps) {
    return snaps.documents.map((aSnap) {
      return Post(
          posterId: aSnap.data['posterId'] ?? '',
          content: aSnap.data['content'] ?? '',
          title: aSnap.data['title'] ?? '',
          postUid: aSnap.data['postUid'] ?? '');
    }).toList();
  }
}

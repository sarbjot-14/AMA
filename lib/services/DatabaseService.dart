import 'package:ama/models/Comment.dart';
import 'package:ama/models/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  String title;
  DatabaseService({this.title});

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
    return postingsCollection.snapshots() == null
        ? []
        : postingsCollection.snapshots().map((aSnapshot) {
            return snapshotToList(aSnapshot);
          });
  }

  //helper funciton: post list from querysnapshot

  List<Post> snapshotToList(QuerySnapshot snaps) {
    return snaps.documents.map((aSnap) {
      //parseComments(aSnap.data);

      return Post(
          posterId: aSnap.data['posterId'] ?? '',
          content: aSnap.data['content'] ?? '',
          title: aSnap.data['title'] ?? '',
          postUid: aSnap.data['postUid'] ?? '',
          comments: parseComments(aSnap.data) ?? []);
    }).toList();
  }

  List<Comment> parseComments(data) {
    Comment comm;
    if (data['comments'] == null) {
      return null;
    }
    var listComments = data['comments'] as List;
    //listComments = listComments.map((item) => Comment.fromJson(item)).toList();
//    List<Comment> finalList = listComments.map<Comment>((item) {
//      return item;
//    }).toList();
    List<Comment> finalList = listComments.map((obj) {
      return (Comment(content: obj['content'], commentor: obj['commentor']));
    }).toList();
    return finalList;
  }

  Future<void> addComment(Post post) async {
    print("database adding comment now");
    Comment comment;
    List<Map<String, dynamic>> commentsMap = post.comments == null
        ? []
        : post.comments
            .map((item) =>
                {'content': item.content, 'commentor': item.commentor})
            .toList();
    return await postingsCollection.document(post.title).setData({
      'title': post.title,
      'content': post.content,
      'postUid': '${post.posterId}_${post.title}',
      'posterName': post.postUid,
      'posterId': post.posterId,
      'comments': commentsMap
    });
  }
}

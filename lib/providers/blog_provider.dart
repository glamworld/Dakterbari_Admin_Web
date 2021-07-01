import 'dart:io';
import 'package:admin_panel_web/model/article_comment_model.dart';
import 'package:admin_panel_web/providers/public_provider.dart';
import 'package:admin_panel_web/widgets/form_decorate.dart';
import 'package:flutter/material.dart';
import'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:admin_panel_web/model/article_model.dart';
import 'package:intl/intl.dart';
class BlogProvider extends ChangeNotifier{

  ArticleModel _articleModel = ArticleModel();

  List<ArticleModel> _allArticleList=[];
  List<ArticleModel> _newsArticleList=[];
  List<ArticleModel> _diseasesArticleList=[];
  List<ArticleModel> _healthArticleList=[];
  List<ArticleModel> _foodArticleList=[];
  List<ArticleModel> _medicineArticleList=[];
  List<ArticleModel> _medicareArticleList=[];
  List<ArticleModel> _tourismArticleList=[];
  List<ArticleModel> _symptomsArticleList=[];
  List<ArticleModel> _visualArticleList=[];
  List<ArticleModel> _pendingArticleList=[];
  List<ArticleModel> _popularArticleList=[];
  List<ArticleModel> _myArticleList=[];
  List<ArticleCommentModel> _articleCommentList=[];

  ArticleModel get articleModel=> _articleModel;
  get pendingArticleList => _pendingArticleList;
  get allArticleList => _allArticleList;
  get newsArticleList => _newsArticleList;
  get diseasesArticleList => _diseasesArticleList;
  get healthArticleList => _healthArticleList;
  get foodArticleList => _foodArticleList;
  get medicineArticleList => _medicineArticleList;
  get medicareArticleList => _medicareArticleList;
  get tourismArticleList => _tourismArticleList;
  get symptomsArticleList => _symptomsArticleList;
  get visualArticleList => _visualArticleList;
  get popularArticleList => _popularArticleList;
  get myArticleList => _myArticleList;
  get articleCommentList => _articleCommentList;


  set articleModel(ArticleModel model){
    model = ArticleModel();
    _articleModel = model;
    notifyListeners();
  }

  void clearAllArticleList(){
    _allArticleList.clear();
    _newsArticleList.clear();
    _diseasesArticleList.clear();
    _healthArticleList.clear();
    _foodArticleList.clear();
    _medicineArticleList.clear();
    _medicareArticleList.clear();
    _tourismArticleList.clear();
    _symptomsArticleList.clear();
    _visualArticleList.clear();
    _myArticleList.clear();
    _popularArticleList.clear();
    notifyListeners();
  }


  Future<void> submitArticle(BlogProvider provider,var articleImage,String id)async{
    final String articleId= id+DateTime.now().millisecondsSinceEpoch.toString();
    final String date= DateFormat("dd-MMM-yyyy").format(DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch));
    firebase_storage.Reference storageReference =
    firebase_storage.FirebaseStorage.instance.ref().child('Article Photo').child(articleId);

    firebase_storage.UploadTask storageUploadTask = storageReference.putBlob(articleImage);

    firebase_storage.TaskSnapshot taskSnapshot;
    storageUploadTask.then((value) {
      taskSnapshot = value;
      taskSnapshot.ref.getDownloadURL().then((newImageDownloadUrl){
        final photoUrl = newImageDownloadUrl;
        FirebaseFirestore.instance.collection('Articles').doc(articleId).set({
          'id':articleId,
          'photoUrl':photoUrl,
          'date':date,
          'timeStamp': DateTime.now().millisecondsSinceEpoch.toString(),
          'title':provider.articleModel.title,
          'author':'Admin',
          'like':null,
          'share':null,
          'category':provider.articleModel.category,
          'abstract':provider.articleModel.abstract,
          'introduction':provider.articleModel.introduction,
          'methods':provider.articleModel.methods,
          'results':provider.articleModel.results,
          'conclusion':provider.articleModel.conclusion,
          'acknowledgement':provider.articleModel.acknowledgement,
          'reference':provider.articleModel.reference,
          'doctorId':null,
          'authorPhoto':null,
          'state': 'approved',
        }).then((value)async{
          showToast('Article successfully submitted');
        });
      },onError: (error){
        showToast(error.toString());
      });
    },onError: (error){
      showToast(error.toString());
    });

  }

  Future<void> getAllArticle()async{
    try{
      await FirebaseFirestore.instance.collection('Articles').where('state',isEqualTo: 'approved').orderBy('timeStamp',descending: true).get().then((snapshot){
        _allArticleList.clear();
        _newsArticleList.clear();
        _diseasesArticleList.clear();
        _healthArticleList.clear();
        _foodArticleList.clear();
        _medicineArticleList.clear();
        _medicareArticleList.clear();
        _tourismArticleList.clear();
        _symptomsArticleList.clear();
        _visualArticleList.clear();
        _myArticleList.clear();

        snapshot.docChanges.forEach((element) {
          ArticleModel articleModel = ArticleModel(
            id: element.doc['id'],
            photoUrl: element.doc['photoUrl'],
            date: element.doc['date'],
            title: element.doc['title'],
            author: element.doc['author'],
            authorPhoto: element.doc['authorPhoto'],
            like: element.doc['like'],
            share: element.doc['share'],
            category: element.doc['category'],
            abstract: element.doc['abstract'],
            introduction: element.doc['introduction'],
            methods: element.doc['methods'],
            results: element.doc['results'],
            conclusion: element.doc['conclusion'],
            acknowledgement: element.doc['acknowledgement'],
            reference: element.doc['reference'],
            doctorId: element.doc['doctorId'],
          );
          _allArticleList.add(articleModel);
        });
        notifyListeners();
      }).then((value)async{
        for(int i=0; i<_allArticleList.length;i++){

          ///News Articles
          if(_allArticleList[i].category=='News'){
            ArticleModel articleModel = ArticleModel(
              id: _allArticleList[i].id,
              photoUrl: _allArticleList[i].photoUrl,
              date: _allArticleList[i].date,
              title: _allArticleList[i].title,
              author: _allArticleList[i].author,
              authorPhoto: _allArticleList[i].authorPhoto,
              like: _allArticleList[i].like,
              share: _allArticleList[i].share,
              category: _allArticleList[i].category,
              abstract: _allArticleList[i].abstract,
              introduction: _allArticleList[i].introduction,
              methods: _allArticleList[i].methods,
              results: _allArticleList[i].results,
              conclusion: _allArticleList[i].conclusion,
              acknowledgement: _allArticleList[i].acknowledgement,
              reference: _allArticleList[i].reference,
              doctorId: _allArticleList[i].doctorId,
            );
            _newsArticleList.add(articleModel);
          }

          ///Diseases
          if(_allArticleList[i].category=='Diseases & Cause'){
            ArticleModel articleModel = ArticleModel(
              id: _allArticleList[i].id,
              photoUrl: _allArticleList[i].photoUrl,
              date: _allArticleList[i].date,
              title: _allArticleList[i].title,
              author: _allArticleList[i].author,
              authorPhoto: _allArticleList[i].authorPhoto,
              like: _allArticleList[i].like,
              share: _allArticleList[i].share,
              category: _allArticleList[i].category,
              abstract: _allArticleList[i].abstract,
              introduction: _allArticleList[i].introduction,
              methods: _allArticleList[i].methods,
              results: _allArticleList[i].results,
              conclusion: _allArticleList[i].conclusion,
              acknowledgement: _allArticleList[i].acknowledgement,
              reference: _allArticleList[i].reference,
              doctorId: _allArticleList[i].doctorId,
            );
            _diseasesArticleList.add(articleModel);
          }

          ///Health
          if(_allArticleList[i].category=='Health Tips'){
            ArticleModel articleModel = ArticleModel(
              id: _allArticleList[i].id,
              photoUrl: _allArticleList[i].photoUrl,
              date: _allArticleList[i].date,
              title: _allArticleList[i].title,
              author: _allArticleList[i].author,
              authorPhoto: _allArticleList[i].authorPhoto,
              like: _allArticleList[i].like,
              share: _allArticleList[i].share,
              category: _allArticleList[i].category,
              abstract: _allArticleList[i].abstract,
              introduction: _allArticleList[i].introduction,
              methods: _allArticleList[i].methods,
              results: _allArticleList[i].results,
              conclusion: _allArticleList[i].conclusion,
              acknowledgement: _allArticleList[i].acknowledgement,
              reference: _allArticleList[i].reference,
              doctorId: _allArticleList[i].doctorId,
            );
            _healthArticleList.add(articleModel);
          }

          ///Food
          if(_allArticleList[i].category=='Food & Nutrition'){
            ArticleModel articleModel = ArticleModel(
              id: _allArticleList[i].id,
              photoUrl: _allArticleList[i].photoUrl,
              date: _allArticleList[i].date,
              title: _allArticleList[i].title,
              author: _allArticleList[i].author,
              authorPhoto: _allArticleList[i].authorPhoto,
              like: _allArticleList[i].like,
              share: _allArticleList[i].share,
              category: _allArticleList[i].category,
              abstract: _allArticleList[i].abstract,
              introduction: _allArticleList[i].introduction,
              methods: _allArticleList[i].methods,
              results: _allArticleList[i].results,
              conclusion: _allArticleList[i].conclusion,
              acknowledgement: _allArticleList[i].acknowledgement,
              reference: _allArticleList[i].reference,
              doctorId: _allArticleList[i].doctorId,
            );
            _foodArticleList.add(articleModel);
          }

          ///Medicine
          if(_allArticleList[i].category=='Medicine & Treatment'){
            ArticleModel articleModel = ArticleModel(
              id: _allArticleList[i].id,
              photoUrl: _allArticleList[i].photoUrl,
              date: _allArticleList[i].date,
              title: _allArticleList[i].title,
              author: _allArticleList[i].author,
              authorPhoto: _allArticleList[i].authorPhoto,
              like: _allArticleList[i].like,
              share: _allArticleList[i].share,
              category: _allArticleList[i].category,
              abstract: _allArticleList[i].abstract,
              introduction: _allArticleList[i].introduction,
              methods: _allArticleList[i].methods,
              results: _allArticleList[i].results,
              conclusion: _allArticleList[i].conclusion,
              acknowledgement: _allArticleList[i].acknowledgement,
              reference: _allArticleList[i].reference,
              doctorId: _allArticleList[i].doctorId,
            );
            _medicineArticleList.add(articleModel);
          }

          ///Medicare
          if(_allArticleList[i].category=='Medicare & Hospital'){
            ArticleModel articleModel = ArticleModel(
              id: _allArticleList[i].id,
              photoUrl: _allArticleList[i].photoUrl,
              date: _allArticleList[i].date,
              title: _allArticleList[i].title,
              author: _allArticleList[i].author,
              authorPhoto: _allArticleList[i].authorPhoto,
              like: _allArticleList[i].like,
              share: _allArticleList[i].share,
              category: _allArticleList[i].category,
              abstract: _allArticleList[i].abstract,
              introduction: _allArticleList[i].introduction,
              methods: _allArticleList[i].methods,
              results: _allArticleList[i].results,
              conclusion: _allArticleList[i].conclusion,
              acknowledgement: _allArticleList[i].acknowledgement,
              reference: _allArticleList[i].reference,
              doctorId: _allArticleList[i].doctorId,
            );
            _medicareArticleList.add(articleModel);
          }

          ///Tourism
          if(_allArticleList[i].category=='Tourism & Cost'){
            ArticleModel articleModel = ArticleModel(
              id: _allArticleList[i].id,
              photoUrl: _allArticleList[i].photoUrl,
              date: _allArticleList[i].date,
              title: _allArticleList[i].title,
              author: _allArticleList[i].author,
              authorPhoto: _allArticleList[i].authorPhoto,
              like: _allArticleList[i].like,
              share: _allArticleList[i].share,
              category: _allArticleList[i].category,
              abstract: _allArticleList[i].abstract,
              introduction: _allArticleList[i].introduction,
              methods: _allArticleList[i].methods,
              results: _allArticleList[i].results,
              conclusion: _allArticleList[i].conclusion,
              acknowledgement: _allArticleList[i].acknowledgement,
              reference: _allArticleList[i].reference,
              doctorId: _allArticleList[i].doctorId,
            );
            _tourismArticleList.add(articleModel);
          }

          ///Symptoms
          if(_allArticleList[i].category=='Symptoms'){
            ArticleModel articleModel = ArticleModel(
              id: _allArticleList[i].id,
              photoUrl: _allArticleList[i].photoUrl,
              date: _allArticleList[i].date,
              title: _allArticleList[i].title,
              author: _allArticleList[i].author,
              authorPhoto: _allArticleList[i].authorPhoto,
              like: _allArticleList[i].like,
              share: _allArticleList[i].share,
              category: _allArticleList[i].category,
              abstract: _allArticleList[i].abstract,
              introduction: _allArticleList[i].introduction,
              methods: _allArticleList[i].methods,
              results: _allArticleList[i].results,
              conclusion: _allArticleList[i].conclusion,
              acknowledgement: _allArticleList[i].acknowledgement,
              reference: _allArticleList[i].reference,
              doctorId: _allArticleList[i].doctorId,
            );
            _symptomsArticleList.add(articleModel);
          }

          ///Visual
          if(_allArticleList[i].category=='Visual Story'){
            ArticleModel articleModel = ArticleModel(
              id: _allArticleList[i].id,
              photoUrl: _allArticleList[i].photoUrl,
              date: _allArticleList[i].date,
              title: _allArticleList[i].title,
              author: _allArticleList[i].author,
              authorPhoto: _allArticleList[i].authorPhoto,
              like: _allArticleList[i].like,
              share: _allArticleList[i].share,
              category: _allArticleList[i].category,
              abstract: _allArticleList[i].abstract,
              introduction: _allArticleList[i].introduction,
              methods: _allArticleList[i].methods,
              results: _allArticleList[i].results,
              conclusion: _allArticleList[i].conclusion,
              acknowledgement: _allArticleList[i].acknowledgement,
              reference: _allArticleList[i].reference,
              doctorId: _allArticleList[i].doctorId,
            );
            _visualArticleList.add(articleModel);
          }
        }// end for loop
        notifyListeners();

      });
    }catch(error){}
  }

  Future<void> getPendingArticle() async{
    try{
      await FirebaseFirestore.instance.collection('Articles').where('state', isEqualTo: 'pending').get().then((snapshot){
        _pendingArticleList.clear();
        snapshot.docChanges.forEach((element) {
          ArticleModel articleModel = ArticleModel(
            id: element.doc['id'],
            photoUrl: element.doc['photoUrl'],
            date: element.doc['date'],
            title: element.doc['title'],
            author: element.doc['author'],
            authorPhoto: element.doc['authorPhoto'],
            like: element.doc['like'],
            state: element.doc['state'],
            share: element.doc['share'],
            category: element.doc['category'],
            abstract: element.doc['abstract'],
            introduction: element.doc['introduction'],
            methods: element.doc['methods'],
            results: element.doc['results'],
            conclusion: element.doc['conclusion'],
            acknowledgement: element.doc['acknowledgement'],
            reference: element.doc['reference'],
            doctorId: element.doc['doctorId'],
          );
          _pendingArticleList.add(articleModel);
          //print(pendingArticleList.length);
        });
      });
      notifyListeners();
    }catch(error){
      showToast(error.toString());
    }
  }

  Future<void> getPopularArticle() async{
    try{
      await FirebaseFirestore.instance.collection('Articles').orderBy('like',descending: true).get().then((snapshot){
        _popularArticleList.clear();
        snapshot.docChanges.forEach((element) {
          if(element.doc['state']=='approved'){
          ArticleModel articleModel = ArticleModel(
            id: element.doc['id'],
            photoUrl: element.doc['photoUrl'],
            date: element.doc['date'],
            title: element.doc['title'],
            author: element.doc['author'],
            authorPhoto: element.doc['authorPhoto'],
            like: element.doc['like'],
            share: element.doc['share'],
            category: element.doc['category'],
            abstract: element.doc['abstract'],
            introduction: element.doc['introduction'],
            methods: element.doc['methods'],
            results: element.doc['results'],
            conclusion: element.doc['conclusion'],
            acknowledgement: element.doc['acknowledgement'],
            reference: element.doc['reference'],
            doctorId: element.doc['doctorId'],
          );
          _popularArticleList.add(articleModel);
        }
        });
      });
      notifyListeners();
    }catch(error){}
  }

  Future<void> getArticleComments(String articleId) async{
    try{
      _articleCommentList.clear();
      await FirebaseFirestore.instance.collection('ArticleComments').where('articleId',isEqualTo: articleId).orderBy('timeStamp',descending: true).get().then((snapshot){
        snapshot.docChanges.forEach((element) {
          ArticleCommentModel articleCommentModel = ArticleCommentModel(
            id: element.doc['id'],
            articleId: element.doc['articleId'],
            commenterName: element.doc['commenterName'],
            commenterPhoto: element.doc['commenterPhoto'],
            commentDate: element.doc['commentDate'],
            comment: element.doc['comment'],
          );
          _articleCommentList.add(articleCommentModel);
        });
      });
      notifyListeners();
    }catch(error){}
  }


  Future<void> writeComment(String articleId, String commenterId, String commenterName,
  String commenterPhoto, String comment, BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) async{
    final int timeStamp = DateTime.now().millisecondsSinceEpoch;
    final String id = commenterId+timeStamp.toString();
    final String commentDate =  DateFormat("dd-MMM-yyyy").format(DateTime.fromMillisecondsSinceEpoch(timeStamp)).toString();
    await FirebaseFirestore.instance.collection('ArticleComments').doc(id).set({
      'id':id,
      'articleId':articleId,
      'commenterName':commenterName,
      'commenterPhoto':commenterPhoto,
      'comment': comment,
      'timeStamp': timeStamp.toString(),
      'commentDate': commentDate
    }).then((value){
      ArticleCommentModel articleCommentModel = ArticleCommentModel(
        id: id,
        articleId: articleId,
        commenterName: commenterName,
        commenterPhoto: commenterPhoto,
        commentDate: commentDate,
        comment: comment,
        timeStamp: timeStamp.toString()
      );
      _articleCommentList.add(articleCommentModel);
      notifyListeners();
      showToast('Commented on this article');
    },onError: (error){
      showToast('Something went wrong. Try again');
    });
  }

  Future<void> updatePendingArticle(String id)async
  {
    FirebaseFirestore.instance.collection('Articles').doc(id).update({
      'state': 'approved',

    }).then((value)async{
      showToast('Article approved');
      notifyListeners();
    });

  }

  Future<void> deleteBlog(String id,BuildContext context)async{
    WriteBatch batch = FirebaseFirestore.instance.batch();
    await FirebaseFirestore.instance.collection('Articles').doc(id).delete().then((value)async {
      await firebase_storage.FirebaseStorage.instance.ref().child(
          'Article Photo').child(id).delete().then((value) async {
        await FirebaseFirestore.instance.collection('ArticleComments').where(
            'articleId', isEqualTo: id).get().then((querySnapshots) async {
          //await snapshots.docChanges.first.doc.reference.delete();
          querySnapshots.docChanges.forEach((document) async {
            batch.delete(document.doc.reference);
            return await batch.commit();
          });
          showToast('Blog deleted');
        });
      });
    });

    }

  Future<void> updateBlog(PublicProvider provider, var imageFile)async{
    firebase_storage.Reference storageReference =
    firebase_storage.FirebaseStorage.instance.ref().child('Article Photo').child(provider.articleModel.id!);

    firebase_storage.UploadTask storageUploadTask = storageReference.putBlob(imageFile);

    firebase_storage.TaskSnapshot taskSnapshot;
    storageUploadTask.then((value) {
      taskSnapshot = value;
      taskSnapshot.ref.getDownloadURL().then((newImageDownloadUrl){
        final photoUrl = newImageDownloadUrl;
        FirebaseFirestore.instance.collection('Articles').doc(provider.articleModel.id).update({
          //'id':provider.articleModel.id,
          'photoUrl':photoUrl,
          //'date': provider.articleModel.date,
          'title':provider.articleModel.title,
          'author':provider.articleModel.author,
          //'authorPhoto':provider.articleModel.authorPhoto,
          //'like':provider.articleModel.like,
          //'share':provider.articleModel.share,
          'category':provider.articleModel.category,
          'abstract':provider.articleModel.abstract,
          //'state':provider.articleModel.state,
          'introduction':provider.articleModel.introduction,
          'methods':provider.articleModel.methods,
          'results':provider.articleModel.results,
          'conclusion':provider.articleModel.conclusion,
          'acknowledgement':provider.articleModel.acknowledgement,
          'reference':provider.articleModel.reference,
          //'doctorId':provider.articleModel.doctorId,
        });
          notifyListeners();
          showToast('Blog updated');
        }).then((value){
          getAllArticle();
        });
    },onError: (error){
      showToast(error.toString());
    });

  }
  Future<void> updateBlogDetails(PublicProvider provider)async {
    await FirebaseFirestore.instance.collection('Articles').doc(provider.articleModel.id).update({
      //'id':provider.articleModel.id,
      //'date': provider.articleModel.date,
      'title':provider.articleModel.title,
      'author':provider.articleModel.author,
      //'authorPhoto':provider.articleModel.authorPhoto,
      //'like':provider.articleModel.like,
      //'share':provider.articleModel.share,
      'category':provider.articleModel.category,
      'abstract':provider.articleModel.abstract,
      //'state':provider.articleModel.state,
      'introduction':provider.articleModel.introduction,
      'methods':provider.articleModel.methods,
      'results':provider.articleModel.results,
      'conclusion':provider.articleModel.conclusion,
      'acknowledgement':provider.articleModel.acknowledgement,
      'reference':provider.articleModel.reference,
      //'doctorId':provider.articleModel.doctorId,
    });
    notifyListeners();
    showToast('Blog updated');
    getAllArticle();
  }
}
import 'dart:io';
import 'package:admin_panel_web/widgets/form_decorate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:admin_panel_web/model/shop_model.dart';
import 'package:admin_panel_web/model/featured_product_model.dart';

class DiscountShopProvider extends ChangeNotifier{
  ShopModel _shopModel = ShopModel();
  FeaturedProductModel _featuredProductModel = FeaturedProductModel();
  List<ShopModel> _shopList= [];
  List<ShopModel> _shopIdList= [];
  List<ShopModel> _allShopList= [];
  List<FeaturedProductModel> _productList = [];

  ShopModel get shopModel => _shopModel;
  FeaturedProductModel get featuredProductModel => _featuredProductModel;
  get shopList=> _shopList;
  get shopIdList=> _shopIdList;
  get allShopList=> _allShopList;
  get productList => _productList;

  set shopModel(ShopModel model) {
    model = ShopModel();
    _shopModel = model;
    notifyListeners();
  }

  set featuredProductModel(FeaturedProductModel featuredModel) {
    featuredModel = FeaturedProductModel();
    _featuredProductModel = featuredModel;
    notifyListeners();
  }


  Future<bool> addDiscountShop(ShopModel shopModel,
      var imageFile) async {
    final id = shopModel.phoneNo! + DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    firebase_storage.Reference storageReference =
    firebase_storage.FirebaseStorage.instance.ref().child('Shop Photo').child(
        id);

    firebase_storage.UploadTask storageUploadTask = storageReference.putBlob(
        imageFile);

    firebase_storage.TaskSnapshot taskSnapshot;
    storageUploadTask.then((value) {
      taskSnapshot = value;
      taskSnapshot.ref.getDownloadURL().then((newImageDownloadUrl) {
        final photoUrl = newImageDownloadUrl;
        shopModel.shopImage = photoUrl;
        try {
          FirebaseFirestore.instance.collection('DiscountShop').doc(id).set({
            'id': id,
            'shopImage': shopModel.shopImage,
            'shopName': shopModel.shopName,
            'about': shopModel.about,
            'executiveName': shopModel.executiveName,
            'executivePhoneNo': shopModel.executivePhoneNo,
            'shopCategory': shopModel.shopCategory,
            'subCategory': shopModel.subCategory,
            'webAddress': shopModel.webAddress,
            'mailAddress': shopModel.mailAddress,
            'twitterLink': shopModel.twitterLink,
            'facebookLink': shopModel.facebookLink,
            'phoneNo': shopModel.phoneNo,
            'avgReviewStar': null,
            'linkedinLink': shopModel.linkedinLink,
            'discount': shopModel.discount,
            'amenities': FieldValue.arrayUnion(shopModel.amenities!),
            'Sat': !shopModel.sat![0] ? null : [
              '${shopModel.sat![1].hour}:${shopModel.sat![1].minute}',
              '${shopModel.sat![2].hour}:${shopModel.sat![2].minute}'
            ],
            'Sun': !shopModel.sun![0] ? null : [
              '${shopModel.sun![1].hour}:${shopModel.sun![1].minute}',
              '${shopModel.sun![2].hour}:${shopModel.sun![2].minute}'
            ],
            'Mon': !shopModel.mon![0] ? null : [
              '${shopModel.mon![1].hour}:${shopModel.mon![1].minute}',
              '${shopModel.mon![2].hour}:${shopModel.mon![2].minute}'
            ],
            'Tue': !shopModel.tue![0] ? null : [
              '${shopModel.tue![1].hour}:${shopModel.tue![1].minute}',
              '${shopModel.tue![2].hour}:${shopModel.tue![2].minute}'
            ],
            'Wed': !shopModel.wed![0] ? null : [
              '${shopModel.wed![1].hour}:${shopModel.wed![1].minute}',
              '${shopModel.wed![2].hour}:${shopModel.wed![2].minute}'
            ],
            'Thu': !shopModel.thu![0] ? null : [
              '${shopModel.thu![1].hour}:${shopModel.thu![1].minute}',
              '${shopModel.thu![2].hour}:${shopModel.thu![2].minute}'
            ],
            'Fri': !shopModel.fri![0] ? null : [
              '${shopModel.fri![1].hour}:${shopModel.fri![1].minute}',
              '${shopModel.fri![2].hour}:${shopModel.fri![2].minute}'
            ],
            'shopAddress': shopModel.shopAddress,
            'currency': shopModel.currency,
            'latitude': shopModel.latitude,
            'longitude': shopModel.longitude,

          }).then((value) {
            showToast('Discount shop added');
            getAllShop();
          });
          return true;
        } catch (e) {
          return false;
        }
      }, onError: (error) {
        showToast(error.toString());
      });
    }, onError: (error) {
      showToast(error.toString());
    }
    );
    return true;
  }

  Future<bool> addFeaturedProduct(DiscountShopProvider provider,FeaturedProductModel featuredModel,
      String shopId, var imageFile) async {
    String id = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    firebase_storage.Reference storageReference =
    firebase_storage.FirebaseStorage.instance.ref()
        .child('Featured Photo')
        .child(id);

    firebase_storage.UploadTask storageUploadTask = storageReference.putBlob(
        imageFile);

    firebase_storage.TaskSnapshot taskSnapshot;
    storageUploadTask.then((value) {
      taskSnapshot = value;
      taskSnapshot.ref.getDownloadURL().then((newImageDownloadUrl) {
        final productUrl = newImageDownloadUrl;
        featuredProductModel.imageUrl = productUrl;
        try {
          FirebaseFirestore.instance.collection('FeaturedProduct').doc(id).set({
            'id': id,
            'shopId': shopId,
            'imageUrl': featuredProductModel.imageUrl,
            'name': featuredModel.productName,
            'price': featuredModel.productPrice,
          }).then((value) async{
            await provider.getFeaturedProduct(shopId).then((value){
              showToast('Featured Product added');
            });

          });
          return true;
        } catch (e) {
          return false;
        }
      }, onError: (error) {
        showToast(error.toString());
      });
    }, onError: (error) {
      showToast(error.toString());
    }
    );
    return true;
  }

  Future<void> getAllShop()async{
    try{
      await FirebaseFirestore.instance.collection('DiscountShop').get().then((snapShot){
        _allShopList.clear();
        snapShot.docChanges.forEach((element) {
          ShopModel shops=ShopModel(
            id: element.doc['id'],
            shopImage: element.doc['shopImage'],
            shopName: element.doc['shopName'],
            about: element.doc['about'],
            executiveName: element.doc['executiveName'],
            executivePhoneNo: element.doc['executivePhoneNo'],
            shopCategory: element.doc['shopCategory'],
            subCategory: element.doc['subCategory'],
            webAddress: element.doc['webAddress'],
            mailAddress: element.doc['mailAddress'],
            twitterLink: element.doc['twitterLink'],
            facebookLink: element.doc['facebookLink'],
            phoneNo: element.doc['phoneNo'],
            discount: element.doc['discount'],
            linkedinLink: element.doc['linkedinLink'],
            amenities: element.doc['amenities'],
            sat: element.doc['Sat'],
            sun: element.doc['Sun'],
            mon: element.doc['Mon'],
            tue: element.doc['Tue'],
            wed: element.doc['Wed'],
            thu: element.doc['Thu'],
            fri: element.doc['Fri'],
            shopAddress: element.doc['shopAddress'],
            avgReviewStar:element.doc['avgReviewStar'],
            currency: element.doc['currency'],
            latitude: element.doc['latitude'],
            longitude: element.doc['longitude'],
          );
          _allShopList.add(shops);
          //print(element.doc['avgReviewStar']);
        });
      });
      notifyListeners();
    }catch(error){
      print(error.toString());
    }
  }

  Future<void> getShop(String subCategory)async{
    try{
      await FirebaseFirestore.instance.collection('DiscountShop').where('subCategory',isEqualTo: subCategory).get().then((snapShot){
        _shopList.clear();
        snapShot.docChanges.forEach((element) {
          ShopModel shops=ShopModel(
            id: element.doc['id'],
            shopImage: element.doc['shopImage'],
            shopName: element.doc['shopName'],
            about: element.doc['about'],
            executiveName: element.doc['executiveName'],
            executivePhoneNo: element.doc['executivePhoneNo'],
            shopCategory: element.doc['shopCategory'],
            subCategory: element.doc['subCategory'],
            webAddress: element.doc['webAddress'],
            mailAddress: element.doc['mailAddress'],
            twitterLink: element.doc['twitterLink'],
            facebookLink: element.doc['facebookLink'],
            phoneNo: element.doc['phoneNo'],
            discount: element.doc['discount'],
            linkedinLink: element.doc['linkedinLink'],
            amenities: element.doc['amenities'],
            sat: element.doc['Sat'],
            sun: element.doc['Sun'],
            mon: element.doc['Mon'],
            tue: element.doc['Tue'],
            wed: element.doc['Wed'],
            thu: element.doc['Thu'],
            fri: element.doc['Fri'],
            shopAddress: element.doc['shopAddress'],
            avgReviewStar:element.doc['avgReviewStar'],
            currency: element.doc['currency'],
            latitude: element.doc['latitude'],
            longitude: element.doc['longitude'],
          );
          _shopList.add(shops);
          //print(element.doc['avgReviewStar']);
        });
      });
      notifyListeners();
    }catch(error){
      print(error.toString());
    }
  }
  Future<void> getShopId(String id)async{
    try{
      await FirebaseFirestore.instance.collection('DiscountShop').where('id',isEqualTo: id).get().then((snapShot){
        _shopIdList.clear();
        snapShot.docChanges.forEach((element) {
          ShopModel shops=ShopModel(
            id: element.doc['id'],
            shopImage: element.doc['shopImage'],
            shopName: element.doc['shopName'],
            about: element.doc['about'],
            executiveName: element.doc['executiveName'],
            executivePhoneNo: element.doc['executivePhoneNo'],
            shopCategory: element.doc['shopCategory'],
            subCategory: element.doc['subCategory'],
            webAddress: element.doc['webAddress'],
            mailAddress: element.doc['mailAddress'],
            twitterLink: element.doc['twitterLink'],
            facebookLink: element.doc['facebookLink'],
            phoneNo: element.doc['phoneNo'],
            linkedinLink: element.doc['linkedinLink'],
            discount: element.doc['discount'],
            amenities: element.doc['amenities'],
            sat: element.doc['Sat'],
            sun: element.doc['Sun'],
            mon: element.doc['Mon'],
            tue: element.doc['Tue'],
            wed: element.doc['Wed'],
            thu: element.doc['Thu'],
            fri: element.doc['Fri'],
            shopAddress: element.doc['shopAddress'],
            avgReviewStar: element.doc['avgReviewStar'],
            currency: element.doc['currency'],
            latitude: element.doc['latitude'],
            longitude: element.doc['longitude'],
          );
          _shopIdList.add(shops);
          //print(_shopList.length);
        });
      });
      notifyListeners();
    }catch(error){
      print(error.toString());
    }
  }

  Future<void> updateDiscountShop(String id,DiscountShopProvider operation, var imageFile,String subcategory)async{
    WriteBatch batch = FirebaseFirestore.instance.batch();
    firebase_storage.Reference storageReference =
    firebase_storage.FirebaseStorage.instance.ref().child('Shop Photo').child(id);

    firebase_storage.UploadTask storageUploadTask = storageReference.putBlob(imageFile);

    firebase_storage.TaskSnapshot taskSnapshot;
    storageUploadTask.then((value) {
      taskSnapshot = value;
      taskSnapshot.ref.getDownloadURL().then((newImageDownloadUrl){
        final photoUrl = newImageDownloadUrl;
        FirebaseFirestore.instance.collection('DiscountShop').doc(id).update({
          'shopImage':photoUrl,
          'shopAddress': operation.shopModel.shopAddress!.isEmpty? operation.shopIdList[0].shopAddress :operation.shopModel.shopAddress,
          'shopName': operation.shopModel.shopName!.isEmpty? operation.shopIdList[0].shopName :operation.shopModel.shopName,
          'about': operation.shopModel.about!.isEmpty? operation.shopIdList[0].about :operation.shopModel.about,
          'mailAddress': operation.shopModel.mailAddress!.isEmpty? operation.shopIdList[0].mailAddress :operation.shopModel.mailAddress,
          'facebookLink': operation.shopModel.facebookLink!.isEmpty? operation.shopIdList[0].facebookLink :operation.shopModel.facebookLink,
          'webAddress': operation.shopModel.webAddress!.isEmpty? operation.shopIdList[0].webAddress :operation.shopModel.webAddress,
          'currency' : operation.shopModel.currency==null? operation.shopIdList[0].currency:operation.shopModel.currency,
          'linkedinLink': operation.shopModel.linkedinLink!.isEmpty? operation.shopIdList[0].linkedinLink :operation.shopModel.linkedinLink,
          'discount': operation.shopModel.discount!.isEmpty? operation.shopIdList[0].discount :operation.shopModel.discount,
          'phoneNo': operation.shopModel.phoneNo!.isEmpty? operation.shopIdList[0].phoneNo :operation.shopModel.phoneNo,
          'twitterLink': operation.shopModel.twitterLink!.isEmpty? operation.shopIdList[0].twitterLink :operation.shopModel.twitterLink,
          'latitude': operation.shopModel.latitude!.isEmpty? operation.shopIdList[0].latitude :operation.shopModel.latitude,
          'longitude': operation.shopModel.longitude!.isEmpty? operation.shopIdList[0].longitude :operation.shopModel.longitude,

        }).then((value)async{
          await FirebaseFirestore.instance.collection('SubscribedDiscountShop').where(
              'shopId', isEqualTo: id).get().then((querySnapshots)async{
            querySnapshots.docChanges.forEach((document) async {
              batch.update(FirebaseFirestore.instance.collection('SubscribedDiscountShop').doc(document.doc.id), {
                'shopImage':photoUrl,
                'shopName': operation.shopModel.shopName!.isEmpty? operation.shopIdList[0].shopName :operation.shopModel.shopName,
                'shopAddress': operation.shopModel.shopAddress!.isEmpty? operation.shopIdList[0].shopAddress :operation.shopModel.shopAddress,
                'about': operation.shopModel.about!.isEmpty? operation.shopIdList[0].about :operation.shopModel.about,
                'mailAddress': operation.shopModel.mailAddress!.isEmpty? operation.shopIdList[0].mailAddress :operation.shopModel.mailAddress,
                'facebookLink': operation.shopModel.facebookLink!.isEmpty? operation.shopIdList[0].facebookLink :operation.shopModel.facebookLink,
                'webAddress': operation.shopModel.webAddress!.isEmpty? operation.shopIdList[0].webAddress :operation.shopModel.webAddress,
                'currency' : operation.shopModel.currency==null? operation.shopIdList[0].currency:operation.shopModel.currency,
                'linkedinLink': operation.shopModel.linkedinLink!.isEmpty? operation.shopIdList[0].linkedinLink :operation.shopModel.linkedinLink,
                'discount': operation.shopModel.discount!.isEmpty? operation.shopIdList[0].discount :operation.shopModel.discount,
                'phoneNo': operation.shopModel.phoneNo!.isEmpty? operation.shopIdList[0].phoneNo :operation.shopModel.phoneNo,
                'twitterLink': operation.shopModel.twitterLink!.isEmpty? operation.shopIdList[0].twitterLink :operation.shopModel.twitterLink,
                'latitude': operation.shopModel.latitude!.isEmpty? operation.shopIdList[0].latitude :operation.shopModel.latitude,
                'longitude': operation.shopModel.longitude!.isEmpty? operation.shopIdList[0].longitude :operation.shopModel.longitude,
              });
              return await batch.commit();
            });
          });
          notifyListeners();
          showToast('Shop details updated');
        }).then((value){
          operation.getShop(subcategory);
        });
      },onError: (error){
        showToast(error.toString());
      });
    },onError: (error){
      showToast(error.toString());
    });

  }

  Future<void> updateShopDetails(String id, DiscountShopProvider operation,String subcategory)async{
    WriteBatch batch = FirebaseFirestore.instance.batch();
    FirebaseFirestore.instance.collection('DiscountShop').doc(id).update({
      'shopName': operation.shopModel.shopName!.isEmpty? operation.shopIdList[0].shopName :operation.shopModel.shopName,
      'shopAddress': operation.shopModel.shopAddress!.isEmpty? operation.shopIdList[0].shopAddress :operation.shopModel.shopAddress,
      'about': operation.shopModel.about!.isEmpty? operation.shopIdList[0].about :operation.shopModel.about,
      'mailAddress': operation.shopModel.mailAddress!.isEmpty? operation.shopIdList[0].mailAddress :operation.shopModel.mailAddress,
      'facebookLink': operation.shopModel.facebookLink!.isEmpty? operation.shopIdList[0].facebookLink :operation.shopModel.facebookLink,
      'webAddress': operation.shopModel.webAddress!.isEmpty? operation.shopIdList[0].webAddress :operation.shopModel.webAddress,
      'currency' : operation.shopModel.currency==null? operation.shopIdList[0].currency :operation.shopModel.currency,
      'linkedinLink': operation.shopModel.linkedinLink!.isEmpty? operation.shopIdList[0].linkedinLink :operation.shopModel.linkedinLink,
      'discount': operation.shopModel.discount!.isEmpty? operation.shopIdList[0].discount :operation.shopModel.discount,
      'phoneNo': operation.shopModel.phoneNo!.isEmpty? operation.shopIdList[0].phoneNo :operation.shopModel.phoneNo,
      'twitterLink': operation.shopModel.twitterLink!.isEmpty? operation.shopIdList[0].twitterLink :operation.shopModel.twitterLink,
      'latitude': operation.shopModel.latitude!.isEmpty? operation.shopIdList[0].latitude :operation.shopModel.latitude,
      'longitude': operation.shopModel.longitude!.isEmpty? operation.shopIdList[0].longitude :operation.shopModel.longitude,

    }).then((value)async{
      await FirebaseFirestore.instance.collection('SubscribedDiscountShop').where(
          'shopId', isEqualTo: id).get().then((querySnapshots)async{
        querySnapshots.docChanges.forEach((document) async {
          batch.update(FirebaseFirestore.instance.collection('SubscribedDiscountShop').doc(document.doc.id), {
            'shopName': operation.shopModel.shopName!.isEmpty? operation.shopIdList[0].shopName :operation.shopModel.shopName,
            'shopAddress': operation.shopModel.shopAddress!.isEmpty? operation.shopIdList[0].shopAddress :operation.shopModel.shopAddress,
            'about': operation.shopModel.about!.isEmpty? operation.shopIdList[0].about :operation.shopModel.about,
            'mailAddress': operation.shopModel.mailAddress!.isEmpty? operation.shopIdList[0].mailAddress :operation.shopModel.mailAddress,
            'facebookLink': operation.shopModel.facebookLink!.isEmpty? operation.shopIdList[0].facebookLink :operation.shopModel.facebookLink,
            'webAddress': operation.shopModel.webAddress!.isEmpty? operation.shopIdList[0].webAddress :operation.shopModel.webAddress,
            'currency' : operation.shopModel.currency==null? operation.shopIdList[0].currency:operation.shopModel.currency,
            'linkedinLink': operation.shopModel.linkedinLink!.isEmpty? operation.shopIdList[0].linkedinLink :operation.shopModel.linkedinLink,
            'discount': operation.shopModel.discount!.isEmpty? operation.shopIdList[0].discount :operation.shopModel.discount,
            'phoneNo': operation.shopModel.phoneNo!.isEmpty? operation.shopIdList[0].phoneNo :operation.shopModel.phoneNo,
            'twitterLink': operation.shopModel.twitterLink!.isEmpty? operation.shopIdList[0].twitterLink :operation.shopModel.twitterLink,
            'latitude': operation.shopModel.latitude!.isEmpty? operation.shopIdList[0].latitude :operation.shopModel.latitude,
            'longitude': operation.shopModel.longitude!.isEmpty? operation.shopIdList[0].longitude :operation.shopModel.longitude,
          });
          return await batch.commit();
        });
      });
      notifyListeners();
      showToast('Shop details updated');
    }).then((value){
      operation.getShop(subcategory);
    });

  }

  Future<void> updateSchedule(DiscountShopProvider auth, String id)async{
    WriteBatch batch = FirebaseFirestore.instance.batch();
    await FirebaseFirestore.instance.collection('DiscountShop').doc(id).update({
      'Sat': !auth.shopModel.sat![0]? null: ['${auth.shopModel.sat![1].hour}:${auth.shopModel.sat![1].minute}','${auth.shopModel.sat![2].hour}:${auth.shopModel.sat![2].minute}'],
      'Sun': !auth.shopModel.sun![0]? null: ['${auth.shopModel.sun![1].hour}:${auth.shopModel.sun![1].minute}','${auth.shopModel.sun![2].hour}:${auth.shopModel.sun![2].minute}'],
      'Mon': !auth.shopModel.mon![0]? null: ['${auth.shopModel.mon![1].hour}:${auth.shopModel.mon![1].minute}','${auth.shopModel.mon![2].hour}:${auth.shopModel.mon![2].minute}'],
      'Tue': !auth.shopModel.tue![0]? null: ['${auth.shopModel.tue![1].hour}:${auth.shopModel.tue![1].minute}','${auth.shopModel.tue![2].hour}:${auth.shopModel.tue![2].minute}'],
      'Wed': !auth.shopModel.wed![0]? null: ['${auth.shopModel.wed![1].hour}:${auth.shopModel.wed![1].minute}','${auth.shopModel.wed![2].hour}:${auth.shopModel.wed![2].minute}'],
      'Thu': !auth.shopModel.thu![0]? null: ['${auth.shopModel.thu![1].hour}:${auth.shopModel.thu![1].minute}','${auth.shopModel.thu![2].hour}:${auth.shopModel.thu![2].minute}'],
      'Fri': !auth.shopModel.fri![0]? null: ['${auth.shopModel.fri![1].hour}:${auth.shopModel.fri![1].minute}','${auth.shopModel.fri![2].hour}:${auth.shopModel.fri![2].minute}'],
    }).then((value)async{
      await FirebaseFirestore.instance.collection('SubscribedDiscountShop').where(
          'shopId', isEqualTo: id).get().then((querySnapshots)async{
        querySnapshots.docChanges.forEach((document) async {
          batch.update(FirebaseFirestore.instance.collection('SubscribedDiscountShop').doc(document.doc.id), {
            'sat': !auth.shopModel.sat![0]? null: ['${auth.shopModel.sat![1].hour}:${auth.shopModel.sat![1].minute}','${auth.shopModel.sat![2].hour}:${auth.shopModel.sat![2].minute}'],
            'sun': !auth.shopModel.sun![0]? null: ['${auth.shopModel.sun![1].hour}:${auth.shopModel.sun![1].minute}','${auth.shopModel.sun![2].hour}:${auth.shopModel.sun![2].minute}'],
            'mon': !auth.shopModel.mon![0]? null: ['${auth.shopModel.mon![1].hour}:${auth.shopModel.mon![1].minute}','${auth.shopModel.mon![2].hour}:${auth.shopModel.mon![2].minute}'],
            'tue': !auth.shopModel.tue![0]? null: ['${auth.shopModel.tue![1].hour}:${auth.shopModel.tue![1].minute}','${auth.shopModel.tue![2].hour}:${auth.shopModel.tue![2].minute}'],
            'wed': !auth.shopModel.wed![0]? null: ['${auth.shopModel.wed![1].hour}:${auth.shopModel.wed![1].minute}','${auth.shopModel.wed![2].hour}:${auth.shopModel.wed![2].minute}'],
            'thu': !auth.shopModel.thu![0]? null: ['${auth.shopModel.thu![1].hour}:${auth.shopModel.thu![1].minute}','${auth.shopModel.thu![2].hour}:${auth.shopModel.thu![2].minute}'],
            'fri': !auth.shopModel.fri![0]? null: ['${auth.shopModel.fri![1].hour}:${auth.shopModel.fri![1].minute}','${auth.shopModel.fri![2].hour}:${auth.shopModel.fri![2].minute}'],
          });
          return await batch.commit();
        });
      }).then((value)async{
        auth.getShopId(id).then((value){
          notifyListeners();
          showToast('Opening schedule successfully updated');
          shopIdList.sat= !auth.shopModel.sat![0]? null: ['${auth.shopModel.sat![1].hour}:${auth.shopModel.sat![1].minute}','${auth.shopModel.sat![2].hour}:${auth.shopModel.sat![2].minute}'];
          shopIdList.sun= !auth.shopModel.sun![0]? null: ['${auth.shopModel.sun![1].hour}:${auth.shopModel.sun![1].minute}','${auth.shopModel.sun![2].hour}:${auth.shopModel.sun![2].minute}'];
          shopIdList.mon= !auth.shopModel.mon![0]? null: ['${auth.shopModel.mon![1].hour}:${auth.shopModel.mon![1].minute}','${auth.shopModel.mon![2].hour}:${auth.shopModel.mon![2].minute}'];
          shopIdList.tue= !auth.shopModel.tue![0]? null: ['${auth.shopModel.tue![1].hour}:${auth.shopModel.tue![1].minute}','${auth.shopModel.tue![2].hour}:${auth.shopModel.tue![2].minute}'];
          shopIdList.wed= !auth.shopModel.wed![0]? null: ['${auth.shopModel.wed![1].hour}:${auth.shopModel.wed![1].minute}','${auth.shopModel.wed![2].hour}:${auth.shopModel.wed![2].minute}'];
          shopIdList.thu= !auth.shopModel.thu![0]? null: ['${auth.shopModel.thu![1].hour}:${auth.shopModel.thu![1].minute}','${auth.shopModel.thu![2].hour}:${auth.shopModel.thu![2].minute}'];
          shopIdList.fri= !auth.shopModel.fri![0]? null: ['${auth.shopModel.fri![1].hour}:${auth.shopModel.fri![1].minute}','${auth.shopModel.fri![2].hour}:${auth.shopModel.fri![2].minute}'];
        });

      });
    },onError: (error){
      showToast(error.toString());
    });
  }

  Future<void> updateAmenities(DiscountShopProvider auth, String id)async{
    WriteBatch batch = FirebaseFirestore.instance.batch();
    await FirebaseFirestore.instance.collection('DiscountShop').doc(id).update({
      'amenities': FieldValue.arrayUnion(auth.shopModel.amenities!),
    }).then((value) async{
      await FirebaseFirestore.instance.collection('SubscribedDiscountShop').where(
          'shopId', isEqualTo: id).get().then((querySnapshots)async{
        querySnapshots.docChanges.forEach((document) async {
          batch.update(FirebaseFirestore.instance.collection('SubscribedDiscountShop').doc(document.doc.id), {
            'amenities': FieldValue.arrayUnion(auth.shopModel.amenities!),
          });
          return await batch.commit();
        });
      });
    }).then((value){
      auth.getShopId(id);
    });
  }

  Future<void> removeAmenities(String id,DiscountShopProvider operation)async{
    WriteBatch batch = FirebaseFirestore.instance.batch();
    await FirebaseFirestore.instance.collection('DiscountShop').doc(id).update({
      'amenities': FieldValue.arrayRemove(operation.shopModel.amenities!),
    }).then((value) async{
      await FirebaseFirestore.instance.collection('SubscribedDiscountShop').where(
          'shopId', isEqualTo: id).get().then((querySnapshots)async{
        querySnapshots.docChanges.forEach((document) async {
          batch.update(FirebaseFirestore.instance.collection('SubscribedDiscountShop').doc(document.doc.id), {
            'amenities': FieldValue.arrayRemove(operation.shopModel.amenities!),
          });
          return await batch.commit();
        });
      });
    }).then((value){
      operation.getShopId(id);
    });
  }

  Future<void> deleteFeaturedProduct(String id,String shopId,DiscountShopProvider operation)async{
    await FirebaseFirestore.instance.collection('FeaturedProduct').doc(id).delete().then((value) {
      firebase_storage.FirebaseStorage.instance.ref().child('Featured Photo').child(id).delete().then((value){
        operation.getFeaturedProduct(shopId);
      });
      showToast('Featured Product deleted');
    },onError: (error){
      showToast(error.toString());
    });
  }

  Future<void> deleteShop(String id,String subcategory,DiscountShopProvider operation)async{
    WriteBatch batch = FirebaseFirestore.instance.batch();
    await FirebaseFirestore.instance.collection('DiscountShop').doc(id).delete().then((value) {
      firebase_storage.FirebaseStorage.instance.ref().child('Shop Photo').child(id).delete().then((value)async{
        await FirebaseFirestore.instance.collection('SubscribedDiscountShop').where(
            'shopId', isEqualTo: id).get().then((querySnapshots)async{
          querySnapshots.docChanges.forEach((document) async {
            batch.delete(document.doc.reference);
            return await batch.commit();
          });
          notifyListeners();
          showToast('Shop deleted');
        }).then((value){
          operation.getShop(subcategory);
        });
      });
    },onError: (error){
      showToast(error.toString());
    });
  }

  Future<void> getFeaturedProduct(String id)async{

    try{
      await FirebaseFirestore.instance.collection('FeaturedProduct').where('shopId',isEqualTo: id).get().then((snapshot) {
        _productList.clear();
        snapshot.docChanges.forEach((element) {
          FeaturedProductModel products = FeaturedProductModel(
            id: element.doc['id'],
            shopId: element.doc['shopId'],
            imageUrl: element.doc['imageUrl'],
            productName: element.doc['name'],
            productPrice: element.doc['price'],
          );
          _productList.add(products);
        });
      });
      notifyListeners();
    }catch(error){
      print(error.toString());
    }
  }


}
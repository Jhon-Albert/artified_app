import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class StorageService with ChangeNotifier {
  //firebase storage
  final firebaseStorage = FirebaseStorage.instance;

  // images stored
  List<String> _imageUrls = [];

  //loading
  bool _isLoading = false;

  //upload
  bool _isUploading = false;

  //getters
  List<String> get imageUrls => _imageUrls;
  bool get isLoading => _isLoading;
  bool get isUploading => _isUploading;

  //read
  Future<void> fetchImages() async {
    _isLoading = true;

    final ListResult result =
    await firebaseStorage.ref('uploaded_images/').listAll();

    final urls =
    await Future.wait(result.items.map((ref) => ref.getDownloadURL()));

    _imageUrls = urls;
    _isLoading = false;
    notifyListeners();
  }

  //delete image
  Future<void> deleteImages(String imageUrl) async {
    try {
      _imageUrls.remove(imageUrl);

      final String path = extractPathFromUrl(imageUrl);
      await firebaseStorage.ref(path).delete();
    } catch (e) {
      print("Error deleting image: $e");
    }
    notifyListeners();
  }

  String extractPathFromUrl(String url) {
    Uri uri = Uri.parse(url);
    String encodedPath = uri.pathSegments.last;
    return Uri.decodeComponent(encodedPath);
  }

  //upload image
  Future<void> uploadImage() async {
    _isUploading = true;
    notifyListeners();

    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    File file = File(image.path);

    try {
      String filePath = 'uploaded_images/${DateTime.now()}.png';
      await firebaseStorage.ref(filePath).putFile(file);

      String downloadUrl = await firebaseStorage.ref(filePath).getDownloadURL();
      _imageUrls.add(downloadUrl);
      notifyListeners();
    } catch (e) {
      print("Error uploading.");
    } finally {
      _isUploading = false;
      notifyListeners();
    }
  }
}

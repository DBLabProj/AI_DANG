// 비동기 처리를
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

Future getImage(ImageSource imageSource, ImagePicker picker) async {
  XFile? image = await picker.pickImage(
      source: imageSource);
  if (image != null) {
    return await MultipartFile.fromFile(image.path);
  }
  return null;
}

Future predict(var image) async {
  var requestUri = Uri.encodeFull('http://203.252.240.74:5000/predict');
  var formData = FormData.fromMap({"file": image});

  var dio = Dio();
  // Dio 패키지 사용하여 REST API 서버와 통신
  try {
    dio.options.contentType = 'multipart/form-data';
    dio.options.maxRedirects.isFinite;
    var response = await dio.post(requestUri, data: formData);
    return response.data;
  } catch(e) {
    print(e);
  }
}
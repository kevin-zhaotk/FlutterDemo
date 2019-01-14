import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'TestModel.dart';

class TestViewModel {

  // StreamController controller = StreamController<List<TestModel>>.broadcast();
  List<TestModel> mModelList = new List();

  Future<List<TestModel>> load() async {
    http.Response response = await http.get(TestModel.URL);
    var data = json.decode(response.body)['T1444270454635'] as List;

    List<TestModel> models = data.map((element) => TestModel.fromJsonMap(element)).toList();
    
    mModelList.addAll(models);
    return mModelList;
  }

}
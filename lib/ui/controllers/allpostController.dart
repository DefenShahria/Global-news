
import 'package:get/get.dart';
import 'package:task_getx/data/newsModel.dart';
import 'package:task_getx/network/networkcaller.dart';
import 'package:task_getx/network/networkresponse.dart';
import '../../data/urls.dart';

class AllpostController extends GetxController{
  bool _getAllpostinProgress = false;

  AllpostModel _allpostModelData = AllpostModel();

  String _errorMessage = '';

  AllpostModel get allpostModelData => _allpostModelData;

  bool get getAllpostinProgress => _getAllpostinProgress;

  String get errorMessage => _errorMessage;

  Future<bool> getAllpost()async{
    _getAllpostinProgress = true;
    update();
    final Networkresponse response = await Networkcall.getRequest(Urls.newsApi);
    _getAllpostinProgress = false;
    if(response.issuccess){
      _allpostModelData = AllpostModel.fromJson(response.responseJson!);
      update();
      return true;
    }else{
      _errorMessage='Fetch data Failed';
      update();
      return false;
    }

  }

}
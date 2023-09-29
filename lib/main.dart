import 'package:flutter/cupertino.dart';
import 'package:perlatech/core/services/services_locator.dart' as sl1;
import 'app/app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await sl1.init();
  // SystemChrome.setSystemUIOverlayStyle(
  //      SystemUiOverlayStyle(statusBarColor: sl<ColorsManager>().primary));
  runApp(MyApp());
}

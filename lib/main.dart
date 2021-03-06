import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rootron/env.dart';
import 'package:rootron/services/mock_service.dart';
import 'package:rootron/stores/counter.dart';
import 'package:rootron/stores/doorStore.dart';
import 'package:rootron/stores/forgetPasswordStore.dart';
import 'package:rootron/stores/loginStore.dart';
import 'package:rootron/stores/registerStore.dart';
import 'package:rootron/stores/userStore.dart';
import 'package:rootron/widgets/app.dart';

void main() async {
  /// 后面将MockService改成RealService即可切换到真实后台的api
//  Env.api = MockService();
  print("进入应用");
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      /// 将需要跨组件的store配置在下方
//      ChangeNotifierProvider.value(value: theme),
      /// provider结合mobx
      /// 单独使用mobx并不能跨组件实现数据共享，在结合provider之后既可以数据共享，又可以及时释放内存。
      /// 命名时如果是单页面的数据管理则可以 xxx_mobx   如果是多页面的 xxx_store
      Provider<Counter>(create: (_) => Counter()),
      Provider<LoginStore>(create: (_) => LoginStore()),
      Provider<UserStore>(create: (_) => UserStore()),
      Provider<DoorStore>(create: (_) => DoorStore()),
      Provider<RegisterStore>(create: (_) => RegisterStore()),
      Provider<ForgetPasswordStore>(create: (_) => ForgetPasswordStore()),
    ],
    child: CommunityApp(),
  ));
}

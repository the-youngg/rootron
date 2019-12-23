import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rootron/stores/counter.dart';
import 'package:rootron/widgets/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      /// 将需要跨组件的store配置在下方
//      ChangeNotifierProvider.value(value: theme),
      /// provider结合mobx
      /// 单独使用mobx并不能跨组件实现数据共享，在结合provider之后既可以数据共享，又可以及时释放内存。
      /// 命名时如果是单页面的数据管理则可以 xxx_mobx   如果是多页面的 xxx_store
      Provider<Counter>(create: (_) => Counter()),
    ],
    child: CommunityApp(),
  ));
}

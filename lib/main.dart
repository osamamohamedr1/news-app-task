import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_task/core/routing/app_router.dart';
import 'package:news_app_task/core/routing/routes.dart';
import 'package:news_app_task/core/utils/my_bloc_opserver.dart';
import 'package:news_app_task/core/utils/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await dotenv.load(fileName: '.env');
  setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  runApp(NewsApp(appRouter: AppRouter()));
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: Routes.home,
      ),
    );
  }
}

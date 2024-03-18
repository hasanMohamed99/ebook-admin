import 'package:ebook_task_admin/features/home/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/dependency_injection.dart';
import 'core/theming/colors.dart';
import 'features/home/logic/home_cubit.dart';
import 'features/home/logic/rail_nav_cubit/rail_nav_cubit.dart';

class EbookAdminApp extends StatelessWidget {
  const EbookAdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugInvertOversizedImages = true;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.mainYellow,
          primary: AppColors.mainYellow,
          secondary: AppColors.mainYellow,
        ),
        scaffoldBackgroundColor: AppColors.gray,
        splashColor: Colors.transparent,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<HomeCubit>()..getPendingUser()..getAcceptedUser()),
          BlocProvider(create: (context) => getIt<RailNavCubit>()),
        ],
        child: const HomeScreen(),
      ),
    );
  }
}

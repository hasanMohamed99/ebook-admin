import 'package:ebook_task_admin/core/helpers/constants.dart';
import 'package:ebook_task_admin/ebook_admin_app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
import 'core/di/dependency_injection.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    Supabase.initialize(
      url: AppConstants.supabaseUrl,
      anonKey: AppConstants.supabaseAnonKey,
      authOptions: const FlutterAuthClientOptions(
        authFlowType: AuthFlowType.pkce,
      ),
    ).then((value) => setupGetIt(supabaseUrl: AppConstants.supabaseUrl, roleKey: AppConstants.supabaseRoleKey))
  ]);
  //Bloc.observer = MyBlocObserver();
  runApp(const EbookAdminApp());
}
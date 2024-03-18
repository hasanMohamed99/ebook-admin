import 'package:ebook_task_admin/features/home/logic/rail_nav_cubit/rail_nav_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../features/home/data/repo/home_repo.dart';
import '../../features/home/logic/home_cubit.dart';
import '../local/shared_pref_service/shared_pref_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';
import '../networking/supabase_service/supabase_service.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt({required String supabaseUrl, required String roleKey}) async{
  final supabaseInstance = Supabase.instance;
  getIt.registerLazySingleton<SupabaseService>(() => SupabaseService(supabaseInstance, supabaseUrl, roleKey));

  // Shared Preferences
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPrefService>(() => SharedPrefService(prefs));

  // Home
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
  getIt.registerFactory<RailNavCubit>(() => RailNavCubit());

}
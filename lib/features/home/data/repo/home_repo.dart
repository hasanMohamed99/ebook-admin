import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/networking/supabase_service/supabase_service.dart';
import '../models/book_upload_request_body.dart';
import '../models/user_updated_data_request.dart';


class HomeRepo {
  final SupabaseService _supabaseService;

  HomeRepo(this._supabaseService);

  Stream<dynamic> getPendingUsers(){
    return _supabaseService.getPendingUsers();
  }

  Stream<dynamic> getAcceptedUsers(){
    return _supabaseService.getAcceptedUsers();
  }

  Future<dynamic> updateUserStatus(UserUpdatedDataRequest userUpdatedDataRequest){
    return _supabaseService.updateUserStatus(userUpdatedDataRequest);
  }

  Future<dynamic> denyUser({required int id}){
    return _supabaseService.denyUser(id: id);
  }

  Future<void> deleteUser({required String authId}) {
    return _supabaseService.deleteUser(authId: authId);
  }

  Future<UserResponse> sendConfirmEmail({required String email}){
    return _supabaseService.sendConfirmEmail(email: email);
  }

  Future<void> addBook({required BookUploadRequestBody bookUploadRequestBody}) async{
    _supabaseService.addBook(bookUploadRequestBody: bookUploadRequestBody);
  }

  Stream<dynamic> getBooks (){
    return _supabaseService.getBooks();
  }

  Future<void> deleteBook({required int id}){
    return _supabaseService.deleteBook(id: id);
  }
}
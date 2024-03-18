import 'dart:async';
import 'package:ebook_task_admin/features/home/data/models/user_updated_data_request.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../features/home/data/models/book_upload_request_body.dart';

class SupabaseService {
  final Supabase supabase;
  final String supabaseUrl;
  final String roleKey;
  const SupabaseService(this.supabase, this.supabaseUrl, this.roleKey);

  Stream<dynamic> getPendingUsers() {
    return supabase.client
        .from('users')
        .stream(primaryKey: ['id']).eq('status', 'pending');
  }

  Stream<dynamic> getAcceptedUsers() {
    return supabase.client
        .from('users')
        .stream(primaryKey: ['id']).eq('status', 'accepted');
  }

  Future<dynamic> updateUserStatus(
      UserUpdatedDataRequest userUpdatedDataRequest) {
    return supabase.client
        .from('users')
        .upsert(userUpdatedDataRequest.toJson());
  }

  Future<dynamic> denyUser({required int id}) {
    return supabase.client.from('users').delete().match({'id': id});
  }

  Future<void> deleteUser({required String authId}) {
    final supabase = SupabaseClient(supabaseUrl, roleKey);
    return supabase.auth.admin.deleteUser(authId);
  }

  Future<UserResponse> sendConfirmEmail({required String email}) {
    final supabase = SupabaseClient(supabaseUrl, roleKey);
    return supabase.auth.admin.inviteUserByEmail(email);
  }

  bool isSignIn() {
    return supabase.client.auth.currentSession != null ? true : false;
  }

  Future<void> logout() async {
    await supabase.client.auth.signOut();
  }

  Future<void> addBook({required BookUploadRequestBody bookUploadRequestBody}) async {
    final String imagePath = await supabase.client.storage
        .from('books')
        .uploadBinary(
          '/books_imgs/${bookUploadRequestBody.bookName}.png',
          bookUploadRequestBody.image,
          fileOptions: const FileOptions(cacheControl: '3600', upsert: false,),
        );

    final String pdfPath = await supabase.client.storage
        .from('books')
        .uploadBinary(
          '/books_pdfs/${bookUploadRequestBody.bookName}.pdf',
          bookUploadRequestBody.pdfFile.files.first.bytes!,
          fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
        );
    await supabase.client.from('books').insert(
      {
        'image': supabase.client.storage.from('books').getPublicUrl(imagePath.substring(6)),
        'pdf': supabase.client.storage.from('books').getPublicUrl(pdfPath.substring(6)),
        'name': bookUploadRequestBody.bookName,
        'author': bookUploadRequestBody.authorName,
        'category': bookUploadRequestBody.category,
      },
    );
  }

  Future<void> updateBook({required BookUploadRequestBody bookUploadRequestBody}) async {
    final String imagePath = await supabase.client.storage
        .from('books')
        .uploadBinary(
      '/books_imgs/${bookUploadRequestBody.bookName}.png',
      bookUploadRequestBody.image,
      fileOptions: const FileOptions(cacheControl: '3600', upsert: false,),
    );

    final String pdfPath = await supabase.client.storage
        .from('books')
        .uploadBinary(
      '/books_pdfs/${bookUploadRequestBody.bookName}.pdf',
      bookUploadRequestBody.pdfFile.files.first.bytes!,
      fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
    );
    await supabase.client.from('books').insert(
      {
        'image': supabase.client.storage.from('books').getPublicUrl(imagePath.substring(6)),
        'pdf': supabase.client.storage.from('books').getPublicUrl(pdfPath.substring(6)),
        'name': bookUploadRequestBody.bookName,
        'author': bookUploadRequestBody.authorName,
        'category': bookUploadRequestBody.category,
      },
    );
  }

  Stream<dynamic> getBooks() {
    return supabase.client.from('books').stream(primaryKey: ['id']);
  }

  Future<void> deleteBook({required int id}){
    return supabase.client.from('books').delete().match({'id': id});
  }
}

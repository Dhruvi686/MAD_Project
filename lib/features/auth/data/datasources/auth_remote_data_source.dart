import '../../domain/entities/user.dart';
import '../../../../services/firebase_service.dart';

/// Abstract AuthRemoteDataSource defines the contract for authentication data operations
abstract class AuthRemoteDataSource {
  Future<User> signIn(String email, String password);
  Future<User> signUp(String email, String password);
  Future<void> signOut();
}

/// Implementation of AuthRemoteDataSource using Firebase
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseService firebaseService;

  AuthRemoteDataSourceImpl(this.firebaseService);

  @override
  Future<User> signIn(String email, String password) async {
    final userCredential = await firebaseService.signInWithEmailAndPassword(
      email,
      password,
    );
    return User(
      uid: userCredential.user!.uid,
      email: userCredential.user!.email!,
    );
  }

  @override
  Future<User> signUp(String email, String password) async {
    final userCredential = await firebaseService.createUserWithEmailAndPassword(
      email,
      password,
    );
    return User(
      uid: userCredential.user!.uid,
      email: userCredential.user!.email!,
    );
  }

  @override
  Future<void> signOut() async {
    await firebaseService.signOut();
  }
}

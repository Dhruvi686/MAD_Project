import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// FirebaseService class encapsulates all Firebase operations
/// Provides a clean interface for Firebase Auth and Firestore
class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Gets the current authenticated user
  User? get currentUser => _auth.currentUser;

  /// Stream of authentication state changes
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// Signs in user with email and password
  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    String password,
  ) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  /// Creates a new user account with email and password
  Future<UserCredential> createUserWithEmailAndPassword(
    String email,
    String password,
  ) {
    return _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  /// Signs out the current user
  Future<void> signOut() {
    return _auth.signOut();
  }

  /// Gets the todos collection reference from Firestore
  CollectionReference<Map<String, dynamic>> get todosCollection =>
      _firestore.collection('todos');
}

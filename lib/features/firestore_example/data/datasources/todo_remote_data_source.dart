import '../../../../core/entities/todo.dart';
import '../../../../services/firebase_service.dart';

/// Abstract TodoRemoteDataSource defines the contract for todo data operations
abstract class TodoRemoteDataSource {
  Future<List<Todo>> getTodos();
  Future<void> addTodo(Todo todo);
  Future<void> updateTodo(Todo todo);
  Future<void> deleteTodo(String id);
}

/// Implementation of TodoRemoteDataSource using Firestore
class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  final FirebaseService firebaseService;

  TodoRemoteDataSourceImpl(this.firebaseService);

  @override
  Future<List<Todo>> getTodos() async {
    final snapshot = await firebaseService.todosCollection.get();
    return snapshot.docs
        .map((doc) => Todo.fromJson(doc.data()..['id'] = doc.id))
        .toList();
  }

  @override
  Future<void> addTodo(Todo todo) async {
    await firebaseService.todosCollection.add(todo.toJson());
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    await firebaseService.todosCollection.doc(todo.id).update(todo.toJson());
  }

  @override
  Future<void> deleteTodo(String id) async {
    await firebaseService.todosCollection.doc(id).delete();
  }
}

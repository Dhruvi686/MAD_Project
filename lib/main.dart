import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme/app_theme.dart';
import 'features/auth/domain/usecases/sign_in.dart';
import 'features/auth/domain/usecases/sign_up.dart';
import 'features/auth/domain/usecases/sign_out.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/firestore_example/domain/usecases/get_todos.dart';
import 'features/firestore_example/domain/usecases/add_todo.dart';
import 'features/firestore_example/domain/usecases/update_todo.dart';
import 'features/firestore_example/domain/usecases/delete_todo.dart';
import 'features/firestore_example/presentation/bloc/todo_bloc.dart';
import 'features/firestore_example/presentation/pages/todo_page.dart';
import 'firebase_options.dart';
import 'services/firebase_service.dart';
import 'features/auth/data/datasources/auth_remote_data_source.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/firestore_example/data/datasources/todo_remote_data_source.dart';
import 'features/firestore_example/data/repositories/todo_repository_impl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Dependency injection
    final firebaseService = FirebaseService();
    final authRemoteDataSource = AuthRemoteDataSourceImpl(firebaseService);
    final authRepository = AuthRepositoryImpl(authRemoteDataSource);
    final signIn = SignIn(authRepository);
    final signUp = SignUp(authRepository);
    final signOut = SignOut(authRepository);
    final authBloc = AuthBloc(signIn: signIn, signUp: signUp, signOut: signOut);

    final todoRemoteDataSource = TodoRemoteDataSourceImpl(firebaseService);
    final todoRepository = TodoRepositoryImpl(todoRemoteDataSource);
    final getTodos = GetTodos(todoRepository);
    final addTodo = AddTodo(todoRepository);
    final updateTodo = UpdateTodo(todoRepository);
    final deleteTodo = DeleteTodo(todoRepository);
    final todoBloc = TodoBloc(
      getTodos: getTodos,
      addTodo: addTodo,
      updateTodo: updateTodo,
      deleteTodo: deleteTodo,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: authBloc),
        BlocProvider.value(value: todoBloc),
      ],
      child: MaterialApp(
        title: 'Flutter Firebase App',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: const AuthWrapper(),
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasData) {
          return const TodoPage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}

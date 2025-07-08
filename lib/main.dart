import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/features/authentication/presentation/cubit/signup_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// المسارات الخاصة بالتطبيق
import 'package:flutter_application_1/core/routes/app_routes.dart';

// Cubits
import 'package:flutter_application_1/features/onboarding/cubit/onboarding_cubit.dart';


// UseCase
import 'package:flutter_application_1/features/authentication/domain/usecases/login_usecase.dart';

// Repository
import 'package:flutter_application_1/features/authentication/data/repositories/firebase_auth_repository.dart';
import 'package:flutter_application_1/features/authentication/domain/repositories/auth_repository.dart';

// الصفحات


import 'features/authentication/presentation/cubit/login_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

 
  final AuthRepository authRepository = FirebaseAuthRepository();
  final LoginUseCase loginUseCase = LoginUseCase(authRepository);

  runApp(MyApp(loginUseCase: loginUseCase));
}

class MyApp extends StatelessWidget {
  final LoginUseCase loginUseCase;

  const MyApp({super.key, required this.loginUseCase});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => OnboardingCubit()),
        BlocProvider(
          create: (_) => LoginCubit(loginUseCase),
        ),
     
        BlocProvider(
        create: (_) => SignupCubit(FirebaseAuthRepository()),
),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.initial,
        routes: AppRoutes.routes,

      ),
    );
  }
}

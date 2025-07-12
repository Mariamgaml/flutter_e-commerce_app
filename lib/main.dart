import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_application_1/features/authentication/domain/repositories/auth_repository1.dart';
import 'package:flutter_application_1/features/authentication/domain/repositories/auth_repository2.dart';

import 'package:flutter_application_1/features/authentication/presentation/cubit_subbase/cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

// المسارات الخاصة بالتطبيق
import 'package:flutter_application_1/core/routes/app_routes.dart';

// Cubits
import 'package:flutter_application_1/features/onboarding/cubit/onboarding_cubit.dart';


// UseCase
import 'package:flutter_application_1/features/authentication/domain/usecases/login_usecase.dart';

// Repository
import 'package:flutter_application_1/features/authentication/data/repositories/firebase_auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



// الصفحات


import 'features/authentication/presentation/cubit_firebase/login_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
    await Supabase.initialize(
    url: 'https://ihlmbytsuwibdrkqjsal.supabase.co',   // اكتبي رابط مشروعك
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlobG1ieXRzdXdpYmRya3Fqc2FsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTIwNzY5NDYsImV4cCI6MjA2NzY1Mjk0Nn0.Qz7huNU2SuzXxcCfwgoie4IuX3SdoKMOw_ifmuCPvao',                     // اكتبي المفتاح السري
  );

  final authRepository = AuthRepository2(); 

  runApp(MyApp(authRepository: authRepository));
}

class MyApp extends StatelessWidget {
  final AuthRepository1 authRepository;

  const MyApp({super.key, required this.authRepository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => OnboardingCubit()),
        BlocProvider(create: (_) => LoginCubit(LoginUseCase(FirebaseAuthRepository()))),
        BlocProvider<AuthCubit>(
          create: (_) => AuthCubit(authRepository),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.login,
        routes: AppRoutes.routes,
      ),
      
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_dio_repository/ui/companies_screen.dart';

import 'bloc/company_bloc.dart';

void main() {
  runApp(BlocProvider<CompanyBloc>(
    create: (context) => CompanyBloc(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pinjollist',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.transparent,
      ),
      home: CompaniesScreen(),
    );
  }
}
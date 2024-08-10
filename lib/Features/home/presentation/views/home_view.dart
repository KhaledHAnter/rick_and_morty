import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/Core/utils/app_router.dart';
import 'package:rick_and_morty/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:rick_and_morty/constants.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => GoRouter.of(context).push(AppRouter.kSearch),
            icon: const Icon(Icons.search),
          )
        ],
        backgroundColor: kPrimaryColor,
        title: const Text(
          'Rick and Morty',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: const HomeViewBody(),
    );
  }
}

import 'package:appwrite_flutter_sample/presentation/bloc/home_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appwrite Demo'),
      ),
      body: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          if (state is HomePageInitial) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Press the button to fetch data'),
                  ElevatedButton(
                    onPressed: () {
                      context.read<HomePageBloc>().add(FetchDataEvent());
                    },
                    child: const Text('Fetch Data'),
                  ),
                ],
              ),
            );
          }
          if (state is HomePageLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is HomePageLoaded) {
            return ListView.builder(
              itemCount: state.entries.length,
              itemBuilder: (context, index) {
                final entry = state.entries[index];
                return ListTile(
                  title: Text(entry.title),
                  subtitle: Text(entry.description),
                );
              },
            );
          }
          if (state is HomePageError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('An error occurred'),
                  ElevatedButton(
                    onPressed: () {
                      context.read<HomePageBloc>().add(FetchDataEvent());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}

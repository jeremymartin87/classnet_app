import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cours_bloc.dart';

class AllCours extends StatefulWidget {
  const AllCours({Key? key}) : super(key: key);

  @override
  State<AllCours> createState() => _AllCoursState();
}

class _AllCoursState extends State<AllCours> {
  late final CoursBloc _coursBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoursBloc()..add(FetchCours()),
      child: Scaffold(
        body: BlocBuilder<CoursBloc, CoursState>(
          builder: (context, state) {
            if (state is CoursEmpty) {
              return const Center(child: Text("No Cours"));
            } else if (state is CoursLoaded) {
              return ListView.builder(
                itemCount: state.coursList.length,
                itemExtent: 140,
                itemBuilder: (context, index) {
                  final result = state.coursList[index];
                  final image = result.image;
                  return Container(
                    padding: const EdgeInsets.all(8),
                    child: CustomListItem(
                      name: result.name,
                      thumbnail: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/$image'),
                          ),
                        ),
                      ),
                      theme: result.theme,
                      image: result.image,
                      text: result.text,
                    ),
                  );
                },
              );
            }
            return Container(); // Fallback container
          },
        ),
      ),
    );
  }
}

class CustomListItem extends StatelessWidget {
  final String name;
  final Widget thumbnail;
  final String theme;
  final String image;
  final String text;

  const CustomListItem({
    Key? key,
    required this.name,
    required this.thumbnail,
    required this.theme,
    required this.image,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: thumbnail,
      title: Text(name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(theme),
          Text(text),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masters_india/bloc/gst_bloc.dart';
import 'package:masters_india/views/details/details_screen.dart';
import 'package:masters_india/views/home/tabs_view.dart';
import 'package:masters_india/views/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchTextController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
            tooltip: 'more',
          ),
        ],
      ),
      body: Column(
        children: [
          AppbarBottom(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Select the type for',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    height: 2,
                  ),
                ),
                Text(
                  'GST Number Search Tool',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 12),
                const Tabs(),
              ],
            ),
          ),
          SizedBox(height: 24),
          InputField(
            title: 'Enter GST number',
            hintText: 'Ex. 04AABCU9603R1ZV',
            controller: searchTextController,
            onSubmit: (_) => _handleSearch(context, searchTextController),
          ),
          const SizedBox(height: 8),
          BlocConsumer<GSTBloc, GSTState>(
            listener: (_, state) {
              if (state is GSTLoadError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              } else if (state is GSTLoaded) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => DetailsScreen(data: state.data),
                  ),
                );
              }
            },
            builder: (_, state) {
              return Button(
                isBusy: state is GSTLoading,
                title: 'Search',
                onPressed: () => _handleSearch(context, searchTextController),
              );
            },
          ),
        ],
      ),
    );
  }

  void _handleSearch(BuildContext context, TextEditingController controller) {
    final value = controller.text;
    context.read<GSTBloc>().add(Search(value));
    controller.clear();
    FocusScope.of(context).unfocus();
  }
}

import 'package:flutter/material.dart';
import 'package:review_task/model/fetch_model.dart';
import 'package:review_task/service/fetch_service.dart';

class FetchScreen extends StatelessWidget {
  const FetchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FetchServices api = FetchServices();
    return Scaffold(
      body: FutureBuilder(
        future: api.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            List<FetchModel>? datas = snapshot.data;
            return ListView.builder(
              itemCount: datas!.length,
              itemBuilder: (context, index) {
                FetchModel data = datas[index];
                return ListTile(
                  title: Text(data.title.toString()),
                );
              },
            );
          }
        },
      ),
    );
  }
}

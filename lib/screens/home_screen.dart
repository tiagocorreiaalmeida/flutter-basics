import 'package:flutter/material.dart';

import '../api.dart';
import '../widgets/jobs_list.dart';

final jobsRequest = getJobs();

class HomeScreen extends StatelessWidget {
  static const routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: jobsRequest,
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (dataSnapshot.error != null) {
              return Center(
                child: Text('An error occurred!'),
              );
            } else {
              return JobsList(
                jobs: dataSnapshot.data,
              );
            }
          }
        },
      ),
    );
  }
}

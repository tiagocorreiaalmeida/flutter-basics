import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/bookmarked_jobs.dart';
import 'screens/home_tabs.dart';
import 'screens/jobs_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => BookmarkedJobs())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeTabs(),
        routes: {JobDetails.routeName: (_) => JobDetails()},
      ),
    );
  }
}

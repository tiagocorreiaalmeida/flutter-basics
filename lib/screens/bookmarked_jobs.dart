import 'package:flutter/material.dart';
import 'package:jobs_finder/providers/bookmarked_jobs.dart';
import 'package:jobs_finder/widgets/jobs_list.dart';
import 'package:provider/provider.dart';

class BookMarkedJobs extends StatelessWidget {
  static const routeName = "/bookmarked-jobs";

  BookMarkedJobs({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Consumer<BookmarkedJobs>(
      builder: (_, bookmarkedJobs, child) {
        if (bookmarkedJobs.jobs.isNotEmpty) {
          return JobsList(
            jobs: bookmarkedJobs.jobs,
          );
        } else {
          return Center(
            child: Text(
              "No jobs bookmared",
              style: Theme.of(context).textTheme.headline6,
            ),
          );
        }
      },
    ));
  }
}

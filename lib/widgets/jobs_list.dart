import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import "../models/job.dart";
import "../providers/bookmarked_jobs.dart";
import "./job_card.dart";
import '../screens/jobs_details.dart';

class JobsList extends StatelessWidget {
  final List<Job> jobs;

  const JobsList({Key key, this.jobs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bookmarkedJobs = Provider.of<BookmarkedJobs>(context, listen: true);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: ListView.separated(
        separatorBuilder: (ctx, index) => SizedBox(
          height: 8,
        ),
        scrollDirection: Axis.vertical,
        itemCount: jobs.length,
        itemBuilder: (ctx, i) => JobCard(
          id: jobs[i].id,
          type: jobs[i].type,
          createdAt: jobs[i].createdAt,
          company: jobs[i].company,
          location: jobs[i].location,
          title: jobs[i].title,
          companyLogo: jobs[i].companyLogo,
          isBookmarked: bookmarkedJobs.isBookMarked(jobs[i].id),
          onPress: (_) => Navigator.of(context).pushNamed(
            JobDetails.routeName,
            arguments: JobDetailsScreenArguments(job: jobs[i]),
          ),
          onBookmarkPress: (_) => bookmarkedJobs.toggleBoomark(jobs[i]),
        ),
      ),
    );
  }
}

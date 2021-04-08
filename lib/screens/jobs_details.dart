import 'package:flutter/material.dart';

import '../models/job.dart';

class JobDetailsScreenArguments {
  final Job job;

  const JobDetailsScreenArguments({@required this.job});
}

class JobDetails extends StatelessWidget {
  static const routeName = "/job-details";

  @override
  Widget build(BuildContext context) {
    final JobDetailsScreenArguments screenArgs =
        ModalRoute.of(context).settings.arguments as JobDetailsScreenArguments;
    final job = screenArgs.job;

    return Scaffold(
      appBar: AppBar(
        title: Text(job.title),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    job.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    job.company,
                    style: Theme.of(context).textTheme.bodyText1.merge(
                          TextStyle(
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(job.location),
                  SizedBox(
                    height: 16,
                  ),
                  Text(job.description),
                  if (job.companyUrl != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Text(job.companyUrl)],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

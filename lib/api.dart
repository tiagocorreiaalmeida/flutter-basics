import 'dart:convert';
import 'package:http/http.dart' as http;

import "./models/job.dart";

Future<List<Job>> getJobs() async {
  const url = "https://jobs.github.com/positions.json?description=ruby&page=1";

  try {
    final response = await http.get(Uri.parse(url));
    final data = json.decode(response.body) as List<dynamic>;

    final List<Job> loadedJobs = [];
    data.forEach((job) {
      loadedJobs.add(Job(
        id: job['id'],
        company: job['company'],
        companyLogo: job['company_logo'],
        companyUrl: job['company_url'],
        createdAt: job['create_at'],
        description: job['description'],
        howToApply: job['how_to_apply'],
        location: job['location'],
        title: job['title'],
        type: job['type'],
        url: job['url'],
      ));
    });

    return loadedJobs;
  } catch (e) {
    throw (e);
  }
}

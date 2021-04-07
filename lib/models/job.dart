import 'package:flutter/material.dart';

class Job {
  final String id;
  final String type;
  final String url;
  final String createdAt;
  final String company;
  final String companyUrl;
  final String location;
  final String title;
  final String description;
  final String howToApply;
  final String companyLogo;

  Job(
      {@required this.id,
      @required this.type,
      @required this.url,
      @required this.createdAt,
      @required this.company,
      @required this.companyUrl,
      @required this.location,
      @required this.title,
      @required this.description,
      @required this.howToApply,
      @required this.companyLogo});
}

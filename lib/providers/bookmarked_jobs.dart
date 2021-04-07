import 'package:flutter/cupertino.dart';

import '../models/job.dart';

class BookmarkedJobs with ChangeNotifier {
  List<Job> _jobs = [];

  List<Job> get jobs {
    return [..._jobs];
  }

  toggleBoomark(Job job) {
    if (this.isBookMarked(job.id)) {
      _removeBookmark(job.id);
    } else {
      _addBookmark(job);
    }
  }

  _addBookmark(Job job) {
    this._jobs.add(job);

    this.notifyListeners();
  }

  _removeBookmark(String jobId) {
    this._jobs.removeWhere((job) => job.id == jobId);

    this.notifyListeners();
  }

  bool isBookMarked(String jobId) {
    final job =
        this._jobs.firstWhere((job) => job.id == jobId, orElse: () => null);

    return job != null;
  }
}

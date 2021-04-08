import 'package:flutter/material.dart';

const imageFallBack = "assets/images/job-fallback";

class JobCard extends StatelessWidget {
  final String id;
  final String type;
  final String createdAt;
  final String company;
  final String location;
  final String title;
  final String companyLogo;
  final bool isBookmarked;
  final Function(String jobId) onPress;
  final Function(String jobId) onBookmarkPress;

  const JobCard({
    Key key,
    @required this.id,
    @required this.type,
    @required this.createdAt,
    @required this.company,
    @required this.location,
    @required this.title,
    @required this.companyLogo,
    @required this.onPress,
    @required this.onBookmarkPress,
    @required this.isBookmarked,
  }) : super(key: key);

  Widget getImage() {
    return companyLogo != null
        ? Image.network(
            companyLogo,
            fit: BoxFit.contain,
          )
        : Image.asset(
            imageFallBack,
            fit: BoxFit.contain,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              padding: EdgeInsets.all(8),
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: getImage(),
                  ),
                  Positioned(
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      child: IconButton(
                        color: Colors.white,
                        icon: Icon(
                            isBookmarked ? Icons.star : Icons.star_outline),
                        onPressed: () => onBookmarkPress(id),
                      ),
                    ),
                    top: 16,
                    right: 16,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline6,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(type),
                  SizedBox(
                    height: 8,
                  ),
                  Text(location),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () => onPress(id),
                    child: Text("See More"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

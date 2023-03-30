import 'package:webfeed/util/iterable.dart';
import 'package:webfeed/webfeed.dart';
import 'package:xml/xml.dart';

FeedType getFeedType(String xml) {
  var document = XmlDocument.parse(xml);
  var rss = document.findElements('rss').firstOrNull;
  var rdf = document.findElements('rdf:RDF').firstOrNull;
  if (rss != null || rdf != null) {
    return FeedType.Rss;
  }
  var feedElement = document.findElements('feed').firstOrNull;
  if (feedElement != null) {
    return FeedType.Atom;
  }
  return FeedType.Unknown;
}

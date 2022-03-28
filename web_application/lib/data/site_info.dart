class SiteInfo {
  late String title;
  late String cors;
  late String html;

  SiteInfo.empty() {
    title = '';
    cors = '';
    html = '';
  }

  SiteInfo.initSite(String value) {
    int titleIndex = value.indexOf('<title>');
    if (titleIndex < 0) {
      title = '';
    } else {
      title = value.substring(titleIndex + 7, value.indexOf('</title>'));
    }
    cors = value.substring(41, 51);
    html = value;
  }
}

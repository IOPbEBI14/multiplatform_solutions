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
    int corsIndex = value.indexOf('<Access-Control-Allow-Origin>');
    if (titleIndex < 0) {
      title = '';
    } else {
      title = value.substring(titleIndex + 7, value.indexOf('</title>')).trim();
    }
    if (corsIndex < 0) {
      cors = 'none';
    } else {
      cors = value.substring(
          corsIndex + 29, value.indexOf('</Access-Control-Allow-Origin>'));
    }
    html = value;
  }
}

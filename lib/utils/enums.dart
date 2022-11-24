enum AccountType { free, pro, unlimited, unknown }

enum BackResult {
  ok("ok"),
  error("error");

  const BackResult(this.title);

  @override
  String toString() => name;
  final String title;
}

enum CategoryType {
  brand("brand"),
  reference("reference"),
  company("company"),
  category("category"),
  function("function"),
  country("country"),
  city("city"),
  province("province"),
  model("model"),
  insurance("insurance");
  speciality("speciality");

  const CategoryType(this.title);

  @override
  String toString() => name;
  final String title;
}

enum Currency {
  rial("100"),
  dolor("101"),
  lira("102"),
  euro("103"),
  btc("200");

  const Currency(this.title);

  @override
  String toString() => name;
  final String title;
}

enum CreateProductStatus {
  inQueue(2),
  done(0);

  const CreateProductStatus(this.title);

  final int title;
}

enum DialogMessage { info, warning, success }

enum FilterType { history, text, username, hashtag, location }

enum NotificationType { vote, comment, join, phopx }

enum PostMediaType { audio, video, image, text }

enum PostType { all, text, voice, video, image, unknown }

enum ProductType {
  highlight("highlight");

  const ProductType(this.title);

  @override
  String toString() => name;
  final String title;
}

enum SortLists {
  atoZ("0"),
  zToA("1"),
  mostRecent("2"),
  oldest("3"),
  cheapest("4"),
  mostExpensive("5"),
  orderByVotes("6");

  const SortLists(this.title);

  @override
  String toString() => name;
  final String title;
}

enum SizeType {
  square("square"),
  horizontal45("horizontal45"),
  vertical45("vertical45"),
  vertical169("vertical169"),
  horizontal169("horizontal169");

  const SizeType(this.title);

  @override
  String toString() => name;
  final String title;
}

enum TenderType {
  tender("tender"),
  auction("auction");

  const TenderType(this.title);

  @override
  String toString() => name;
  final String title;
}

enum TypeMedia {
  image("image"),
  all("all"),
  audio("audio"),
  video("video"),
  text("text");

  const TypeMedia(this.title);

  @override
  String toString() => name;
  final String title;
}

enum UseCaseBime {
  bime("bime");

  const UseCaseBime(this.title);

  @override
  String toString() => name;
  final String title;
}

enum UseCaseSlider {
  sliderBime("sliderBime");

  const UseCaseSlider(this.title);

  @override
  String toString() => name;
  final String title;
}

enum UseCasePaymentBime {
  paymentBime("paymentBime");

  const UseCasePaymentBime(this.title);

  @override
  String toString() => name;
  final String title;
}

enum UseCaseProduct {
  ad("ad"),
  dailyPrice("dailyPrice"),
  tender("tender"),
  project("project"),
  service("service"),
  consultant("consultant"),
  company("company"),
  tutorial("tutorial"),
  product("product"),
  story("story"),
  magazine("magazine");

  const UseCaseProduct(this.title);

  final String title;
}

enum UseCaseCategory {
  location("location"),
  category("category"),
  colors("colors"),
  specialty("specialty"),
  specializedArt("specializedArt"),
  tag("tag"),
  ad("ad"),
  dailyPrice("dailyPrice"),
  tender("tender"),
  auction("auction"),
  project("project"),
  service("service"),
  consultant("consultant"),
  company("company"),
  learn("learn"),
  user("user"),
  tutorial("tutorial"),
  magazine("magazine");

  const UseCaseCategory(this.title);

  @override
  String toString() => name;
  final String title;
}

enum UseCaseMedia {
  image("image"),
  all("all"),
  audio("audio"),
  video("video"),
  media("media"),
  cover("cover"),
  profile("profile"),
  chat("Chat"),
  post("post"),
  text("text");

  const UseCaseMedia(this.title);

  @override
  String toString() => name;
  final String title;
}

enum UseCaseNotification {
  success("success"),
  error("error"),
  message("message");

  const UseCaseNotification(this.title);

  @override
  String toString() => name;
  final String title;
}

enum UseCaseBime {
  bime("bime");

  const UseCaseBime(this.title);

  @override
  String toString() => name;
  final String title;
}

enum UseCaseSlider {
  sliderBime("sliderBime");

  const UseCaseSlider(this.title);

  @override
  String toString() => name;
  final String title;
}

enum UseCasePaymentBime {
  paymentBime("paymentBime");

  const UseCasePaymentBime(this.title);

  @override
  String toString() => name;
  final String title;
}







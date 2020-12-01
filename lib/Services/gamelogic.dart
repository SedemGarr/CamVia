import 'package:trivia_app/Models/Trivia.dart';
import 'globalvariables.dart';

addToCategory() {
  switch (triviaObjects[triviaIndex].category) {
    case "General Knowledge":
      categories[0]++;
      break;
    case "Entertainment: Books":
      categories[1]++;
      break;
    case "Entertainment: Film":
      categories[2]++;
      break;
    case "Entertainment: Music":
      categories[3]++;
      break;
    case "Entertainment: Musicals & Theatres":
      categories[4]++;
      break;
    case "Entertainment: Television":
      categories[5]++;
      break;
    case "Entertainment: Video Games":
      categories[6]++;
      break;
    case "Entertainment: Board Games":
      categories[7]++;
      break;
    case "Science & Nature":
      categories[8]++;
      break;
    case "Science: Computers":
      categories[9]++;
      break;
    case "Science: Mathematics":
      categories[10]++;
      break;
    case "Mythology":
      categories[11]++;
      break;
    case "Sports":
      categories[12]++;
      break;
    case "Geography":
      categories[13]++;
      break;
    case "History":
      categories[14]++;
      break;
    case "Politics":
      categories[15]++;
      break;
    case "Art":
      categories[16]++;
      break;
    case "Celebrities":
      categories[17]++;
      break;
    case "Animals":
      categories[18]++;
      break;
    case "Vehicles":
      categories[19]++;
      break;
    case "Entertainment: Comics":
      categories[20]++;
      break;
    case "Science: Gadgets":
      categories[21]++;
      break;
    case "Entertainment: Japanese Anime & Manga":
      categories[22]++;
      break;
    case "Entertainment: Cartoon & Animations":
      categories[23]++;
      break;
  }
}

stringCleaner(String string) {
  return string
      .replaceAll("ldquo;", "'")
      .replaceAll("&aacute;", "a")
      .replaceAll("&iacute;", "a")
      .replaceAll("&Eacute;", "E")
      .replaceAll(";&rdquo;", "...")
      .replaceAll("&rdquo;", "...")
      .replaceAll("&rsquo;", "'")
      .replaceAll("&hellip", "")
      .replaceAll("&#039;", "'")
      .replaceAll("&shy;", "-")
      .replaceAll("&oacute;", "o")
      .replaceAll("&lrm;", "")
      .replaceAll("&uuml;", "u")
      .replaceAll("&eacute;", "e")
      .replaceAll("&amp;", "&")
      .replaceAll("&deg;", "°")
      .replaceAll("&quot;", "'");
}

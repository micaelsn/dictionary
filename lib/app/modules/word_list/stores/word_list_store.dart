import 'dart:convert';

import 'package:dictionary/shared/common/main.dart';
import 'package:dictionary/shared/helpers/errors.dart';
import 'package:flutter_triple/flutter_triple.dart';

class WordListStore extends NotifierStore<Failure, List<Word>> {
  WordListStore() : super([]) {
    getWords();
  }

  Future<void> getWords() async {
    setLoading(true);

    // await Future.delayed(Duration(seconds: 1));

    // int value = state + 1;
    // if (value < 5) {
    //   update(value);
    // } else {
    //   setError(Exception('Error: state not can be > 4'));
    // }
    update((wordsJson as List).map((e) => WordModel.fromMap(e)).toList());
    setLoading(false);
  }
}

final wordsJson = jsonDecode(r'''
[{"word":"hi","phonetic":"/haɪ/","phonetics":[{"text":"/haɪ/","audio":"https://api.dictionaryapi.dev/media/pronunciations/en/hi-1-uk.mp3","sourceUrl":"https://commons.wikimedia.org/w/index.php?curid=9021999","license":{"name":"BY 3.0 US","url":"https://creativecommons.org/licenses/by/3.0/us"}},{"text":"/haɪ/","audio":"https://api.dictionaryapi.dev/media/pronunciations/en/hi-1-us.mp3","sourceUrl":"https://commons.wikimedia.org/w/index.php?curid=1221246","license":{"name":"BY-SA 3.0","url":"https://creativecommons.org/licenses/by-sa/3.0"}}],"meanings":[{"partOfSpeech":"noun","definitions":[{"definition":"The word \"hi\" used as a greeting.","synonyms":[],"antonyms":[],"example":"I didn't even get a hi."}],"synonyms":["greeting","hello"],"antonyms":[]},{"partOfSpeech":"interjection","definitions":[{"definition":"A friendly, informal, casual greeting said when meeting someone.","synonyms":[],"antonyms":[],"example":"Hi, how are you?"},{"definition":"An exclamation to call attention.","synonyms":[],"antonyms":[]},{"definition":"Expressing wonder or derision.","synonyms":[],"antonyms":[]}],"synonyms":["greetings","hello"],"antonyms":[]}],"license":{"name":"CC BY-SA 3.0","url":"https://creativecommons.org/licenses/by-sa/3.0"},"sourceUrls":["https://en.wiktionary.org/wiki/hi"]},{"word":"hi","phonetics":[],"meanings":[{"partOfSpeech":"adjective","definitions":[{"definition":"Very elevated; extending or being far above a base; tall; lofty.","synonyms":[],"antonyms":[],"example":"The balloon rose high in the sky.   The wall was high.   a high mountain"},{"definition":"Relatively elevated; rising or raised above the average or normal level from which elevation is measured.","synonyms":[],"antonyms":[]},{"definition":"Having a specified elevation or height; tall.","synonyms":[],"antonyms":[],"example":"three feet high   three Mount Everests high"},{"definition":"Elevated in status, esteem, prestige; exalted in rank, station, or character.","synonyms":[],"antonyms":[],"example":"The oldest of the elves' royal family still conversed in High Elvish."},{"definition":"Of great importance and consequence: grave (if negative) or solemn (if positive).","synonyms":[],"antonyms":[],"example":"high crimes, the high festival of the sun"},{"definition":"Consummate; advanced (e.g. in development) to the utmost extent or culmination, or possessing a quality in its supreme degree, at its zenith.","synonyms":[],"antonyms":[],"example":"high (i.e. intense) heat; high (i.e. full or quite) noon; high (i.e. rich or spicy) seasoning; high (i.e. complete) pleasure; high (i.e. deep or vivid) colour; high (i.e. extensive, thorough) scholarship; high tide; high [tourism] season; the High Middle Ages"},{"definition":"(in several set phrases) Remote in distance or time.","synonyms":[],"antonyms":[],"example":"high latitude, high antiquity"},{"definition":"(in several set phrases) Very traditionalist and conservative, especially in favoring older ways of doing things; see e.g. high church, High Tory.","synonyms":[],"antonyms":[]},{"definition":"Elevated in mood; marked by great merriment, excitement, etc.","synonyms":[],"antonyms":[],"example":"in high spirits"},{"definition":"(of a lifestyle) Luxurious; rich.","synonyms":[],"antonyms":[],"example":"high living, the high life"},{"definition":"Lofty, often to the point of arrogant, haughty, boastful, proud.","synonyms":[],"antonyms":[],"example":"a high tone"},{"definition":"(with \"on\" or \"about\") Keen, enthused.","synonyms":[],"antonyms":[]},{"definition":"(of a body of water) With tall waves.","synonyms":[],"antonyms":[]},{"definition":"Large, great (in amount or quantity, value, force, energy, etc).","synonyms":[],"antonyms":[],"example":"My bank charges me a high interest rate.   I was running a high temperature and had high cholesterol.   high voltage   high prices   high winds   a high number"},{"definition":"(acoustics) Acute or shrill in pitch, due to being of greater frequency, i.e. produced by more rapid vibrations (wave oscillations).","synonyms":[],"antonyms":[],"example":"The note was too high for her to sing."},{"definition":"Made with some part of the tongue positioned high in the mouth, relatively close to the palate.","synonyms":[],"antonyms":[]},{"definition":"Greater in value than other cards, denominations, suits, etc.","synonyms":[],"antonyms":[]},{"definition":"(of meat, especially venison) Strong-scented; slightly tainted/spoiled; beginning to decompose.","synonyms":[],"antonyms":[],"example":"Epicures do not cook game before it is high."},{"definition":"Intoxicated; under the influence of a mood-altering drug, formerly usually alcohol, but now (from the mid-20th century) usually not alcohol but rather marijuana, cocaine, heroin, etc.","synonyms":[],"antonyms":[]},{"definition":"(of a sailing ship) Near, in its direction of travel, to the (direction of the) wind.","synonyms":[],"antonyms":[]}],"synonyms":[],"antonyms":["low"]}],"license":{"name":"CC BY-SA 3.0","url":"https://creativecommons.org/licenses/by-sa/3.0"},"sourceUrls":["https://en.wiktionary.org/wiki/hi","https://en.wiktionary.org/wiki/high"]}]
''');

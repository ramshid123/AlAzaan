import 'package:get/get.dart';

class TimeModelView extends GetxController {
  var fujr = ''.obs;
  var dzuhr = ''.obs;
  var asr = ''.obs;
  var magrib = ''.obs;
  var isha = ''.obs;

  var ar_date = ''.obs;
  var currentTime = ''.obs;

  var nextPrayer = ''.obs;
}

List qoutes = [
  'There are two words which are light on the tongue, heavy on the scale, and loved by the Most Merciful: SubhanAllahi wa bihamdi, SubhanAllahi al-azeem (Glorified is Allah and praised is He, Glorified is Allah the Most Great).',
  'A man came to the Messenger of Allah (ﷺ) and said, “O Messenger of Allah! Who among the people has the most right to my good company?” He replied, “Your mother.” The man said, “Then who?” He replied, “Your mother.” The man said, “Then who?” He replied, “Your mother.” The man said, “Then who?” He replied, “Then your father.”',
  'Beware of suspicion for it is the most untruthful type of speech.',
  'A slave [of Allah] may utter a word without giving it much thought by which he slips into the fire a distance further than that between east and west.',
  'Allah becomes jealous [of His honor] and that is when the believer does something He has forbidden.',
  'Whoever stands [for night prayer] in Ramadan out of faith and hope for reward will be forgiven his past sins.',
  'One Umrah to the next is an expiation for whatever happened between them and the only reward for an accepted Hajj is paradise.',
  'Yawning is from the devil so whenever one of you yawns, then let him try to suppress it as much as possible.',
  'The one who looks after a widow or poor person is like the one who strives in the cause of Allah – and I think he also said – he is like the one who continuously stands for prayer without slacking and fasts without breaking.',
  'No fatigue, illness, worry, sorrow, harm, grief, or even the prick of a thorn afflicts a Muslim except that Allah expiates some of his sins by it.',
  'Whoever attends a funeral and prays over it, then he will have a qiraat and whoever remains there until the person is buried will have two qiraat. It was said to him, “What are two qiraat“? He (ﷺ) replied, “They are like two great mountains.”',
  'The Prophet (ﷺ) would never find fault with food. If he desired it, he would eat. If he disliked it, he would leave it.',
  'The fire is surrounded by [unlawful] desires and paradise by difficulties.',
  'If you said to your companion on Friday [during Jumu’ah prayer], “Listen!”, while the imaam is giving the sermon, then you’ve erred [by engaging in idle talk].',
  'If I did not fear difficulty for my nation, then I would have commanded them to use the siwaak before every prayer.',
  'The Prophet (ﷺ) saw a man who did not wash his heel [during ablution], so he (ﷺ) said, “Save the heels from the fire!”',
  'Isn’t the one who raises his head before the imaam [during prayer] afraid that Allah may change his head to that of a donkey?',
  'Whenever someone goes to the mosque in the morning or evening, Allah prepares for him a place in paradise.',
  'Whatever of the lower garment falls below the ankles is in the fire.',
  'The angels continue to pray for one of you as long as he remains in his place of prayer provided he does not break his ablution. The angels say, “O Allah! Forgive him. O Allah! Have mercy on him.“',
  '“Every person from my nation will enter paradise except the one who refuses.” They asked, “O Messenger of Allah, and who will refuse?” He (ﷺ) replied, “Whoever obeyed me, then he entered paradise. Whoever disobeyed me, then he refused.”',
  'If a man said to his [Muslim] brother, “O Kaafir (disbeliever)”, then that [statement] will return to one of them.',
  'Allah is more joyous with the repentance of one of you than you are when you find your lost animal.',
  'You will not enter paradise until you believe and you will not believe until you love one another. Should I direct you to that which will cause you to love one another? Spread the greeting of peace among yourselves.',
  'The five daily prayers, one Friday prayer to the next, and one Ramadan to the next are an expiation for whatever happened between them as long as the major sins are avoided.',
  'The best fast after Ramadan is in the month of Allah: Muharram. The best prayer after the obligatory one is the night prayer.',
  'Whoever repents before the sun rises from the west, Allah will accept his repentance.',
  'Trim the mustache and leave the beard. Differ from the Magians.',
];

class QuranView extends GetxController {
  var selectedIndex = 0.obs;
  var surahs_loading = false.obs;
  var single_surath_loading = false.obs;
  var isEnglish = true.obs;

  var surah_list = [].obs;
  var revelationType = 'Medinan'.obs;
  var numberOfAyahs = 0.obs;

  var surath_ar = [].obs;
  var surath_en = [].obs;
}

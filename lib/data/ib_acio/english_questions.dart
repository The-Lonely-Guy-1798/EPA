// lib/data/ib_acio/english_questions.dart

import 'package:exam_prep_adda/screens/exam_detail_screen.dart'; // Import Question class

final List<Question> ibAcioEnglishQuestions = [
  // Existing questions
  Question(
    questionText: 'Find the synonym of "benevolent".',
    options: ['Kind', 'Cruel', 'Angry', 'Sad'],
    correctAnswerIndex: 0,
    explanation: 'Benevolent means well meaning and kindly. "Kind" is the closest synonym.',
  ),
  Question(
    questionText: 'Correct the sentence: "He don\'t like apples."',
    options: [
      'He doesn\'t like apples.',
      'He not like apples.',
      'He do not like apples.',
      'He did not like apples.'
    ],
    correctAnswerIndex: 0,
    explanation: 'The correct auxiliary verb for "he" in the present simple negative is "doesn\'t".',
  ),

  // -------------------- Additional 98 Questions --------------------

  // Spotting the Error (Questions 3-12)
  Question(
    questionText: 'The population of Tokyo is greater than (A) / any other city (B) / in the world. (C) / No Error (D)',
    options: ['(A)', '(B)', '(C)', '(D)'],
    correctAnswerIndex: 1,
    explanation: 'The correct phrase should be "any other city" because "Tokyo" is also a city. This is to avoid comparing a city to itself. Thus, option (B) is the error.',
  ),
  Question(
    questionText: 'Neither of the two brothers (A) / are guilty of this crime. (B) / No Error (C)',
    options: ['(A)', '(B)', '(C)'],
    correctAnswerIndex: 1,
    explanation: 'When using "neither of", the verb should be singular. The correct sentence is "Neither of the two brothers is guilty of this crime." Thus, option (B) is the error.',
  ),
  Question(
    questionText: 'I am taking (A) / my son to the museum (B) / for the last month. (C) / No Error (D)',
    options: ['(A)', '(B)', '(C)', '(D)'],
    correctAnswerIndex: 0,
    explanation: 'The phrase "for the last month" indicates an action that started in the past and is continuing. The correct tense should be the present perfect continuous. The sentence should be "I have been taking..." Thus, option (A) is the error.',
  ),
  Question(
    questionText: 'The car which was stolen yesterday (A) / has been found and returned to its owner. (B) / No Error (C)',
    options: ['(A)', '(B)', '(C)'],
    correctAnswerIndex: 2,
    explanation: 'The sentence is grammatically correct. "Which was stolen" is a relative clause correctly modifying "car". "Has been found" is the correct tense. Thus, there is No Error.',
  ),
  Question(
    questionText: 'She is confident (A) / in winning the gold medal (B) / in the Olympics. (C) / No Error (D)',
    options: ['(A)', '(B)', '(C)', '(D)'],
    correctAnswerIndex: 1,
    explanation: 'The correct preposition after "confident" is "of", followed by a gerund. The phrase should be "confident of winning". Thus, option (B) is the error.',
  ),
  Question(
    questionText: 'The manager along with his staff members (A) / are invited to the party. (B) / No Error (C)',
    options: ['(A)', '(B)', '(C)'],
    correctAnswerIndex: 1,
    explanation: 'When two subjects are joined by "along with", the verb agrees with the first subject. The first subject is "The manager", which is singular. So the verb should be "is". Thus, option (B) is the error.',
  ),
  Question(
    questionText: 'Most of the people (A) / I spoke to said that they (B) / would not vote for him. (C) / No Error (D)',
    options: ['(A)', '(B)', '(C)', '(D)'],
    correctAnswerIndex: 3,
    explanation: 'The sentence is grammatically correct. The subject and verb agree, and the clauses are correctly structured. Thus, there is No Error.',
  ),
  Question(
    questionText: 'Had I known about the exam results, (A) / I would have called you immediately. (B) / No Error (C)',
    options: ['(A)', '(B)', '(C)'],
    correctAnswerIndex: 2,
    explanation: 'This is a third conditional sentence, and both clauses are structured correctly. "Had I known" is an inverted form of "If I had known". Thus, there is No Error.',
  ),
  Question(
    questionText: 'I prefer to drive (A) / than to walk, (B) / but sometimes it is faster. (C) / No Error (D)',
    options: ['(A)', '(B)', '(C)', '(D)'],
    correctAnswerIndex: 1,
    explanation: 'The comparative "prefer" should be followed by "to", not "than". The correct phrase is "prefer to drive to walk". Thus, option (B) is the error.',
  ),
  Question(
    questionText: 'Every one of the boys (A) / were given a prize (B) / after the competition. (C) / No Error (D)',
    options: ['(A)', '(B)', '(C)', '(D)'],
    correctAnswerIndex: 1,
    explanation: 'The phrase "Every one of" requires a singular verb. The correct verb is "was". The sentence should be "Every one of the boys was given a prize". Thus, option (B) is the error.',
  ),

  // Synonyms (Questions 13-22)
  Question(
    questionText: 'Find the synonym of "arduous".',
    options: ['Easy', 'Difficult', 'Pleasant', 'Simple'],
    correctAnswerIndex: 1,
    explanation: 'Arduous means involving or requiring strenuous effort; difficult and tiring. "Difficult" is the closest synonym.',
  ),
  Question(
    questionText: 'Find the synonym of "eager".',
    options: ['Lazy', 'Uninterested', 'Keen', 'Bored'],
    correctAnswerIndex: 2,
    explanation: 'Eager means wanting to do or have something very much. "Keen" is the closest synonym.',
  ),
  Question(
    questionText: 'Find the synonym of "abundant".',
    options: ['Scarce', 'Plentiful', 'Empty', 'Rare'],
    correctAnswerIndex: 1,
    explanation: 'Abundant means existing or available in large quantities; plentiful. "Plentiful" is the closest synonym.',
  ),
  Question(
    questionText: 'Find the synonym of "concur".',
    options: ['Agree', 'Disagree', 'Fight', 'Hate'],
    correctAnswerIndex: 0,
    explanation: 'Concur means to be of the same opinion; agree. "Agree" is the closest synonym.',
  ),
  Question(
    questionText: 'Find the synonym of "resilient".',
    options: ['Fragile', 'Vulnerable', 'Flexible', 'Weak'],
    correctAnswerIndex: 2,
    explanation: 'Resilient means able to withstand or recover quickly from difficult conditions. "Flexible" or "able to bounce back" is the closest synonym.',
  ),
  Question(
    questionText: 'Find the synonym of "gregarious".',
    options: ['Shy', 'Introverted', 'Sociable', 'Loner'],
    correctAnswerIndex: 2,
    explanation: 'Gregarious means fond of company; sociable. "Sociable" is the closest synonym.',
  ),
  Question(
    questionText: 'Find the synonym of "ubiquitous".',
    options: ['Rare', 'Uncommon', 'Pervasive', 'Scarce'],
    correctAnswerIndex: 2,
    explanation: 'Ubiquitous means present, appearing, or found everywhere. "Pervasive" is the closest synonym.',
  ),
  Question(
    questionText: 'Find the synonym of "meticulous".',
    options: ['Careless', 'Sloppy', 'Precise', 'Hasty'],
    correctAnswerIndex: 2,
    explanation: 'Meticulous means showing great attention to detail; very careful and precise. "Precise" is the closest synonym.',
  ),
  Question(
    questionText: 'Find the synonym of "transient".',
    options: ['Permanent', 'Lasting', 'Brief', 'Durable'],
    correctAnswerIndex: 2,
    explanation: 'Transient means lasting only for a short time; impermanent. "Brief" is the closest synonym.',
  ),
  Question(
    questionText: 'Find the synonym of "perilous".',
    options: ['Safe', 'Secure', 'Harmless', 'Dangerous'],
    correctAnswerIndex: 3,
    explanation: 'Perilous means full of danger or risk. "Dangerous" is the closest synonym.',
  ),

  // Antonyms (Questions 23-32)
  Question(
    questionText: 'Find the antonym of "amicable".',
    options: ['Friendly', 'Polite', 'Hostile', 'Pleasant'],
    correctAnswerIndex: 2,
    explanation: 'Amicable means having a spirit of friendliness. The opposite is "hostile".',
  ),
  Question(
    questionText: 'Find the antonym of "explicit".',
    options: ['Clear', 'Direct', 'Ambiguous', 'Obvious'],
    correctAnswerIndex: 2,
    explanation: 'Explicit means stated clearly and in detail. The opposite is "ambiguous".',
  ),
  Question(
    questionText: 'Find the antonym of "flourish".',
    options: ['Thrive', 'Prosper', 'Wither', 'Grow'],
    correctAnswerIndex: 2,
    explanation: 'Flourish means to grow or develop in a healthy or vigorous way. The opposite is "wither".',
  ),
  Question(
    questionText: 'Find the antonym of "hinder".',
    options: ['Obstruct', 'Impede', 'Facilitate', 'Prevent'],
    correctAnswerIndex: 2,
    explanation: 'Hinder means to create difficulties for (someone or something), resulting in delay or obstruction. The opposite is "facilitate".',
  ),
  Question(
    questionText: 'Find the antonym of "modest".',
    options: ['Humble', 'Arrogant', 'Shy', 'Reserved'],
    correctAnswerIndex: 1,
    explanation: 'Modest means a humble estimate of one\'s own importance. The opposite is "arrogant".',
  ),
  Question(
    questionText: 'Find the antonym of "paucity".',
    options: ['Scarcity', 'Plenty', 'Shortage', 'Lack'],
    correctAnswerIndex: 1,
    explanation: 'Paucity means the presence of something only in small or insufficient quantities. The opposite is "plenty".',
  ),
  Question(
    questionText: 'Find the antonym of "profound".',
    options: ['Deep', 'Intense', 'Superficial', 'Serious'],
    correctAnswerIndex: 2,
    explanation: 'Profound means very great or intense. The opposite is "superficial".',
  ),
  Question(
    questionText: 'Find the antonym of "sporadic".',
    options: ['Infrequent', 'Irregular', 'Constant', 'Random'],
    correctAnswerIndex: 2,
    explanation: 'Sporadic means occurring at irregular intervals or only in a few places. The opposite is "constant".',
  ),
  Question(
    questionText: 'Find the antonym of "venerate".',
    options: ['Revere', 'Respect', 'Despise', 'Honour'],
    correctAnswerIndex: 2,
    explanation: 'Venerate means to regard with great respect. The opposite is "despise".',
  ),
  Question(
    questionText: 'Find the antonym of "zeal".',
    options: ['Enthusiasm', 'Eagerness', 'Indifference', 'Passion'],
    correctAnswerIndex: 2,
    explanation: 'Zeal means great energy or enthusiasm in pursuit of a cause or an objective. The opposite is "indifference".',
  ),

  // One-Word Substitution (Questions 33-42)
  Question(
    questionText: 'A person who is skilled in handling money matters.',
    options: ['Auditor', 'Banker', 'Numismatist', 'Economist'],
    correctAnswerIndex: 3,
    explanation: 'An economist is an expert who studies the management of money and goods.',
  ),
  Question(
    questionText: 'A person who studies the stars and planets.',
    options: ['Geologist', 'Astronomer', 'Biologist', 'Physicist'],
    correctAnswerIndex: 1,
    explanation: 'An astronomer is a person who studies astronomy.',
  ),
  Question(
    questionText: 'One who can use both hands equally well.',
    options: ['Ambivalent', 'Ambidextrous', 'Amphibious', 'Amorphous'],
    correctAnswerIndex: 1,
    explanation: 'Ambidextrous means a person who is able to use the right and left hands equally well.',
  ),
  Question(
    questionText: 'The study of ancient societies.',
    options: ['Anthropology', 'Archaeology', 'History', 'Ethnology'],
    correctAnswerIndex: 1,
    explanation: 'Archaeology is the study of human history and prehistory through the excavation of sites and the analysis of physical remains.',
  ),
  Question(
    questionText: 'A person who loves books.',
    options: ['Bibliophile', 'Bookworm', 'Bibliographer', 'Librarian'],
    correctAnswerIndex: 0,
    explanation: 'A bibliophile is a person who collects or has a great love of books.',
  ),
  Question(
    questionText: 'A place where birds are kept.',
    options: ['Aquarium', 'Apiary', 'Aviary', 'Sanctuary'],
    correctAnswerIndex: 2,
    explanation: 'An aviary is a large enclosure for keeping birds.',
  ),
  Question(
    questionText: 'A person who is new to a subject or skill.',
    options: ['Novice', 'Expert', 'Veteran', 'Amateur'],
    correctAnswerIndex: 0,
    explanation: 'A novice is a person who is new to or inexperienced in a field or situation.',
  ),
  Question(
    questionText: 'The murder of one\'s own brother.',
    options: ['Fratricide', 'Homicide', 'Regicide', 'Patricide'],
    correctAnswerIndex: 0,
    explanation: 'Fratricide is the killing of one\'s brother.',
  ),
  Question(
    questionText: 'A statement that cannot be contradicted or denied.',
    options: ['Incredible', 'Irrevocable', 'Irrefutable', 'Illegible'],
    correctAnswerIndex: 2,
    explanation: 'Irrefutable means impossible to deny or disprove.',
  ),
  Question(
    questionText: 'An unexpected piece of good fortune.',
    options: ['Boon', 'Windfall', 'Manna', 'Luck'],
    correctAnswerIndex: 1,
    explanation: 'A windfall is a piece of unexpected good fortune, typically one that involves money.',
  ),

  // Fill in the Blanks (Questions 43-52)
  Question(
    questionText: 'He has great _____ for classical music.',
    options: ['love', 'passion', 'affinity', 'inclination'],
    correctAnswerIndex: 2,
    explanation: 'Affinity means a spontaneous or natural liking for someone or something. It fits the context best.',
  ),
  Question(
    questionText: 'The project was successful, but it came with a huge _____ of time and effort.',
    options: ['price', 'cost', 'expense', 'burden'],
    correctAnswerIndex: 1,
    explanation: 'Cost is the most appropriate word to describe the amount of time and effort spent.',
  ),
  Question(
    questionText: 'The government has taken a _____ stance on the issue.',
    options: ['firm', 'stable', 'rigid', 'strong'],
    correctAnswerIndex: 0,
    explanation: 'Firm stance is a common idiom meaning a resolute or determined position.',
  ),
  Question(
    questionText: 'He was so _____ by the news that he couldn\'t speak.',
    options: ['shocked', 'surprised', 'overwhelmed', 'astonished'],
    correctAnswerIndex: 2,
    explanation: 'Overwhelmed means to be buried or covered under a huge mass of something. It conveys a strong emotional reaction, fitting the context.',
  ),
  Question(
    questionText: 'She is fluent _____ five languages.',
    options: ['at', 'in', 'with', 'by'],
    correctAnswerIndex: 1,
    explanation: 'The correct preposition with "fluent" is "in".',
  ),
  Question(
    questionText: 'We should always adhere _____ the rules of the road.',
    options: ['to', 'with', 'by', 'on'],
    correctAnswerIndex: 0,
    explanation: 'The correct preposition with "adhere" is "to".',
  ),
  Question(
    questionText: 'The company decided to _____ the factory due to financial losses.',
    options: ['close down', 'shut up', 'shut off', 'close off'],
    correctAnswerIndex: 0,
    explanation: '"Close down" is a phrasal verb meaning to cease business or operation.',
  ),
  Question(
    questionText: 'The students were asked to _____ the blanks with suitable words.',
    options: ['fill in', 'fill up', 'fill with', 'fill out'],
    correctAnswerIndex: 0,
    explanation: '"Fill in" is the correct phrasal verb for completing a space in a document or text.',
  ),
  Question(
    questionText: 'The new policy will have a positive _____ on the economy.',
    options: ['affect', 'effect', 'impact', 'influence'],
    correctAnswerIndex: 2,
    explanation: 'Impact is the most suitable word here, meaning a powerful effect.',
  ),
  Question(
    questionText: 'The thief was caught _____ handed.',
    options: ['red', 'blue', 'black', 'white'],
    correctAnswerIndex: 0,
    explanation: '"Red-handed" is an idiom meaning to be caught in the act of doing something wrong.',
  ),

  // Idioms and Phrases (Questions 53-62)
  Question(
    questionText: 'Meaning of the idiom: "To beat around the bush".',
    options: ['To avoid the main topic', 'To beat someone with a stick', 'To clean the garden', 'To hide in a bush'],
    correctAnswerIndex: 0,
    explanation: 'To beat around the bush means to avoid getting to the point of a conversation.',
  ),
  Question(
    questionText: 'Meaning of the idiom: "A piece of cake".',
    options: ['A delicious dessert', 'Something very easy', 'A difficult task', 'A piece of bread'],
    correctAnswerIndex: 1,
    explanation: 'A piece of cake is an idiom meaning a task or job that is very easy to do.',
  ),
  Question(
    questionText: 'Meaning of the idiom: "Bite the bullet".',
    options: ['To eat a bullet', 'To get a reward', 'To face a difficult situation with courage', 'To give up'],
    correctAnswerIndex: 2,
    explanation: 'Bite the bullet means to face a difficult or unpleasant situation with courage.',
  ),
  Question(
    questionText: 'Meaning of the idiom: "Break a leg".',
    options: ['To break your leg', 'To wish someone good luck', 'To get injured', 'To fall down'],
    correctAnswerIndex: 1,
    explanation: 'Break a leg is a common idiom used to wish someone good luck, especially before a performance.',
  ),
  Question(
    questionText: 'Meaning of the idiom: "Let the cat out of the bag".',
    options: ['To allow a cat to escape', 'To reveal a secret', 'To hide a cat', 'To buy a cat'],
    correctAnswerIndex: 1,
    explanation: 'To let the cat out of the bag means to reveal a secret, usually by accident.',
  ),
  Question(
    questionText: 'Meaning of the idiom: "Cost an arm and a leg".',
    options: ['To be very expensive', 'To buy something cheap', 'To get injured', 'To lose a limb'],
    correctAnswerIndex: 0,
    explanation: 'To cost an arm and a leg means to be very expensive.',
  ),
  Question(
    questionText: 'Meaning of the idiom: "All ears".',
    options: ['Having big ears', 'Listening attentively', 'Not listening', 'Talking loudly'],
    correctAnswerIndex: 1,
    explanation: 'To be all ears means to be listening attentively or eagerly.',
  ),
  Question(
    questionText: 'Meaning of the idiom: "Hit the nail on the head".',
    options: ['To hit a nail with a hammer', 'To get something exactly right', 'To miss the target', 'To fail at a task'],
    correctAnswerIndex: 1,
    explanation: 'To hit the nail on the head means to describe exactly what is causing a situation or problem.',
  ),
  Question(
    questionText: 'Meaning of the idiom: "A dime a dozen".',
    options: ['Something very rare', 'Something common and of little value', 'Something expensive', 'Something unique'],
    correctAnswerIndex: 1,
    explanation: 'A dime a dozen means something is very common and therefore of little value.',
  ),
  Question(
    questionText: 'Meaning of the idiom: "To carry the can".',
    options: ['To carry a container', 'To take responsibility for a mistake', 'To be a leader', 'To be a victim'],
    correctAnswerIndex: 1,
    explanation: 'To carry the can means to take the blame or responsibility for something that has gone wrong.',
  ),

  // Spelling Correction (Questions 63-72)
  Question(
    questionText: 'Find the correctly spelled word.',
    options: ['Separate', 'Seperate', 'Seperatte', 'Separrate'],
    correctAnswerIndex: 0,
    explanation: 'The correct spelling is "separate".',
  ),
  Question(
    questionText: 'Find the correctly spelled word.',
    options: ['Accomodate', 'Acommodate', 'Accommodate', 'Acomodate'],
    correctAnswerIndex: 2,
    explanation: 'The correct spelling is "accommodate" (with two "c"s and two "m"s).',
  ),
  Question(
    questionText: 'Find the correctly spelled word.',
    options: ['Definately', 'Definitely', 'Definitly', 'Definetely'],
    correctAnswerIndex: 1,
    explanation: 'The correct spelling is "definitely".',
  ),
  Question(
    questionText: 'Find the correctly spelled word.',
    options: ['Buisness', 'Business', 'Bussiness', 'Busines'],
    correctAnswerIndex: 1,
    explanation: 'The correct spelling is "business".',
  ),
  Question(
    questionText: 'Find the correctly spelled word.',
    options: ['Occasion', 'Ocassion', 'Occassion', 'Ocasian'],
    correctAnswerIndex: 0,
    explanation: 'The correct spelling is "occasion".',
  ),
  Question(
    questionText: 'Find the correctly spelled word.',
    options: ['Cemetery', 'Cemetry', 'Cemetary', 'Cemiterry'],
    correctAnswerIndex: 0,
    explanation: 'The correct spelling is "cemetery".',
  ),
  Question(
    questionText: 'Find the correctly spelled word.',
    options: ['Maintenance', 'Maintanance', 'Maintenence', 'Maintaenance'],
    correctAnswerIndex: 0,
    explanation: 'The correct spelling is "maintenance".',
  ),
  Question(
    questionText: 'Find the correctly spelled word.',
    options: ['Necessary', 'Neccessary', 'Necassary', 'Necessery'],
    correctAnswerIndex: 0,
    explanation: 'The correct spelling is "necessary" (one "c", two "s"s).',
  ),
  Question(
    questionText: 'Find the correctly spelled word.',
    options: ['Privilege', 'Priviledge', 'Privelege', 'Privilage'],
    correctAnswerIndex: 0,
    explanation: 'The correct spelling is "privilege".',
  ),
  Question(
    questionText: 'Find the correctly spelled word.',
    options: ['Recommendation', 'Recomendation', 'Reccomendation', 'Reccommendation'],
    correctAnswerIndex: 0,
    explanation: 'The correct spelling is "recommendation".',
  ),

  // Sentence Improvement / Correction (Questions 73-82)
  Question(
    questionText: 'I would rather die than to beg.',
    options: ['than to begging', 'than beg', 'to beg', 'No improvement'],
    correctAnswerIndex: 1,
    explanation: 'The correct structure with "would rather" is "would rather [verb] than [verb]". The phrase "to beg" should be replaced with "beg".',
  ),
  Question(
    questionText: 'She is taller than any other girl in her class.',
    options: ['any girl', 'all girls', 'all other girls', 'No improvement'],
    correctAnswerIndex: 3,
    explanation: 'The sentence is grammatically correct. The comparative form "taller than" is correctly used with "any other girl" to compare her to the rest of the group.',
  ),
  Question(
    questionText: 'He has been absent since Monday.',
    options: ['from Monday', 'for Monday', 'on Monday', 'No improvement'],
    correctAnswerIndex: 3,
    explanation: 'The use of "since" to refer to a specific starting point in time is correct. "Has been absent" is the correct tense. Thus, there is no improvement needed.',
  ),
  Question(
    questionText: 'The doctor advised him to give up the habit of smoking.',
    options: ['to give up smoking', 'to giving up smoking', 'for giving up smoking', 'No improvement'],
    correctAnswerIndex: 0,
    explanation: 'The phrase "the habit of" is redundant. The sentence can be simplified to "give up smoking".',
  ),
  Question(
    questionText: 'Had she worked hard, she would have passed the exam.',
    options: ['If she worked hard', 'If she would have worked hard', 'She had worked hard', 'No improvement'],
    correctAnswerIndex: 3,
    explanation: 'This is a third conditional sentence, and the inverted form "Had she worked hard" is grammatically correct. No improvement is needed.',
  ),
  Question(
    questionText: 'I was surprised to hear that he is going to his brother\'s wedding.',
    options: ['will be going', 'was going', 'is to go', 'No improvement'],
    correctAnswerIndex: 1,
    explanation: 'The main clause "I was surprised" is in the past tense. The subordinate clause should also be in the past tense to maintain consistency. The correct phrase is "he was going".',
  ),
  Question(
    questionText: 'He insisted on my going there.',
    options: ['that I go there', 'that I went there', 'that I should go there', 'No improvement'],
    correctAnswerIndex: 3,
    explanation: 'The use of the possessive pronoun "my" followed by the gerund "going" is a grammatically correct structure. No improvement is needed.',
  ),
  Question(
    questionText: 'No sooner did he arrive than his father left for the office.',
    options: ['as soon as he arrived', 'he had no sooner arrived', 'did he no sooner arrive', 'No improvement'],
    correctAnswerIndex: 3,
    explanation: 'The structure "No sooner did [subject] [verb] than [subject] [verb]" is the correct and standard usage. No improvement is needed.',
  ),
  Question(
    questionText: 'He behaved as if he was mad.',
    options: ['as if he were mad', 'as if he is mad', 'as if he had been mad', 'No improvement'],
    correctAnswerIndex: 0,
    explanation: 'In conditional clauses beginning with "as if" or "as though" that express an unreal or hypothetical situation, the subjunctive mood is used. The correct verb is "were" for all subjects. The correct phrase is "as if he were mad".',
  ),
  Question(
    questionText: 'She has a lovely voice, is she not?',
    options: ['hasn\'t she?', 'doesn\'t she?', 'isn\'t she?', 'No improvement'],
    correctAnswerIndex: 2,
    explanation: 'The question tag must agree with the verb of the main clause. The main clause "She has a lovely voice" uses the verb "is" implicitly in its structure. The correct tag question is "isn\'t she?".',
  ),

  // Sentence Arrangement (Questions 83-92)
  Question(
    questionText: 'Arrange the following parts to form a meaningful sentence: \n(P) the government will\n(Q) take action against\n(R) the officials who\n(S) are responsible for the delay',
    options: ['PQRS', 'PSQR', 'QSRP', 'RSPQ'],
    correctAnswerIndex: 0,
    explanation: 'The correct order is P-Q-R-S, which forms the sentence: "The government will take action against the officials who are responsible for the delay."',
  ),
  Question(
    questionText: 'Arrange the following parts to form a meaningful sentence: \n(P) a beautiful garden\n(Q) the house has\n(R) in front of it\n(S) with many flowers',
    options: ['QPRS', 'QSRP', 'PRQS', 'SRPQ'],
    correctAnswerIndex: 0,
    explanation: 'The correct order is Q-P-R-S, which forms the sentence: "The house has a beautiful garden in front of it with many flowers."',
  ),
  Question(
    questionText: 'Arrange the following parts to form a meaningful sentence: \n(P) is known for its\n(Q) this region of India\n(R) beautiful landscapes\n(S) and diverse culture',
    options: ['QPRS', 'RQPS', 'SQPR', 'PSQR'],
    correctAnswerIndex: 0,
    explanation: 'The correct order is Q-P-R-S, which forms the sentence: "This region of India is known for its beautiful landscapes and diverse culture."',
  ),
  Question(
    questionText: 'Arrange the following parts to form a meaningful sentence: \n(P) when he returned\n(Q) he was very happy\n(R) from his long journey\n(S) to see his family',
    options: ['QPSR', 'QRSP', 'PQRS', 'PRSQ'],
    correctAnswerIndex: 1,
    explanation: 'The correct order is Q-R-S-P, which forms the sentence: "He was very happy when he returned from his long journey to see his family."',
  ),
  Question(
    questionText: 'Arrange the following parts to form a meaningful sentence: \n(P) we must protect\n(Q) the environment\n(R) for future generations\n(S) from pollution',
    options: ['PQSR', 'PSQR', 'QSPR', 'RSPQ'],
    correctAnswerIndex: 0,
    explanation: 'The correct order is P-Q-S-R, which forms the sentence: "We must protect the environment from pollution for future generations."',
  ),
  Question(
    questionText: 'Arrange the following parts to form a meaningful sentence: \n(P) the new law will\n(Q) make it easier\n(R) for small businesses\n(S) to get loans',
    options: ['PQRS', 'QRSP', 'RSQP', 'SRPQ'],
    correctAnswerIndex: 0,
    explanation: 'The correct order is P-Q-R-S, which forms the sentence: "The new law will make it easier for small businesses to get loans."',
  ),
  Question(
    questionText: 'Arrange the following parts to form a meaningful sentence: \n(P) the book is\n(Q) on the table\n(R) which I bought\n(S) yesterday',
    options: ['PQRS', 'PRQS', 'PSQR', 'QSRP'],
    correctAnswerIndex: 1,
    explanation: 'The correct order is P-R-Q-S, which forms the sentence: "The book which I bought yesterday is on the table."',
  ),
  Question(
    questionText: 'Arrange the following parts to form a meaningful sentence: \n(P) he told me\n(Q) that he was going\n(R) to the market\n(S) with his friend',
    options: ['PQRS', 'PRSQ', 'QSRP', 'RSPQ'],
    correctAnswerIndex: 0,
    explanation: 'The correct order is P-Q-R-S, which forms the sentence: "He told me that he was going to the market with his friend."',
  ),
  Question(
    questionText: 'Arrange the following parts to form a meaningful sentence: \n(P) the company has\n(Q) implemented a new policy\n(R) to improve employee morale\n(S) and productivity',
    options: ['PQRS', 'PRSQ', 'QSRP', 'RSPQ'],
    correctAnswerIndex: 0,
    explanation: 'The correct order is P-Q-R-S, which forms the sentence: "The company has implemented a new policy to improve employee morale and productivity."',
  ),
  Question(
    questionText: 'Arrange the following parts to form a meaningful sentence: \n(P) it is important\n(Q) to maintain a healthy diet\n(R) and exercise regularly\n(S) for a long life',
    options: ['PQRS', 'QPRS', 'RSQP', 'PSQR'],
    correctAnswerIndex: 0,
    explanation: 'The correct order is P-Q-R-S, which forms the sentence: "It is important to maintain a healthy diet and exercise regularly for a long life."',
  ),

  // Vocabulary & Grammar Mix (Questions 93-102)
  Question(
    questionText: 'Choose the word that is opposite in meaning to "hostile".',
    options: ['Friendly', 'Aggressive', 'Violent', 'Angry'],
    correctAnswerIndex: 0,
    explanation: 'Hostile means unfriendly or antagonistic. The opposite is "friendly".',
  ),
  Question(
    questionText: 'He has a knack _____ making people laugh.',
    options: ['for', 'at', 'with', 'in'],
    correctAnswerIndex: 0,
    explanation: 'The correct preposition is "for". "A knack for something" means a skill or ability to do something easily.',
  ),
  Question(
    questionText: 'The project was completed _____ the deadline.',
    options: ['in', 'on', 'before', 'with'],
    correctAnswerIndex: 2,
    explanation: '"Before" the deadline is the most fitting preposition to show that the task was finished ahead of time.',
  ),
  Question(
    questionText: 'She is suffering _____ a serious illness.',
    options: ['by', 'from', 'with', 'of'],
    correctAnswerIndex: 1,
    explanation: 'The correct preposition with "suffering" is "from".',
  ),
  Question(
    questionText: 'The committee members _____ their final decision yesterday.',
    options: ['took', 'made', 'arrived', 'reached'],
    correctAnswerIndex: 1,
    explanation: '"Made" is the correct verb to use with "decision" in this context. "Made a decision" is a common collocation.',
  ),
  Question(
    questionText: 'Choose the correct sentence.',
    options: [
      'The house needs to be paint.',
      'The house needs to be painted.',
      'The house needs painting.',
      'Both B and C are correct.'
    ],
    correctAnswerIndex: 3,
    explanation: 'Both "The house needs to be painted" and "The house needs painting" are grammatically correct and convey the same meaning.',
  ),
  Question(
    questionText: 'The dog was punished _____ he barked at the guests.',
    options: ['so', 'because', 'but', 'and'],
    correctAnswerIndex: 1,
    explanation: '"Because" is the correct conjunction to introduce a reason for the punishment.',
  ),
  Question(
    questionText: 'Choose the word that means "a person who is always hopeful".',
    options: ['Pessimist', 'Optimist', 'Cynic', 'Realist'],
    correctAnswerIndex: 1,
    explanation: 'An optimist is a person who tends to be hopeful and confident about the future.',
  ),
  Question(
    questionText: 'The meeting was postponed _____ a later date.',
    options: ['at', 'for', 'to', 'on'],
    correctAnswerIndex: 2,
    explanation: 'The correct preposition with "postponed" is "to". "Postponed to a later date" is the standard phrase.',
  ),
  Question(
    questionText: 'Choose the correct form of the verb: "The jury _____ divided in their opinion."',
    options: ['was', 'were', 'is', 'has been'],
    correctAnswerIndex: 1,
    explanation: 'When a collective noun like "jury" is seen as a group of individuals acting separately, the plural verb "were" is used.',
  ),
  
  // -------------------- Additional 20 Questions (Complex) --------------------

  // Paragraph-like Questions (Questions 103-104)
  Question(
    questionText: 'Read the following paragraph and answer the question: \n\nScience is an ever-evolving field. From the ancient Greeks\' observation of the stars to the modern-day exploration of genetics and quantum physics, human curiosity has been the driving force behind every major discovery. It is through rigorous experimentation and critical analysis that theories are tested and refined, leading to a deeper understanding of the world around us. What is the main idea of the paragraph?',
    options: [
      'Science is the study of ancient civilizations.',
      'Human curiosity is the main driver of scientific discovery.',
      'The process of scientific discovery is simple and straightforward.',
      'Modern science is superior to ancient science.'
    ],
    correctAnswerIndex: 1,
    explanation: 'The paragraph highlights that "human curiosity has been the driving force" behind discoveries, making this the central theme.',
  ),
  Question(
    questionText: 'Based on the previous paragraph, what is a key part of the scientific process?',
    options: [
      'Ignoring existing theories.',
      'Accepting theories without proof.',
      'Relying solely on ancient observations.',
      'Rigorous experimentation and critical analysis.'
    ],
    correctAnswerIndex: 3,
    explanation: 'The paragraph explicitly states that "It is through rigorous experimentation and critical analysis that theories are tested and refined."',
  ),
  
  // Statement-like Questions (Questions 105-106)
  Question(
    questionText: 'Statement: A is taller than B. C is taller than A. D is taller than C. Who is the tallest?',
    options: ['A', 'B', 'C', 'D'],
    correctAnswerIndex: 3,
    explanation: 'Based on the given statements, the order of height is B < A < C < D. Therefore, D is the tallest.',
  ),
  Question(
    questionText: 'Statement: All dogs are mammals. Some mammals are aquatic. Conclusion: What can be inferred from these statements?',
    options: [
      'All dogs are aquatic.',
      'Some dogs are aquatic.',
      'All aquatic mammals are dogs.',
      'No conclusion can be drawn about dogs and aquatic animals.'
    ],
    correctAnswerIndex: 3,
    explanation: 'The statements only establish a relationship between dogs and mammals, and some mammals and aquatic animals. There is no direct link to infer a relationship between dogs and aquatic animals.',
  ),

  // Match the Columns (Questions 107-108)
  Question(
    questionText: 'Match the following words with their correct meanings: \n\nColumn A: \n1. Abide by \n2. Account for \n3. Call off \n\nColumn B: \n(i) To explain the reason for something \n(ii) To obey or follow a rule \n(iii) To cancel \n\nChoose the correct pairing.',
    options: [
      '1-(ii), 2-(i), 3-(iii)',
      '1-(i), 2-(ii), 3-(iii)',
      '1-(iii), 2-(i), 3-(ii)',
      '1-(ii), 2-(iii), 3-(i)'
    ],
    correctAnswerIndex: 0,
    explanation: 'The correct pairings are: Abide by means to obey, Account for means to explain, and Call off means to cancel. Thus, 1-(ii), 2-(i), 3-(iii) is the correct option.',
  ),
  Question(
    questionText: 'Match the following idioms with their meanings: \n\nColumn A: \n1. To turn over a new leaf \n2. In a nutshell \n3. A storm in a teacup \n\nColumn B: \n(i) A lot of fuss about something small \n(ii) To make a fresh start \n(iii) To be brief and concise \n\nChoose the correct pairing.',
    options: [
      '1-(i), 2-(ii), 3-(iii)',
      '1-(ii), 2-(iii), 3-(i)',
      '1-(iii), 2-(i), 3-(ii)',
      '1-(i), 2-(iii), 3-(ii)'
    ],
    correctAnswerIndex: 1,
    explanation: 'The correct pairings are: To turn over a new leaf means to make a fresh start, In a nutshell means to be brief, and A storm in a teacup means a lot of fuss about something small. Thus, 1-(ii), 2-(iii), 3-(i) is the correct option.',
  ),
  
  // Fill in the Blanks (Questions 109-122)
  Question(
    questionText: 'He has been absent _____ the day before yesterday.',
    options: ['for', 'since', 'from', 'on'],
    correctAnswerIndex: 1,
    explanation: '"Since" is used to denote a specific point in time from which an action has continued.',
  ),
  Question(
    questionText: 'The baby was fast asleep when the mother _____ in.',
    options: ['came', 'was coming', 'comes', 'had come'],
    correctAnswerIndex: 0,
    explanation: 'The past tense "came" is the correct verb form to match the past tense of "was asleep".',
  ),
  Question(
    questionText: 'She is capable _____ winning the race.',
    options: ['at', 'of', 'in', 'with'],
    correctAnswerIndex: 1,
    explanation: 'The correct preposition after "capable" is "of".',
  ),
  Question(
    questionText: 'The thief broke _____ the house and stole the valuables.',
    options: ['up', 'into', 'down', 'with'],
    correctAnswerIndex: 1,
    explanation: '"Broke into" is the correct phrasal verb meaning to enter a building illegally.',
  ),
  Question(
    questionText: 'The more you study, the _____ you will learn.',
    options: ['more', 'much', 'many', 'most'],
    correctAnswerIndex: 0,
    explanation: 'The parallel structure "the more... the more" is the correct grammatical form for this type of comparison.',
  ),
  Question(
    questionText: 'I would rather starve than _____ a beggar.',
    options: ['become', 'to become', 'became', 'becoming'],
    correctAnswerIndex: 0,
    explanation: 'After "would rather... than", the verb should be in the bare infinitive form ("become").',
  ),
  Question(
    questionText: 'He is an expert _____ mathematics.',
    options: ['in', 'at', 'with', 'on'],
    correctAnswerIndex: 0,
    explanation: 'The correct preposition is "in" when referring to a subject of study. One is an expert "in" a subject.',
  ),
  Question(
    questionText: 'The firemen managed to put _____ the fire.',
    options: ['out', 'up', 'off', 'in'],
    correctAnswerIndex: 0,
    explanation: '"Put out" is a phrasal verb meaning to extinguish a fire.',
  ),
  Question(
    questionText: 'The train had left before I _____ the station.',
    options: ['reached', 'was reaching', 'had reached', 'reach'],
    correctAnswerIndex: 0,
    explanation: 'This sentence uses the past perfect ("had left") for the first action and the simple past ("reached") for the second, which is the correct sequence of tenses.',
  ),
  Question(
    questionText: 'The judge acquitted him _____ all the charges.',
    options: ['from', 'of', 'for', 'with'],
    correctAnswerIndex: 1,
    explanation: 'The correct preposition with "acquitted" is "of".',
  ),
  Question(
    questionText: 'The teacher praised her _____ her hard work.',
    options: ['for', 'on', 'with', 'at'],
    correctAnswerIndex: 0,
    explanation: 'The correct preposition to show the reason for the praise is "for".',
  ),
  Question(
    questionText: 'She is not accustomed _____ such cold weather.',
    options: ['to', 'with', 'for', 'of'],
    correctAnswerIndex: 0,
    explanation: 'The correct preposition with "accustomed" is "to".',
  ),
  Question(
    questionText: 'The company needs to invest more _____ training its employees.',
    options: ['on', 'with', 'in', 'for'],
    correctAnswerIndex: 2,
    explanation: 'The correct preposition with "invest" is "in".',
  ),
  Question(
    questionText: 'The project will be completed _____ two years.',
    options: ['in', 'within', 'by', 'on'],
    correctAnswerIndex: 1,
    explanation: '"Within" is the best option to convey that the project will be completed sometime inside the time frame of two years.',
  ),
];

// lib/data/ib_acio/study_material_data.dart

/// A class to represent a single study topic with its content.
class StudyTopic {
  final String title;
  final String content;

  const StudyTopic({required this.title, required this.content});
}

/// A map that holds all the study material for the IB-ACIO exam,
/// organized by subject. Each subject contains a list of topics.
final Map<String, List<StudyTopic>> ibAcioStudyMaterial = {
  'General Awareness': [
    const StudyTopic(
      title: 'National and International Affairs',
      content:
          'This section covers recent events of national and international importance. Key areas include political developments, major government schemes, international treaties, summits, and significant global events. Students should follow major news sources daily to stay updated.',
    ),
    const StudyTopic(
      title: 'History of India',
      content:
          'Focuses on ancient, medieval, and modern Indian history. Important topics include the Indus Valley Civilization, the Vedic period, major empires like the Mauryas and Guptas, the Sultanate period, the Mughal empire, the arrival of Europeans, the British Raj, and the Indian freedom struggle.',
    ),
    const StudyTopic(
      title: 'Indian Polity and Constitution',
      content:
          'Covers the structure and functioning of the Indian government. Key topics include the making of the Constitution, Fundamental Rights and Duties, Directive Principles, the Union and State executive, Parliament and State Legislatures, the Judiciary, and constitutional bodies.',
    ),
  ],
  'Quantitative Aptitude': [
    const StudyTopic(
      title: 'Number System',
      content:
          'This topic includes questions on classification of numbers, divisibility rules, remainders, and properties of integers. A strong foundation in the number system is essential for solving various quantitative problems.',
    ),
    const StudyTopic(
      title: 'Percentage',
      content:
          'Understanding percentages is crucial for topics like Profit and Loss, and Simple and Compound Interest. This section covers basic percentage calculations, percentage change, and applications in real-world scenarios.',
    ),
    const StudyTopic(
      title: 'Time, Speed, and Distance',
      content:
          'This section involves problems related to the motion of objects. Key formulas and concepts include relative speed, problems on trains, and boats and streams. Practice is key to mastering this topic.',
    ),
  ],
  'English Language': [
    const StudyTopic(
      title: 'Reading Comprehension',
      content:
          'This tests the ability to understand and interpret a given passage. Questions can be about the main idea, specific details, vocabulary (synonyms/antonyms from the passage), and inference.',
    ),
    const StudyTopic(
      title: 'Error Spotting',
      content:
          'Candidates are required to find grammatical errors in a given sentence. This requires a good understanding of grammar rules, including subject-verb agreement, tenses, prepositions, articles, and parts of speech.',
    ),
  ],
};

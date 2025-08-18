// lib/data/upsc/upsc_syllabus.dart

/// A data structure to hold the syllabus for the UPSC Civil Services exam.
final Map<String, Map<String, List<String>>> upscSyllabus = {
  'Preliminary Examination': {
    'Paper I: General Studies': [
      'Current events of national and international importance.',
      'History of India and Indian National Movement.',
      'Indian and World Geography - Physical, Social, Economic Geography of India and the World.',
      'Indian Polity and Governance - Constitution, Political System, Panchayati Raj, Public Policy, Rights Issues, etc.',
      'Economic and Social Development - Sustainable Development, Poverty, Inclusion, Demographics, Social Sector initiatives, etc.',
      'General issues on Environmental Ecology, Bio-diversity and Climate Change.',
      'General Science.',
    ],
    'Paper II: CSAT (Civil Services Aptitude Test)': [
      'Comprehension.',
      'Interpersonal skills including communication skills.',
      'Logical reasoning and analytical ability.',
      'Decision-making and problem-solving.',
      'General mental ability.',
      'Basic numeracy (numbers and their relations, orders of magnitude, etc.) (Class X level).',
      'Data interpretation (charts, graphs, tables, data sufficiency etc.) (Class X level).',
    ],
  },
  'Main Examination': {
    'Paper A: Indian Language & Paper B: English (Qualifying)': [
      'Comprehension of given passages.',
      'Precis Writing.',
      'Usage and Vocabulary.',
      'Short Essays.',
      'Translation from English to the Indian language and vice-versa.',
    ],
    'Paper I: Essay': [
      'Candidates may be required to write essays on multiple topics. They will be expected to keep closely to the subject of the essay to arrange their ideas in an orderly fashion, and to write concisely.',
    ],
    'Paper II: General Studies I': [
      'Indian Heritage and Culture, History and Geography of the World and Society.',
    ],
    'Paper III: General Studies II': [
      'Governance, Constitution, Polity, Social Justice and International relations.',
    ],
    'Paper IV: General Studies III': [
      'Technology, Economic Development, Bio diversity, Environment, Security and Disaster Management.',
    ],
    'Paper V: General Studies IV': [
      'Ethics, Integrity, and Aptitude.',
    ],
    'Paper VI & VII: Optional Subject (Papers I & II)': [
      'Candidates can choose one optional subject from a list of subjects including History, Geography, Public Administration, Sociology, Political Science, Psychology, Law, etc.',
    ],
  },
};

// lib/data/ctet/ctet_syllabus.dart

/// A data structure to hold the syllabus for the CTET exam, organized by Paper.
final Map<String, Map<String, List<String>>> ctetSyllabus = {
  'Paper I (for Classes I to V)': {
    'Child Development and Pedagogy': [
      'Concept of development and its relationship with learning',
      'Principles of the development of children',
      'Influence of Heredity & Environment',
      'Socialization processes',
      'Piaget, Kohlberg and Vygotsky: constructs and critical perspectives',
      'Concepts of child-centered and progressive education',
      'Gender as a social construct',
    ],
    'Language I': [
      'Reading unseen passages',
      'Pedagogy of Language Development',
      'Learning and acquisition',
      'Principles of language Teaching',
      'Role of listening and speaking',
    ],
    'Language II': [
      'Comprehension',
      'Pedagogy of Language Development',
      'Language Skills',
      'Evaluating language comprehension and proficiency',
    ],
    'Mathematics': [
      'Geometry, Shapes & Spatial Understanding',
      'Numbers, Addition and Subtraction, Multiplication, Division',
      'Measurement, Weight, Time, Volume',
      'Data Handling, Patterns, Money',
      'Pedagogical issues',
    ],
    'Environmental Studies': [
      'Family and Friends',
      'Food, Shelter, Water, Travel',
      'Things We Make and Do',
      'Concept and scope of EVS',
      'Significance of EVS, integrated EVS',
    ],
  },
  'Paper II (for Classes VI to VIII)': {
    'Child Development and Pedagogy': [
      'Elementary School Child psychology',
      'Concepts of child-centered and progressive education',
      'Critical perspective of the construct of Intelligence',
      'Assessment and Evaluation',
    ],
    'Language I & II': [
      'Reading unseen passages (prose or drama) and poems',
      'Grammar and verbal ability questions',
      'Pedagogy of Language Development',
    ],
    'Mathematics and Science': [
      'Number System, Algebra, Geometry',
      'Mensuration, Data handling',
      'Food, Materials, The World of the Living',
      'Moving Things People and Ideas, How things work',
      'Natural Phenomena, Natural Resources',
      'Pedagogical issues in Science and Math',
    ],
    'Social Studies/Social Science': [
      'History (When, Where and How, The Earliest Societies, etc.)',
      'Geography (Planet, Globe, Environment, etc.)',
      'Social and Political Life (Diversity, Government, Democracy, etc.)',
      'Pedagogical issues',
    ],
  },
};

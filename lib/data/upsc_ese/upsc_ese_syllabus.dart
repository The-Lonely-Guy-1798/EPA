// lib/data/upsc_ese/upsc_ese_syllabus.dart

/// A data structure to hold the syllabus for the UPSC ESE exam.
final Map<String, Map<String, List<String>>> upscEseSyllabus = {
  'Stage-I: Preliminary Examination': {
    'Paper-I (General Studies and Engineering Aptitude)': [
      'Current issues of national and international importance relating to social, economic and industrial development',
      'Engineering Aptitude covering Logical reasoning and Analytical ability',
      'Engineering Mathematics and Numerical Analysis',
      'General Principles of Design, Drawing, Importance of Safety',
      'Standards and Quality practices in production, construction, maintenance and services',
      'Basics of Energy and Environment: Conservation, environmental pollution and degradation, Climate Change',
      'Basics of Project Management',
      'Basics of Material Science and Engineering',
      'Information and Communication Technologies (ICT) based tools and their applications in engineering',
      'Ethics and values in Engineering profession',
    ],
    'Paper-II (Discipline Specific)': [
      'Civil Engineering: Building Materials, Solid Mechanics, Structural Analysis, Design of Steel Structures, Design of Concrete and Masonry structures, etc.',
      'Mechanical Engineering: Fluid Mechanics, Thermodynamics and Heat transfer, IC Engines, Refrigeration and Air conditioning, Turbo Machinery, etc.',
      'Electrical Engineering: Engineering Mathematics, Electrical Materials, Electric Circuits and Fields, Electrical and Electronic Measurements, etc.',
      'Electronics & Telecommunication Engg: Basic Electronics Engineering, Basic Electrical Engineering, Materials Science, Electronic Measurements and Instrumentation, etc.',
    ],
  },
  'Stage-II: Main Examination': {
    'Discipline Specific Paper-I & Paper-II': [
      'The syllabus for the discipline-specific papers in the Main Examination is similar to that of Paper-II in the Preliminary Examination, but requires a more in-depth and descriptive understanding of the topics.',
    ],
  },
};

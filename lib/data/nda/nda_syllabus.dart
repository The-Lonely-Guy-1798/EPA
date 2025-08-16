// lib/data/nda/nda_syllabus.dart

/// A data structure to hold the syllabus for the NDA exam.
final Map<String, Map<String, List<String>>> ndaSyllabus = {
  'Written Examination': {
    'Paper I: Mathematics': [
      'Algebra: Sets, Venn diagrams, De Morgan laws, Cartesian product, real numbers, complex numbers, modulus, argument, cube roots of unity, binary system of numbers.',
      'Matrices and Determinants: Types of matrices, operations on matrices, determinant of a matrix, basic properties of determinants, adjoin and inverse of a square matrix, applications.',
      'Trigonometry: Angles and their measures in degrees and in radians, trigonometric ratios, trigonometric identities, sum and difference formulae, multiple and sub-multiple angles.',
      'Analytical Geometry of Two and Three Dimensions: Rectangular Cartesian coordinate system, distance formula, equation of a line in various forms, angle between two lines, distance of a point from a line.',
      'Differential Calculus: Concept of a real valued function, domain, range and graph of a function, composite functions, one to one, onto and inverse functions, limit, continuity, derivatives.',
      'Integral Calculus and Differential Equations: Integration as inverse of differentiation, integration by substitution and by parts, standard integrals, definite integrals, formation of ordinary differential equations.',
      'Vector Algebra: Vectors in two and three dimensions, magnitude and direction of a vector, unit and null vectors, addition of vectors, scalar multiplication of a vector.',
      'Statistics and Probability: Statistics (classification of data, frequency distribution), Probability (random experiment, outcomes, sample space, events).',
    ],
    'Paper II: General Ability Test (GAT)': [
      'Part A - English: Grammar and usage, vocabulary, comprehension, and cohesion in extended text to test the candidate’s proficiency in English.',
      'Part B - General Knowledge: Physics, Chemistry, General Science, History, Freedom Movement, Geography, and Current Events.',
    ],
  },
};

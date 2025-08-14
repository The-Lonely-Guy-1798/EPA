// lib/data/gate/gate_syllabus.dart

/// A data structure to hold the detailed syllabus for the GATE exam.
/// The syllabus is organized by subject sections, including common papers and
/// specific engineering disciplines.
final Map<String, Map<String, List<String>>> gateSyllabus = {
  'GATE Syllabus': {
    'General Aptitude (Common to all papers)': [
      'Verbal Ability: English grammar, sentence completion, verbal analogies, word groups, instructions, critical reasoning, and verbal deduction.',
      'Numerical Ability: Numerical computation, numerical estimation, numerical reasoning, and data interpretation.',
    ],
    'Engineering Mathematics (Common to most engineering papers)': [
      'Linear Algebra: Matrix algebra, systems of linear equations, eigenvalues, and eigenvectors.',
      'Calculus: Functions of a single variable, limit, continuity, differentiation, mean value theorems, indeterminate forms, evaluation of definite and improper integrals, partial derivatives, total derivative, maxima and minima, gradient, divergence and curl, vector identities, directional derivatives, line, surface, and volume integrals, Stokes, Gauss and Green’s theorems.',
      'Differential Equations: First order equations (linear and nonlinear), higher-order linear differential equations with constant coefficients, Euler-Cauchy equation, initial and boundary value problems, Laplace transforms, solutions of heat, wave, and Laplace\'s equations.',
      'Complex Variables: Analytic functions, Cauchy-Riemann equations, Cauchy’s integral theorem and integral formula, Taylor and Laurent series.',
      'Probability and Statistics: Definitions of probability, sampling theorems, conditional probability, mean, median, mode, standard deviation, random variables, binomial, Poisson, and normal distributions.',
    ],
    'Computer Science & Information Technology (CS)': [
      'Digital Logic',
      'Computer Organization and Architecture',
      'Programming and Data Structures',
      'Algorithms',
      'Theory of Computation',
      'Compiler Design',
      'Operating System',
      'Databases',
      'Computer Networks',
    ],
    'Mechanical Engineering (ME)': [
      'Engineering Mechanics',
      'Mechanics of Materials',
      'Theory of Machines',
      'Vibrations',
      'Machine Design',
      'Fluid Mechanics',
      'Heat-Transfer',
      'Thermodynamics',
      'Engineering Materials',
      'Casting, Forming and Joining Processes',
      'Machining and Machine Tool Operations',
      'Metrology and Inspection',
      'Computer Integrated Manufacturing',
      'Production Planning and Control',
      'Inventory Control',
      'Operations Research',
    ],
    'Civil Engineering (CE)': [
      'Structural Engineering: Engineering Mechanics, Solid Mechanics, Structural Analysis, Construction Materials and Management, Concrete Structures, Steel Structures.',
      'Geotechnical Engineering: Soil Mechanics, Foundation Engineering.',
      'Water Resources Engineering: Fluid Mechanics, Hydrology, Irrigation.',
      'Environmental Engineering: Water and Waste Water, Air Pollution, Municipal Solid Wastes, Noise Pollution.',
      'Transportation Engineering: Transportation Infrastructure, Highway Pavements, Traffic Engineering.',
      'Geomatics Engineering: Principles of surveying, photogrammetry, and remote sensing.',
    ],
    'Electrical Engineering (EE)': [
      'Electric Circuits',
      'Electromagnetic Fields',
      'Signals and Systems',
      'Electrical Machines',
      'Power Systems',
      'Control Systems',
      'Electrical and Electronic Measurements',
      'Analog and Digital Electronics',
      'Power Electronics',
    ],
    'Electronics and Communication Engineering (EC)': [
      'Networks, Signals and Systems',
      'Electronic Devices',
      'Analog Circuits',
      'Digital Circuits',
      'Control Systems',
      'Communications',
      'Electromagnetics',
    ],
  },
};

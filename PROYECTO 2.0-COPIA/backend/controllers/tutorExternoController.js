const Comentario = require('../models/Comentario');
// Datos simulados en memoria
let asignaciones = [
  {
    _id: '1',
    tutorExterno: {
      _id: 'tutor1', nombre: 'Juan Tutor', email: 'juan.tutor@empresa.com'
    },
    estudiante: {
      _id: 'estu1', nombre: 'Ana Estudiante', email: 'ana.estudiante@espoch.edu.ec', carrera: 'Ingeniería', semestre: '7'
    },
    empresa: 'Empresa Ejemplo',
    area: 'Recursos Humanos',
    comentarios: [
      { texto: 'Buen desempeño en la primera semana.', fecha: new Date(), archivo: null }
    ]
  }
];

// Listar estudiantes asignados a un tutor externo
exports.getAssignedStudents = (req, res) => {
  // Simula que el tutor con _id 'tutor1' está logueado
  const tutorId = 'tutor1';
  const asignados = asignaciones.filter(a => a.tutorExterno._id === tutorId).map(a => ({
    _id: a._id,
    estudiante: a.estudiante,
    empresa: a.empresa,
    area: a.area
  }));
  res.json(asignados);
};

// Obtener comentarios de una asignación (desde BD)
exports.getComentarios = async (req, res) => {
  const { assignmentId } = req.params;
  try {
    const comentarios = await Comentario.findAll({ where: { assignmentId: parseInt(assignmentId) } });
    res.json(comentarios);
  } catch (error) {
    res.status(500).json({ error: 'Error al obtener comentarios', details: error.message });
  }
};

// Agregar comentario con archivo adjunto (ahora en BD)
exports.addComment = async (req, res) => {
  const { assignmentId } = req.params;
  const { texto } = req.body;
  let archivo = null;
  if (req.file) archivo = req.file.filename;

  try {
    await Comentario.create({
      texto,
      fecha: new Date(),
      archivo,
      assignmentId: parseInt(assignmentId)
    });
    res.json({ message: 'Comentario agregado correctamente' });
  } catch (error) {
    res.status(500).json({ error: 'Error al guardar el comentario', details: error.message });
  }
}; 
const express = require('express');
const router = express.Router();
const tutorExternoController = require('../controllers/tutorExternoController');
const multer = require('multer');
const path = require('path');
const User = require('../models/User');
const TutorAssignment = require('../models/TutorAssignment');

// Configuración de multer para guardar archivos en /uploads
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, path.join(__dirname, '../uploads'));
  },
  filename: function (req, file, cb) {
    cb(null, Date.now() + '-' + file.originalname);
  }
});
const upload = multer({ storage });

// Middleware de autenticación (asumido)
// const auth = require('../middleware/auth');

// Listar estudiantes asignados al tutor externo
router.get('/asignados', /*auth,*/ tutorExternoController.getAssignedStudents);

// Agregar comentario con archivo adjunto
router.post('/comentario/:assignmentId', /*auth,*/ upload.single('archivo'), tutorExternoController.addComment);

// Ruta temporal para insertar datos de prueba
router.post('/insertar-prueba', async (req, res) => {
  try {
    // Crear tutor externo
    let tutor = await User.findOne({ email: 'juan.tutor@empresa.com' });
    if (!tutor) {
      tutor = new User({
        nombre: 'Juan Tutor',
        email: 'juan.tutor@empresa.com',
        password: '123456', // En producción, hashear
        rol: 'TutorExterno'
      });
      await tutor.save();
    }
    // Buscar estudiante existente
    let estudiante = await User.findOne({ email: 'ana.estudiante@espoch.edu.ec' });
    if (!estudiante) {
      return res.status(404).json({ error: 'El estudiante ana.estudiante@espoch.edu.ec no existe' });
    }
    // Crear asignación
    let asignacion = await TutorAssignment.findOne({ tutorExterno: tutor._id, estudiante: estudiante._id });
    if (!asignacion) {
      asignacion = new TutorAssignment({
        tutorExterno: tutor._id,
        estudiante: estudiante._id,
        empresa: 'Empresa Ejemplo',
        area: 'Recursos Humanos',
        comentarios: []
      });
      await asignacion.save();
    }
    res.json({ message: 'Datos de prueba insertados', tutor, estudiante, asignacion });
  } catch (error) {
    res.status(500).json({ error: 'Error al insertar datos de prueba', details: error.message });
  }
});

// Obtener comentarios de una asignación (mock)
router.get('/asignados/:assignmentId/comentarios', tutorExternoController.getComentarios);

module.exports = router; 
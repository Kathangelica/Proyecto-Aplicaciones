const express = require('express');
const router = express.Router();
const teacherController = require('../controllers/teacherController');

// Obtener estudiantes asignados a un docente
router.get('/:teacherId/students', teacherController.getAssignedStudents);

// Obtener tareas de un estudiante
router.get('/student/:studentId/tasks', teacherController.getStudentTasks);

// Evaluar una tarea
router.put('/task/:taskId/evaluate', teacherController.evaluateTask);

module.exports = router; 
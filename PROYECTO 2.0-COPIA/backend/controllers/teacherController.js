const User = require('../models/User');
const Task = require('../models/Task');

// Obtener estudiantes asignados a un docente
exports.getAssignedStudents = async (req, res) => {
  try {
    const students = await User.findAll({ where: { teacher: parseInt(req.params.teacherId) } });
    res.json(students);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

// Obtener tareas de un estudiante
exports.getStudentTasks = async (req, res) => {
  try {
    const tasks = await Task.findAll({ where: { estudiante: parseInt(req.params.studentId) } });
    res.json(tasks);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

// Evaluar una tarea
exports.evaluateTask = async (req, res) => {
  try {
    const { calificacion, observaciones } = req.body;
    const [updated] = await Task.update(
      { calificacion, observaciones, estado: 'evaluada' },
      { where: { id: parseInt(req.params.taskId) } }
    );
    if (!updated) return res.status(404).json({ message: 'Tarea no encontrada' });
    const updatedTask = await Task.findByPk(parseInt(req.params.taskId));
    res.json(updatedTask);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
}; 
const mongoose = require('mongoose');

const TeacherSchema = new mongoose.Schema({
  nombre: { type: String, required: true },
  email: { type: String, required: true, unique: true },
  // Puedes agregar más campos según necesidad, por ejemplo:
  departamento: { type: String },
  telefono: { type: String }
});

module.exports = mongoose.model('Teacher', TeacherSchema); 
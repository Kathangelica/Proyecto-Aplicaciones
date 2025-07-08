const { Sequelize } = require('sequelize');
const User = require('../models/User');
const TutorAssignment = require('../models/TutorAssignment');
const Comentario = require('../models/Comentario');

const sequelize = new Sequelize('PRACTICAS_DB', 'postgres', 'admin', {
  host: 'localhost',
  port: 5432,
  dialect: 'postgres',
  logging: false, // Cambia a true si quieres ver las consultas SQL en consola
});

module.exports = sequelize; 

await User.create({
  nombre: 'Juan',
  email: 'juan@correo.com',
  password: '1234',
  rol: 'Estudiante'
}); 
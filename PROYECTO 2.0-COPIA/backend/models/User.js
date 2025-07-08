const { DataTypes } = require('sequelize');
const sequelize = require('../config/sequelize');

const User = sequelize.define('User', {
  nombre: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  email: {
    type: DataTypes.STRING,
    allowNull: false,
    unique: true,
  },
  password: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  rol: {
    type: DataTypes.ENUM('Estudiante', 'Admin', 'Docente', 'TutorExterno'),
    allowNull: false,
  },
  carrera: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  semestre: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  teacher: {
    type: DataTypes.INTEGER, // referencia a Teacher
    allowNull: true,
  }
}, {
  tableName: 'usuarios', // Asume que la tabla se llama 'usuarios'
  timestamps: false,
});

module.exports = User; 
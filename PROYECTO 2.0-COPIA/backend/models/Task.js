const { DataTypes } = require('sequelize');
const sequelize = require('../config/sequelize');

const Task = sequelize.define('Task', {
  titulo: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  descripcion: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  estudiante: {
    type: DataTypes.INTEGER, // referencia a User
    allowNull: false,
  },
  docente: {
    type: DataTypes.INTEGER, // referencia a Teacher
    allowNull: false,
  },
  fechaEntrega: {
    type: DataTypes.DATE,
    allowNull: true,
  },
  estado: {
    type: DataTypes.ENUM('pendiente', 'entregada', 'evaluada'),
    defaultValue: 'pendiente',
  },
  calificacion: {
    type: DataTypes.FLOAT,
    allowNull: true,
  },
  observaciones: {
    type: DataTypes.STRING,
    allowNull: true,
  }
}, {
  tableName: 'tasks',
  timestamps: false,
});

module.exports = Task; 
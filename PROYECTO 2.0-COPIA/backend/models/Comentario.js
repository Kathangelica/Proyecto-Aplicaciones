const { DataTypes } = require('sequelize');
const sequelize = require('../config/sequelize');

const Comentario = sequelize.define('Comentario', {
  texto: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  fecha: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW,
  },
  archivo: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  assignmentId: {
    type: DataTypes.INTEGER,
    allowNull: false,
  }
}, {
  tableName: 'comentarios',
  timestamps: false,
});

module.exports = Comentario; 
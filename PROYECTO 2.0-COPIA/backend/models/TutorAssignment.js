const { DataTypes } = require('sequelize');
const sequelize = require('../config/sequelize');

const TutorAssignment = sequelize.define('TutorAssignment', {
  tutorExterno: {
    type: DataTypes.INTEGER, // referencia a User
    allowNull: false,
  },
  estudiante: {
    type: DataTypes.INTEGER, // referencia a User
    allowNull: false,
  },
  empresa: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  area: {
    type: DataTypes.STRING,
    allowNull: false,
  }
}, {
  tableName: 'tutor_assignments',
  timestamps: false,
});

module.exports = TutorAssignment; 
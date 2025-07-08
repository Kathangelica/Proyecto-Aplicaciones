const express = require('express');
const cors = require('cors');
const dotenv = require('dotenv');
const tutorExternoRoutes = require('./routes/tutorExterno');
const sequelize = require('./config/sequelize');
const Comentario = require('./models/Comentario');
const User = require('./models/User');
const TutorAssignment = require('./models/TutorAssignment');
const Task = require('./models/Task');

// Configuración de variables de entorno
dotenv.config();

const app = express();

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Ruta de prueba
app.get('/', (req, res) => {
  res.json({ message: 'Bienvenido a la API' });
});

// Test de conexión Sequelize
sequelize.authenticate()
  .then(() => {
    console.log('Conexión exitosa a PostgreSQL con Sequelize');
  })
  .catch(err => {
    console.error('No se pudo conectar a la base de datos:', err);
  });

// Sincronizar modelos principales (solo la primera vez)
User.sync();
TutorAssignment.sync();
Task.sync();
Comentario.sync();

// Manejo de errores
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({
    message: 'Error en el servidor',
    error: process.env.NODE_ENV === 'development' ? err.message : {}
  });
});

// Puerto
const PORT = process.env.PORT || 5000;

// Iniciar servidor
app.use('/api/tutorexterno', tutorExternoRoutes);
app.listen(PORT, () => {
  console.log(`Servidor corriendo en el puerto ${PORT}`);
}); 
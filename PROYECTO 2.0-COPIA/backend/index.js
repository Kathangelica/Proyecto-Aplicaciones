// ... código existente ...
const authRoutes = require('./routes/auth');
const userRoutes = require('./routes/user');
const teacherRoutes = require('./routes/teacher');
const tutorExternoRoutes = require('./routes/tutorExterno');
const sequelize = require('./config/sequelize');
const multer = require('multer');
const Comentario = require('./models/Comentario');

sequelize.authenticate()
  .then(() => {
    console.log('Conexión exitosa a PostgreSQL con Sequelize');
  })
  .catch(err => {
    console.error('No se pudo conectar a la base de datos:', err);
  });

sequelize.sync(); // ¡Cuidado! Esto puede modificar la base si hay diferencias

const upload = multer({ storage });

app.use('/api/auth', authRoutes);
app.use('/api/usuarios', userRoutes);
app.use('/api/teacher', teacherRoutes);
app.use('/api/tutorexterno', tutorExternoRoutes);// ... código existente ...

Comentario.sync(); // Solo la primera vez, luego puedes comentar o quitar esta línea

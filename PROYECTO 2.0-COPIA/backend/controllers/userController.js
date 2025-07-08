const User = require('../models/User');

exports.getUsers = async (req, res) => {
  try {
    const users = await User.findAll();
    res.json(users);
  } catch (error) {
    res.status(500).json({ error: 'Error al obtener usuarios', details: error.message });
  }
};

exports.addUser = async (req, res) => {
  const { nombre, email, password, rol, carrera, semestre, teacher } = req.body;
  try {
    const newUser = await User.create({ nombre, email, password, rol, carrera, semestre, teacher });
    res.status(201).json(newUser);
  } catch (error) {
    res.status(500).json({ error: 'Error al crear usuario', details: error.message });
  }
};

exports.updateUser = async (req, res) => {
  const { id } = req.params;
  const { nombre, email, password, rol, carrera, semestre, teacher } = req.body;
  try {
    const [updated] = await User.update(
      { nombre, email, password, rol, carrera, semestre, teacher },
      { where: { id } }
    );
    if (!updated) return res.status(404).json({ message: 'Usuario no encontrado' });
    const updatedUser = await User.findByPk(id);
    res.json(updatedUser);
  } catch (error) {
    res.status(500).json({ error: 'Error al actualizar usuario', details: error.message });
  }
};

exports.deleteUser = async (req, res) => {
  const { id } = req.params;
  try {
    const deleted = await User.destroy({ where: { id } });
    if (!deleted) return res.status(404).json({ message: 'Usuario no encontrado' });
    res.json({ message: 'Usuario eliminado' });
  } catch (error) {
    res.status(500).json({ error: 'Error al eliminar usuario', details: error.message });
  }
}; 
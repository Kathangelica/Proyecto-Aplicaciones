const express = require('express');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const router = express.Router();
const User = require('../models/User'); // Suponiendo que tienes un modelo de Usuario

// Ruta de inicio de sesión
router.post('/login', async (req, res) => {
    const { username, password } = req.body;
    try {
        const user = await User.findOne({ username });
        if (!user) return res.status(400).json({ message: 'Credenciales inválidas' });

        const isMatch = await bcrypt.compare(password, user.password);
        if (!isMatch) return res.status(400).json({ message: 'Credenciales inválidas' });

        const token = jwt.sign({ id: user.id }, process.env.JWT_SECRET, { expiresIn: '1h' });
        res.json({ token });
    } catch (err) {
        res.status(500).json({ message: 'Error del servidor' });
    }
});

// Ruta de registro de usuario
router.post('/register', async (req, res) => {
    const { nombre, email, password, rol, carrera, semestre, teacher } = req.body;
    try {
        // Verifica si el usuario ya existe
        const existingUser = await User.findOne({ email });
        if (existingUser) {
            return res.status(400).json({ message: 'El usuario ya existe' });
        }
        // Hashea la contraseña
        const hashedPassword = await bcrypt.hash(password, 10);
        // Crea el usuario
        const newUser = new User({ nombre, email, password: hashedPassword, rol, carrera, semestre, teacher });
        await newUser.save();
        res.status(201).json({ message: 'Usuario registrado exitosamente' });
    } catch (err) {
        res.status(500).json({ message: 'Error del servidor' });
    }
});

module.exports = router;
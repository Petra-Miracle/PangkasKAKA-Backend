import authService from '../services/authService.js';

class AuthController {
  async register(req, res) {
    try {
      const result = await authService.register(req.body);
      res.status(201).json(result);
    } catch (error) {
      res.status(400).json({ message: error.message });
    }
  }

  async login(req, res) {
    try {
      const { email, password } = req.body;
      const result = await authService.login(email, password);
      res.json(result);
    } catch (error) {
      res.status(401).json({ message: error.message });
    }
  }

  async me(req, res) {
    // req.user comes from authMiddleware
    res.json({ user: req.user });
  }

  async updateProfile(req, res) {
    try {
      const userId = req.user.id;
      const updatedUser = await authService.updateProfile(userId, req.body);
      res.json({ 
        message: 'Profile updated successfully',
        user: updatedUser 
      });
    } catch (error) {
      res.status(400).json({ message: error.message });
    }
  }
}

export default new AuthController();

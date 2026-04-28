import barberService from '../services/barberService.js';

class BarberController {
  async getBarbers(req, res) {
    try {
      const { lat, lng } = req.query;
      const barbers = await barberService.getNearbyBarbers(
        lat ? parseFloat(lat) : null,
        lng ? parseFloat(lng) : null
      );
      res.json(barbers);
    } catch (error) {
      res.status(500).json({ message: error.message });
    }
  }
}

export default new BarberController();

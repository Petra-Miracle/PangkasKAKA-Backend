import express from 'express';
import barberController from '../controllers/barberController.js';

const router = express.Router();

// GET /api/barbershops?lat=-10.1&lng=123.6
router.get('/', barberController.getBarbers);

export default router;

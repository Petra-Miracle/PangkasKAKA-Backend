import express from 'express';
import orderController from '../controllers/orderController.js';

const router = express.Router();

// POST /api/orders - Create new booking
router.post('/', orderController.createOrder);

// GET /api/orders/:id - Get order details
router.get('/:id', orderController.getOrder);

// POST /api/orders/:id/pay - QRIS Payment Simulation
router.post('/:id/pay', orderController.payOrder);

export default router;

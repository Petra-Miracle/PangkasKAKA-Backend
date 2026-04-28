import orderService from '../services/orderService.js';

class OrderController {
  async createOrder(req, res) {
    try {
      const order = await orderService.createNewOrder(req.body);
      res.status(201).json(order);
    } catch (error) {
      res.status(500).json({ message: error.message });
    }
  }

  async getOrder(req, res) {
    try {
      const order = await orderService.getOrderDetails(req.params.id);
      if (!order) return res.status(404).json({ message: 'Order not found' });
      res.json(order);
    } catch (error) {
      res.status(500).json({ message: error.message });
    }
  }

  async payOrder(req, res) {
    try {
      const result = await orderService.processPaymentSimulation(req.params.id);
      res.json(result);
    } catch (error) {
      const status = error.message === 'Order not found' ? 404 : 500;
      res.status(status).json({ message: error.message });
    }
  }
}

export default new OrderController();

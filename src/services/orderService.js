import orderRepository from '../repositories/orderRepository.js';

class OrderService {
  async createNewOrder(orderData) {
    return await orderRepository.createOrder(orderData);
  }

  async getOrderDetails(id) {
    return await orderRepository.getOrderById(id);
  }

  // Simulation of QRIS Payment Integration
  async processPaymentSimulation(orderId) {
    const order = await orderRepository.getOrderById(orderId);
    if (!order) {
      throw new Error('Order not found');
    }

    if (order.status === 'Paid') {
      return order;
    }

    // Simulate payment process delay or logic here
    const updatedOrder = await orderRepository.updateOrderStatus(orderId, 'Paid');
    
    return {
      message: 'Payment successful',
      paymentMethod: 'QRIS',
      transactionTime: new Date(),
      order: updatedOrder
    };
  }
}

export default new OrderService();

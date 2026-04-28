import prisma from '../lib/prisma.js';

class OrderRepository {
  async createOrder(orderData) {
    const { userId, shopId, barberId, serviceId, bookingDate, bookingTime, totalPrice } = orderData;
    
    return await prisma.booking.create({
      data: {
        userId: userId ? parseInt(userId) : null,
        shopId: shopId ? parseInt(shopId) : null,
        barberId: barberId ? parseInt(barberId) : null,
        serviceId: serviceId ? parseInt(serviceId) : null,
        bookingDate: new Date(bookingDate),
        bookingTime: new Date(bookingTime),
        totalPrice: totalPrice,
        status: 'pending',
        paymentStatus: 'unpaid'
      }
    });
  }

  async getOrderById(id) {
    return await prisma.booking.findUnique({
      where: { id: parseInt(id) },
      include: {
        barbershop: true,
        barber: true,
        service: true,
        user: true
      }
    });
  }

  async updateOrderStatus(id, status) {
    // Note: status in Prisma schema for Booking is BookingStatus enum
    // If input is 'Paid', we might actually want to update paymentStatus
    if (status === 'Paid') {
      return await prisma.booking.update({
        where: { id: parseInt(id) },
        data: { 
          paymentStatus: 'paid',
          status: 'confirmed'
        }
      });
    }

    return await prisma.booking.update({
      where: { id: parseInt(id) },
      data: { status: status }
    });
  }
}

export default new OrderRepository();

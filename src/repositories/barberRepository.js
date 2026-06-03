import prisma from '../lib/prisma.js';

class BarberRepository {
  async getAllBarbers() {
    return await prisma.barbershop.findMany({
      include: {
        barbers: true
      }
    });
  }

  async getBarberById(id) {
    return await prisma.barber.findUnique({
      where: { id: parseInt(id) },
      include: {
        barbershop: true
      }
    });
  }
  
  // Custom method for barbershops (as they were used in the proximity logic)
  async getAllBarbershops() {
    return await prisma.barbershop.findMany({
      include: { services: true }
    });
  }
}

export default new BarberRepository();

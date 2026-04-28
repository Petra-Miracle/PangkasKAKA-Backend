import prisma from '../lib/prisma.js';
import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';

class AuthService {
  async register(userData) {
    const { name, email, password, phone, role } = userData;

    // Check if user exists in any table
    const existingUser = await prisma.user.findFirst({
      where: { OR: [{ email }, { phone }] }
    });

    if (existingUser) {
      throw new Error('User with this email or phone already exists');
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    // Create user in the main 'users' table
    const user = await prisma.user.create({
      data: {
        name,
        email,
        phone,
        password: hashedPassword,
        role: role || 'customer'
      }
    });

    return this.generateAuthResponse(user);
  }

  async login(email, password) {
    // 1. Check in 'users' table
    let user = await prisma.user.findUnique({ where: { email } });
    let role = user?.role;

    // 2. If not found, check in 'owners' table
    if (!user) {
      user = await prisma.owner.findUnique({ where: { email } });
      role = 'owner';
    }

    // 3. If not found, check in 'karyawan' table
    if (!user) {
      user = await prisma.karyawan.findUnique({ where: { email } });
      role = 'barber';
    }

    if (!user) {
      throw new Error('Invalid email or password');
    }

    const isPasswordValid = await bcrypt.compare(password, user.password);
    if (!isPasswordValid) {
      throw new Error('Invalid email or password');
    }

    return this.generateAuthResponse(user, role);
  }

  generateAuthResponse(user, role) {
    const token = jwt.sign(
      { id: user.id, email: user.email, role: role || user.role },
      process.env.JWT_SECRET || 'pangkaskaka_secret_key',
      { expiresIn: '1d' }
    );

    const { password, ...userWithoutPassword } = user;
    return {
      user: { ...userWithoutPassword, role: role || user.role },
      token
    };
  }
}

export default new AuthService();

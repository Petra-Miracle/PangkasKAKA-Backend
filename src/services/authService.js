import prisma from '../lib/prisma.js';
import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';

class AuthService {
  async register(userData) {
    const { name, email, password, phone, role } = userData;

    // 1. Basic Validation
    if (!name || !email || !password || !phone) {
      throw new Error('Name, email, password, and phone are required');
    }

    // 2. Check if user exists in ANY table (users, owners, or karyawan)
    const [userExists, ownerExists, karyawanExists] = await Promise.all([
      prisma.user.findFirst({ where: { OR: [{ email }, { phone }] } }),
      prisma.owner.findFirst({ where: { OR: [{ email }, { phone }] } }),
      prisma.karyawan.findFirst({ where: { OR: [{ email }, { phone }] } })
    ]);

    if (userExists || ownerExists || karyawanExists) {
      throw new Error('User with this email or phone already exists');
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    // 3. Register based on role (default is customer/user)
    let newUser;
    const userRole = role || 'customer';

    if (userRole === 'owner') {
      newUser = await prisma.owner.create({
        data: { name, email, phone, password: hashedPassword }
      });
    } else if (userRole === 'barber') {
      newUser = await prisma.karyawan.create({
        data: { name, email, phone, password: hashedPassword, status: 'pending' }
      });
    } else {
      // Default to regular User
      newUser = await prisma.user.create({
        data: {
          name,
          email,
          phone,
          password: hashedPassword,
          role: 'customer'
        }
      });
    }

    return this.generateAuthResponse(newUser, userRole);
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

  async updateProfile(userId, updateData) {
    const { name, phone, address, photo } = updateData;
    
    // Check role from some source (we can check all tables or pass role)
    // For now, let's try to update in whichever table the user exists
    
    let updatedUser;
    
    // Try User table
    try {
      updatedUser = await prisma.user.update({
        where: { id: userId },
        data: { name, phone, address, photo }
      });
    } catch (e) {
      // Try Owner table
      try {
        updatedUser = await prisma.owner.update({
          where: { id: userId },
          data: { name, phone, address, photo }
        });
      } catch (e2) {
        // Try Karyawan table
        updatedUser = await prisma.karyawan.update({
          where: { id: userId },
          data: { name, phone, photo } // Karyawan doesn't have 'address' in schema
        });
      }
    }

    const { password, ...userWithoutPassword } = updatedUser;
    return userWithoutPassword;
  }
}

export default new AuthService();

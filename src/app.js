import express from 'express';
import cors from 'cors';
import morgan from 'morgan';
import dotenv from 'dotenv';
import barberRoutes from './routes/barberRoutes.js';
import orderRoutes from './routes/orderRoutes.js';
import authRoutes from './routes/authRoutes.js';
import { loggerMiddleware } from './middlewares/logger.js';
import { authMiddleware } from './middlewares/authMiddleware.js';


dotenv.config();

const app = express();

// --- Connection Bridge (CORS) ---
// Ini adalah penghubung utama. Kita mengizinkan frontend (biasanya port 5173 untuk Vite)
// untuk mengakses API backend ini.
app.use(cors({
  origin: '*', // Di production, ganti dengan URL frontend Anda
  methods: ['GET', 'POST', 'PUT', 'DELETE'],
  allowedHeaders: ['Content-Type', 'Authorization']
}));

app.use(morgan('dev'));
app.use(loggerMiddleware);
app.use(express.json());

// --- API Routes ---
app.use('/api/auth', authRoutes);
app.use('/api/barbershops', barberRoutes); // Public (anyone can see barbershops)
app.use('/api/orders', authMiddleware, orderRoutes); // Protected (must be logged in to order)

// Health Check
app.get('/', (req, res) => {
  res.json({ message: 'PangkasKAKA API is running smoothly!' });
});

export default app;

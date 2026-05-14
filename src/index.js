import dotenv from 'dotenv';
dotenv.config();

import app from './app.js';

const PORT = process.env.PORT || 5000;

const server = app.listen(PORT, '0.0.0.0', () => {
  console.log(`
  🚀 PangkasKAKA Backend Server
  📡 Server running on: http://localhost:${PORT}
  🌍 Accessible on: http://127.0.0.1:${PORT}
  🛠️  Connect your frontend to this URL
  `);
}).on('error', (err) => {
  if (err.code === 'EADDRINUSE') {
    console.error(`❌ Port ${PORT} is already in use. Please close the other process or change the PORT in .env`);
  } else {
    console.error('❌ Failed to start server:', err);
  }
});

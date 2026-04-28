import app from './app.js';

const PORT = process.env.PORT || 5000;

app.listen(PORT, () => {
  console.log(`
  🚀 PangkasKAKA Backend Server
  📡 Server running on: http://localhost:${PORT}
  🛠️  Connect your frontend to this URL
  `);
});

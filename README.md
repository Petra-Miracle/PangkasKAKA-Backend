# 🏖️ PangkasKAKA Backend

API Backend untuk PangkasKAKA - Platform Booking Barbershop Online

## 🚀 Quick Start

### Prerequisites
- Node.js 16+
- PostgreSQL 12+
- npm or yarn

### Installation

```bash
# 1. Clone repository
git clone <your-repo-url>
cd PangkasKAKA-Backend

# 2. Install dependencies
npm install

# 3. Setup environment
cp .env.example .env
# Edit .env with your database credentials

# 4. Setup database
npx prisma migrate dev --name initial_setup

# 5. Start development server
npm run dev
```

Server will run on `http://localhost:3000`

---

## 📁 Project Structure

```
src/
├── controllers/      # Request handlers
├── services/         # Business logic & validations
├── repositories/     # Database queries
├── routes/          # API endpoints
├── middlewares/     # Express middleware
├── lib/             # Utility libraries
├── data/            # Mock data
├── app.js           # Express app setup
└── index.js         # Entry point

PangkasDB/
└── prisma/
    ├── schema.prisma        # Database schema
    └── migrations/          # Migration history
```

---

## 📚 API Routes

### Authentication
- `POST /api/auth/register` - User registration
- `POST /api/auth/login` - User login

### Barbershops
- `GET /api/barbershops` - Get all barbershops (with optional lat/lng for proximity)

### Orders
- `GET /api/orders/:id` - Get order details (protected)
- `POST /api/orders` - Create new order (protected)
- `POST /api/orders/:id/pay` - Pay for order (simulation)

---

## 🗄️ Database Setup

For detailed database setup, maintenance, and troubleshooting, see:
📖 [DATABASE_SETUP.md](./DATABASE_SETUP.md)

**Quick commands:**
```bash
# View database GUI
npx prisma studio

# Create migration after schema change
npx prisma migrate dev --name <description>

# Check migration status
npx prisma migrate status

# Reset database (development only)
npx prisma migrate reset
```

---

## 📦 Dependencies

- **express** - Web framework
- **prisma** - ORM for database
- **@prisma/client** - Prisma client
- **@prisma/adapter-pg** - PostgreSQL adapter
- **pg** - PostgreSQL driver
- **cors** - Cross-Origin Resource Sharing
- **morgan** - HTTP request logger
- **dotenv** - Environment variable loader
- **jsonwebtoken** - JWT authentication
- **bcryptjs** - Password hashing

**Dev Dependencies:**
- **nodemon** - Auto-reload server
- **prisma** - CLI tools

---

## 🔧 Available Scripts

```bash
# Start production server
npm start

# Start development server with auto-reload
npm run dev

# View database with Prisma Studio
npx prisma studio

# Generate Prisma client
npx prisma generate

# Create new migration
npx prisma migrate dev --name <name>

# Apply all pending migrations
npx prisma migrate deploy
```

---

## 🔐 Environment Configuration

Create `.env` file (copy from `.env.example`):

```env
PORT=3000
NODE_ENV=development
DATABASE_URL="postgresql://user:password@localhost:5432/pangkaskaka"
```

⚠️ **Important:**
- Never commit `.env` file
- Always use `.env.example` as template
- Keep sensitive data in `.env` only

---

## 🗄️ Database Models

Main entities in Prisma schema:

- **User** - Customer users
- **Owner** - Barbershop owners
- **Barbershop** - Shop information
- **Barber** - Individual barbers
- **Booking** - Customer bookings
- **Service** - Available services
- **Review** - Customer reviews
- **Subscription** - Subscription plans

For complete schema, see: `PangkasDB/prisma/schema.prisma`

---

## 📝 Git Workflow

When working with the database:

```bash
# 1. Pull latest changes
git pull

# 2. Install/update dependencies
npm install

# 3. Apply pending migrations
npx prisma migrate deploy

# 4. Start development
npm run dev
```

**Before committing:**
- ✅ Commit migrations in `PangkasDB/prisma/migrations/`
- ✅ Commit updated `package.json` and `package-lock.json`
- ❌ Never commit `.env` file
- ❌ Never commit `node_modules/`

---

## 🚀 Deployment

### Production Setup

1. **Configure environment:**
   ```bash
   NODE_ENV=production
   DATABASE_URL="postgresql://prod_user:password@prod_host:5432/pangkaskaka"
   ```

2. **Apply migrations:**
   ```bash
   npx prisma migrate deploy
   ```

3. **Start server:**
   ```bash
   npm start
   ```

### Database Backup Before Deploy
```bash
pg_dump -U user -d pangkaskaka > backup_$(date +%Y%m%d_%H%M%S).sql
```

---

## 🐛 Troubleshooting

### npm install fails
```bash
npm cache clean --force
rm package-lock.json
npm install
```

### Database connection error
- Check PostgreSQL is running
- Verify DATABASE_URL in .env
- Test: `psql -U user -d pangkaskaka`

### Migration issues
See [DATABASE_SETUP.md](./DATABASE_SETUP.md#troubleshooting)

---

## 📞 Support

For database-related issues, refer to:
- 📖 [DATABASE_SETUP.md](./DATABASE_SETUP.md)
- 🔗 [Prisma Docs](https://www.prisma.io/docs/)
- 🔗 [PostgreSQL Docs](https://www.postgresql.org/docs/)

---

## 📄 License

Private Project - PangkasKAKA

---

**Last Updated:** April 2026
gresql.org/docs/)

---

## 📄 License

Private Project - PangkasKAKA

---

**Last Updated:** April 2026

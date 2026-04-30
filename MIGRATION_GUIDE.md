# 🔄 Database Migration Guide

This guide explains how to safely manage database schema changes using Prisma migrations.

## Understanding Migrations

**What is a migration?**
A migration is a record of database schema changes. Each migration:
- Describes what changed (added tables, columns, relationships, etc.)
- Records the SQL commands to apply those changes
- Is versioned and timestamped for tracking

---

## Common Migration Tasks

### 1. Creating a Migration (After Schema Change)

**When you modify `schema.prisma`:**

```bash
# Development environment
npx prisma migrate dev --name add_new_feature

# Example: Add new column
npx prisma migrate dev --name add_username_to_users

# Production environment (without applying)
npx prisma migrate create --name add_new_feature
```

**What this does:**
1. Detects differences between `schema.prisma` and current database
2. Generates SQL commands in a new migration folder
3. Applies migration to local database
4. Generates Prisma client

**Migration folder created:** `PangkasDB/prisma/migrations/[timestamp]_[name]/`

---

### 2. Viewing Migrations

**List all migrations:**
```bash
npx prisma migrate status
```

**Expected output:**
```
Migrations
3 migrations found in prisma/migrations

Status
✔ 20231101102000_initial_setup
✔ 20231102153000_add_user_table
✔ 20231105094500_add_booking_table

Database: pangkaskaka @ localhost:5432
```

**View migration files:**
```bash
# List all migration folders
ls -la PangkasDB/prisma/migrations/

# View specific migration SQL
cat PangkasDB/prisma/migrations/20231101102000_initial_setup/migration.sql
```

---

### 3. Applying Migrations

**Apply to development database:**
```bash
npx prisma migrate dev --name feature_name
```

**Apply pending migrations to production:**
```bash
npx prisma migrate deploy
```

**Check which migrations are pending:**
```bash
npx prisma migrate status
```

---

### 4. Viewing Current Schema

**Open Prisma Studio (GUI):**
```bash
npx prisma studio
# Opens http://localhost:5555
```

**View schema file:**
```bash
cat PangkasDB/prisma/schema.prisma
```

---

## Step-by-Step: Making a Schema Change

### Example: Add a new `phone` field to User model

**Step 1: Modify schema**
```prisma
// PangkasDB/prisma/schema.prisma
model User {
  id    Int     @id @default(autoincrement())
  name  String
  email String  @unique
  phone String  @unique  // ← NEW FIELD
  createdAt DateTime @default(now())
}
```

**Step 2: Create migration**
```bash
npx prisma migrate dev --name add_phone_to_user
```

**Step 3: Prisma will prompt you:**
```
✔ Enter a name for the new migration: › add_phone_to_user
✔ Your database will be reset. All data will be lost.

Continue? › (Y/n)
```
Press `Y` for development, `N` for production

**Step 4: Migration applied**
```
✔ Created migration in PangkasDB/prisma/migrations/20231201102345_add_phone_to_user/

✔ Database has been created at postgresql://localhost:5432/pangkaskaka
✔ Migrations applied
```

**Step 5: Commit to git**
```bash
git add PangkasDB/prisma/migrations/20231201102345_add_phone_to_user/
git add PangkasDB/prisma/schema.prisma
git commit -m "Add phone field to User model"
```

---

## Collaboration: Team Workflow

### When team member makes schema changes:

**Teammate commits migration:**
```
PangkasDB/prisma/migrations/20231205093000_add_services_table/
```

**You pull changes:**
```bash
git pull origin main
```

**Apply their migration to your database:**
```bash
npx prisma migrate deploy
```

That's it! Your database is now synced.

---

## Handling Migration Issues

### Issue 1: Schema Drift (Local changes don't match DB)

```bash
# Check current state
npx prisma migrate status

# Reset to clean state (⚠️ DEVELOPMENT ONLY - loses data)
npx prisma migrate reset
```

### Issue 2: Migration Conflicts

When multiple team members create migrations:

```bash
# Pull all migrations
git pull origin main

# Apply all in order
npx prisma migrate deploy
```

Prisma automatically handles the order (by timestamp).

### Issue 3: Need to Undo Last Migration

**Development only:**
```bash
# Delete the most recent migration folder
rm -rf PangkasDB/prisma/migrations/[latest_timestamp]_[name]/

# Reset database
npx prisma migrate reset
```

**Production:**
⚠️ Cannot easily undo. Plan carefully before deploying!

---

## Production Migration Safety

### Pre-Migration Checklist

- [ ] **Backup database**
  ```bash
  pg_dump -U user -d pangkaskaka > backup_$(date +%Y%m%d_%H%M%S).sql
  ```

- [ ] **Review migration SQL**
  ```bash
  cat PangkasDB/prisma/migrations/[timestamp]_[name]/migration.sql
  ```

- [ ] **Test on staging first**
  ```bash
  # Copy production backup to staging
  # Apply migration
  npx prisma migrate deploy
  # Verify
  npx prisma studio
  ```

- [ ] **Announce deployment**
  - Notify team
  - Schedule maintenance window if needed

### Apply Migration to Production

```bash
# 1. Go to production server
ssh user@production

# 2. Pull latest code
git pull origin main

# 3. Install dependencies
npm install

# 4. Apply migrations
npx prisma migrate deploy

# 5. Start server
npm start
```

### Verify Production Migration

```bash
# Check migration status
npx prisma migrate status

# Open Prisma Studio
npx prisma studio

# Test API endpoints
curl http://localhost:3000/api/health
```

---

## Migration File Structure

Each migration folder contains:

```
PangkasDB/prisma/migrations/20231201102345_add_phone_to_user/
├── migration.sql          # SQL commands to apply
└── migration_lock.toml    # Lock file (do not edit)
```

**migration.sql example:**
```sql
-- AddColumn
ALTER TABLE "users" ADD COLUMN "phone" VARCHAR(20) NOT NULL DEFAULT '';

-- CreateIndex
CREATE UNIQUE INDEX "users_phone_key" ON "users"("phone");
```

---

## Best Practices

✅ **DO:**
- Commit migrations immediately after creating them
- Write clear migration names: `add_column_x_to_table_y`
- Test migrations locally before pushing
- Keep migration history clean
- Backup before production migrations

❌ **DON'T:**
- Manually edit migration.sql files
- Delete migration folders
- Skip migrations in production
- Make schema changes without migrations
- Run conflicting migrations simultaneously

---

## Commands Quick Reference

```bash
# Create
npx prisma migrate dev --name feature_name

# View
npx prisma migrate status
npx prisma studio

# Apply
npx prisma migrate deploy

# Reset (dev only)
npx prisma migrate reset

# Debug
npx prisma db pull              # Pull schema from DB
npx prisma db push              # Push schema to DB
npx prisma generate             # Regenerate client
```

---

## Troubleshooting Migrations

| Problem | Solution |
|---------|----------|
| Migration fails | Check SQL syntax, revert schema change, try again |
| Can't create migration | Run `npm install`, check database connection |
| Migration takes too long | Large tables need time, don't interrupt |
| Migration corrupted DB | Restore from backup, check migration SQL |
| Prisma client outdated | `npx prisma generate` |

---

## Related Documentation

- [DATABASE_SETUP.md](./DATABASE_SETUP.md) - Database setup guide
- [Prisma Migration Docs](https://www.prisma.io/docs/orm/prisma-migrate/overview) - Official docs
- [Prisma Schema Reference](https://www.prisma.io/docs/orm/prisma-schema) - Schema syntax

---

**Last Updated:** April 2026

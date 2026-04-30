# 🤝 Contributing Guide

Thank you for contributing to PangkasKAKA Backend! This guide explains how to properly maintain and contribute to our database-centric project.

---

## Getting Started

### 1. Fork & Clone
```bash
# Clone the repository
git clone https://github.com/YOUR-USERNAME/PangkasKAKA-Backend.git
cd PangkasKAKA-Backend

# Add upstream remote
git remote add upstream https://github.com/ORIGINAL-OWNER/PangkasKAKA-Backend.git
```

### 2. Setup Development Environment
```bash
# Copy setup checklist
# See SETUP_CHECKLIST.md for detailed steps

# Quick setup:
npm install
cp .env.example .env
# Edit .env with your local database

# Create/update database
npx prisma migrate dev --name initial
```

### 3. Create Feature Branch
```bash
git checkout -b feature/your-feature-name
```

---

## Development Workflow

### Working on Features

**1. Make Changes to Code:**
```bash
# Edit your files in src/
```

**2. If You Changed Database Schema:**
```bash
# Update schema.prisma
nano PangkasDB/prisma/schema.prisma

# Create migration
npx prisma migrate dev --name add_your_feature

# This automatically:
# - Detects schema changes
# - Creates migration SQL
# - Applies to local database
# - Regenerates Prisma client
```

**3. Update .env.example if Needed:**
```bash
# If you added new environment variables
nano .env.example
```

**4. Update Tests (if applicable):**
```bash
# Add tests for your changes
# Run tests
npm test
```

### Commit Guidelines

**Clear Commit Messages:**
```bash
# DO: Clear, descriptive messages
git commit -m "Add phone field to User model"

# DO: Reference issues
git commit -m "Fix #123: User registration bug"

# DON'T: Vague messages
git commit -m "Update stuff"
```

**Commit Structure:**
```
<type>: <subject>

<body>

<footer>
```

**Types:**
- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation
- `style:` Code style (no logic change)
- `refactor:` Code restructuring
- `perf:` Performance improvement
- `test:` Tests
- `migration:` Database migration

**Examples:**
```bash
# Feature
git commit -m "feat: Add email verification to User registration"

# Bug fix
git commit -m "fix: Fix null pointer exception in barber listing"

# Migration
git commit -m "migration: Add phone field to users table"

# Documentation
git commit -m "docs: Update migration guide with rollback steps"
```

---

## Database Changes (Important!)

### Schema Changes

**ALWAYS:**
- ✅ Make schema changes in `PangkasDB/prisma/schema.prisma`
- ✅ Run `npx prisma migrate dev --name descriptive_name`
- ✅ Commit migration files
- ✅ Test with sample data

**NEVER:**
- ❌ Manually edit migration SQL files
- ❌ Delete migration folders
- ❌ Skip migrations in production
- ❌ Modify committed migrations

### Data Migrations (Rare)

If you need to transform existing data:

**1. Create regular migration first:**
```bash
npx prisma migrate dev --name add_new_field
```

**2. Create data migration script:**
```javascript
// scripts/migrate_data.js
import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();

async function main() {
  // Transform data here
  const users = await prisma.user.findMany();
  for (const user of users) {
    // Apply transformation
    await prisma.user.update({
      where: { id: user.id },
      data: { /* updates */ },
    });
  }
}

main().catch(console.error).finally(() => prisma.$disconnect());
```

**3. Run data migration:**
```bash
node scripts/migrate_data.js
```

---

## Before Pushing Changes

### Checklist

- [ ] Code follows project style
- [ ] No console.log or debug code left
- [ ] Database migrations created (if schema changed)
- [ ] Tests pass locally
- [ ] .env file NOT committed
- [ ] Dependencies updated properly
- [ ] Documentation updated

### Testing Locally

```bash
# 1. Start development server
npm run dev

# 2. Test in another terminal
curl http://localhost:3000/api/health

# 3. Test with Prisma Studio
npx prisma studio

# 4. Check database operations
# Use tools like Postman, curl, or REST Client
```

### Final Verification

```bash
# Check git status
git status

# See what will be committed
git diff --cached

# Only database files, not node_modules or .env!
```

---

## Push & Create Pull Request

### Push Branch
```bash
# Push to your fork
git push origin feature/your-feature-name

# Keep main branch updated
git checkout main
git pull upstream main
```

### Create Pull Request

**On GitHub:**
1. Go to your fork
2. Click "Compare & pull request"
3. Write clear PR title and description

**PR Description Template:**
```markdown
## Description
Brief description of changes

## Related Issue
Closes #123

## Changes Made
- Change 1
- Change 2
- Etc.

## Database Changes
- Schema changes: [Link to migration]
- Migration name: `add_feature_name`

## Testing
- [x] Tested locally
- [x] Database operations verified
- [x] API endpoints tested

## Screenshots (if UI changes)
[Add screenshots here]
```

### Code Review

**During review:**
- Address all feedback
- Make requested changes
- Keep commits organized
- Push updates: `git push origin feature/your-feature-name`

**Reviewer checklist:**
- ✅ Code quality
- ✅ Database changes safe
- ✅ Migrations correct
- ✅ Documentation updated
- ✅ No sensitive data

---

## Common Scenarios

### Scenario 1: Syncing With Main Branch

```bash
# Fetch latest
git fetch upstream

# Rebase your branch on main
git rebase upstream/main

# Resolve conflicts if any
# Then push
git push origin feature/your-feature-name --force-with-lease
```

### Scenario 2: Schema Conflict

If two people modify schema:

```bash
# Fetch updates
git fetch upstream

# See conflicts
git status

# Resolve in schema.prisma
nano PangkasDB/prisma/schema.prisma

# Create new combined migration
npx prisma migrate dev --name resolve_schema_conflict

# Commit
git add PangkasDB/
git commit -m "Resolve schema conflicts"
```

### Scenario 3: Revert Commit

```bash
# If not pushed yet
git reset HEAD~1

# If already pushed
git revert HEAD
git push origin feature/your-feature-name
```

---

## File Conventions

### Controllers
- Location: `src/controllers/`
- Naming: `featureController.js`
- Export: `export const methodName = async (req, res) => { }`

### Services
- Location: `src/services/`
- Naming: `featureService.js`
- Export: `export const operationName = async (params) => { }`

### Repositories
- Location: `src/repositories/`
- Naming: `featureRepository.js`
- Export: `export const queryName = async (params) => { }`

### Routes
- Location: `src/routes/`
- Naming: `featureRoutes.js`
- Example:
```javascript
import express from 'express';
const router = express.Router();

router.get('/', controllerMethod);
router.post('/', validateInput, controllerMethod);

export default router;
```

---

## Documentation to Update

When making changes, update:

- [ ] `README.md` - If user-facing features change
- [ ] `DATABASE_SETUP.md` - If database setup changes
- [ ] `MIGRATION_GUIDE.md` - If migration process changes
- [ ] `DEPLOYMENT_GUIDE.md` - If deployment changes
- [ ] Code comments - For complex logic
- [ ] Function JSDoc - For public functions

---

## Running Migrations Locally

After pulling someone else's changes:

```bash
# Check status
npx prisma migrate status

# If behind on migrations
npx prisma migrate deploy

# If conflicts
npx prisma migrate reset  # Development only!
```

---

## Getting Help

- 📖 Read [DATABASE_SETUP.md](./DATABASE_SETUP.md)
- 📖 Read [MIGRATION_GUIDE.md](./MIGRATION_GUIDE.md)
- 📖 Read [DEPLOYMENT_GUIDE.md](./DEPLOYMENT_GUIDE.md)
- 💬 Ask in project discussions
- 🐛 Check existing issues

---

## Project Maintainers

- **Backend Lead:** [Maintainer Name]
- **Database Admin:** [Admin Name]
- **DevOps:** [DevOps Name]

---

## Code of Conduct

- Be respectful to all contributors
- Provide constructive feedback
- Help newer contributors
- Follow the project's values

---

**Last Updated:** April 2026
**Maintained By:** [Your Team]

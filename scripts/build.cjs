const { execSync } = require('child_process');
const { existsSync } = require('fs');
const { resolve } = require('path');

try {
  execSync('git config core.hooksPath .githooks', { stdio: 'ignore' });
} catch (_) {}

const cwd = process.cwd();
const prismaCli = resolve(cwd, 'node_modules/prisma/build/index.js');
const schema = resolve(cwd, 'PangkasDB/prisma/schema.prisma');

console.log('[build] cwd:', cwd);
console.log('[build] prisma CLI path:', prismaCli);
console.log('[build] schema path:', schema);
console.log('[build] prisma CLI exists:', existsSync(prismaCli));
console.log('[build] schema exists:', existsSync(schema));

if (!existsSync(prismaCli)) {
  console.error('[build] ERROR: prisma CLI not found at', prismaCli);
  process.exit(1);
}

if (!existsSync(schema)) {
  console.error('[build] ERROR: schema file not found at', schema);
  process.exit(1);
}

try {
  // Use prisma command directly (npx) instead of node path for better cross-platform compatibility
  const out = execSync(
    'npx prisma generate --schema=' + schema,
    { cwd, encoding: 'utf8', maxBuffer: 50 * 1024 * 1024, stdio: ['pipe', 'pipe', 'pipe'] }
  );
  console.log('[build] ✓ Prisma Client generated successfully');
  console.log(out);
} catch (err) {
  console.error('[build] ====== PRISMA STDERR ======');
  console.error(err.stderr || '(no stderr)');
  console.error('[build] ====== PRISMA STDOUT ======');
  console.error(err.stdout || '(no stdout)');
  console.error('[build] ====== ERROR MESSAGE ======');
  console.error(err.message);
  process.exit(1);
}

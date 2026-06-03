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
console.log('[build] prisma CLI exists:', existsSync(prismaCli));
console.log('[build] schema exists:', existsSync(schema));

if (!existsSync(prismaCli)) {
  console.error('[build] ERROR: prisma CLI not found');
  process.exit(1);
}

if (!existsSync(schema)) {
  console.error('[build] ERROR: schema file not found');
  process.exit(1);
}

try {
  const out = execSync(
    'node ' + prismaCli + ' generate --schema=' + schema,
    { cwd, encoding: 'utf8', maxBuffer: 50 * 1024 * 1024 }
  );
  console.log('[build] OK');
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
